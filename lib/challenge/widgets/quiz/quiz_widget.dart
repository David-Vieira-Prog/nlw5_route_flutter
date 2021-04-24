import 'package:devquiz/challenge/widgets/awnser/awnser_widget.dart';
import 'package:devquiz/core/app_text_styles.dart';
import 'package:devquiz/shared/models/question_model.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  final QuestionModel question;
  final ValueChanged<bool> onSelected;
  const Quiz({Key? key, required this.question, required this.onSelected})
      : super(key: key);

  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  int indexSelected = -1;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Container(
          child: Column(
        children: [
          SizedBox(height: 64),
          Text(widget.question.title, style: AppTextStyles.heading),
          SizedBox(height: 24),
          for (var i = 0; i < widget.question.awnsers.length; i++)
            Awnser(
              isSelected: indexSelected == i,
              awnser: widget.question.awnsers[i],
              disabled: indexSelected != -1,
              onTap: (value) {
                indexSelected = i;
                setState(() {});
                Future.delayed(Duration(seconds: 2))
                    .then((_) => widget.onSelected(value));
              },
            )
        ],
      )),
    );
  }
}
