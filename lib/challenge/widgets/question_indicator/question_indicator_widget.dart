import 'package:devquiz/shared/widgets/progress_indicator/progress_indicator_widget.dart';
import 'package:flutter/material.dart';
import 'package:devquiz/core/core.dart';

class QuestionIndicator extends StatelessWidget {
  final int currentPage;
  final int length;
  const QuestionIndicator(
      {Key? key, required this.currentPage, required this.length})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Questão $currentPage ",
                    style: AppTextStyles.bodyLightGrey20),
                Text("de $length", style: AppTextStyles.bodyLightGrey20)
              ],
            ),
            SizedBox(height: 16),
            ProgressIndicatorWidget(value: currentPage / length)
          ],
        ));
  }
}
