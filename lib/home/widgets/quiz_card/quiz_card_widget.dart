import 'package:devquiz/shared/widgets/progress_indicator/progress_indicator_widget.dart';
import 'package:flutter/material.dart';
import 'package:devquiz/core/core.dart';

class QuizCard extends StatelessWidget {
  final String title;
  final String completed;
  final double percent;
  final VoidCallback onTap;
  const QuizCard(
      {Key? key,
      required this.title,
      required this.completed,
      required this.percent,
      required this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: InkWell(
        overlayColor: MaterialStateProperty.all(AppColors.grey),
        child: GestureDetector(
          onTap: onTap,
          child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                  border: Border.fromBorderSide(
                    BorderSide(
                      color: AppColors.border,
                    ),
                  ),
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      width: 40,
                      height: 40,
                      child: Image.asset(AppImages.blocks)),
                  SizedBox(height: 24),
                  Text(title, style: AppTextStyles.heading15),
                  SizedBox(height: 24),
                  Row(children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        completed,
                        style: AppTextStyles.body11,
                      ),
                    ),
                    Expanded(
                        flex: 4,
                        child: ProgressIndicatorWidget(
                          value: percent,
                        ))
                  ])
                ],
              )),
        ),
      ),
    );
  }
}
