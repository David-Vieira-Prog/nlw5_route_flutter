import 'package:devquiz/core/core.dart';
import 'package:flutter/material.dart';

class Chart extends StatefulWidget {
  final double percent;

  const Chart({Key? key, required this.percent}) : super(key: key);
  @override
  _ChartState createState() => _ChartState();
}

class _ChartState extends State<Chart> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> _animation;
  void initAnimation() {
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    _animation = Tween<double>(begin: 0.0, end: widget.percent)
        .animate(animationController);
    animationController.forward();
  }

  @override
  void initState() {
    initAnimation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 80,
        width: 80,
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, _) => Stack(
            children: [
              Center(
                child: Container(
                  height: 80,
                  width: 80,
                  child: CircularProgressIndicator(
                    strokeWidth: 10,
                    value: _animation.value.toInt() / 100,
                    backgroundColor: AppColors.chartSecondary,
                    valueColor:
                        AlwaysStoppedAnimation<Color>(AppColors.chartPrimary),
                  ),
                ),
              ),
              Center(
                  child: Text("${_animation.value.toInt()}%",
                      style: AppTextStyles.heading))
            ],
          ),
        ));
  }
}
