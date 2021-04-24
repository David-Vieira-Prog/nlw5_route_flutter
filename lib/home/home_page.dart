import 'package:devquiz/challenge/challenge_page.dart';
import 'package:devquiz/core/core.dart';
import 'package:devquiz/home/widgets/appbar/app_bar_widget.dart';
import 'package:devquiz/home/widgets/level_button/level_button_widget.dart';
import 'package:devquiz/home/widgets/quiz_card/quiz_card_widget.dart';
import 'package:flutter/material.dart';

import 'home_controller.dart';
import 'home_state.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();
  @override
  void initState() {
    super.initState();
    controller.getUser();
    controller.getQuizzes();
    controller.stateNotifier.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return controller.state == HomeState.sucess
        ? Scaffold(
            appBar: AppBarWidget(user: controller.user!),
            body: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 2.0, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      LevelButton(text: "Fácil"),
                      LevelButton(text: "Médio"),
                      LevelButton(text: "Difícil"),
                      LevelButton(text: "Perito"),
                    ],
                  ),
                ),
                Expanded(
                    child: GridView.count(
                        padding: EdgeInsets.all(4),
                        mainAxisSpacing: 8,
                        crossAxisCount: 2,
                        children: controller.quizzes!
                            .map((e) => QuizCard(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => ChallengePage(
                                              title: e.title,
                                              questions: e.questions),
                                        ));
                                  },
                                  title: e.title,
                                  completed:
                                      "${e.questionsAwnsered}/${e.questions.length}",
                                  percent:
                                      e.questionsAwnsered / e.questions.length,
                                ))
                            .toList()))
              ],
            ))
        : Scaffold(
            body: Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.darkGreen),
              ),
            ),
          );
  }
}
