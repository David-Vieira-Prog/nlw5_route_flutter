import 'package:devquiz/home/widgets/chart/chart_widget.dart';
import 'package:flutter/material.dart';
import 'package:devquiz/core/core.dart';

class ScoreCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
          height: 136,
          decoration: BoxDecoration(
              color: AppColors.white, borderRadius: BorderRadius.circular(15)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(flex: 1, child: Chart()),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.only(left: 24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Vamos começar', style: AppTextStyles.heading),
                      Text('Complete os desafios e avançe em conhecimento',
                          style: AppTextStyles.body)
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}
