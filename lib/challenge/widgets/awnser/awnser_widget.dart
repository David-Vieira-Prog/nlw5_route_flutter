import 'package:devquiz/core/app_colors.dart';
import 'package:devquiz/core/app_text_styles.dart';
import 'package:devquiz/shared/models/awnser_model.dart';
import 'package:flutter/material.dart';

class Awnser extends StatelessWidget {
  final AwnserModel awnser;
  final ValueChanged<bool> onTap;
  final bool isSelected;
  final bool disabled;
  Awnser(
      {Key? key,
      required this.awnser,
      this.isSelected = false,
      required this.onTap,
      this.disabled = false})
      : super(key: key);
  Color get _selectedColorRight =>
      awnser.isRight ? AppColors.darkGreen : AppColors.darkRed;

  Color get _selectedBorderRight =>
      awnser.isRight ? AppColors.lightGreen : AppColors.lightRed;

  Color get _selectedColorCardRight =>
      awnser.isRight ? AppColors.lightGreen : AppColors.lightRed;

  Color get _selectedBorderCardRight =>
      awnser.isRight ? AppColors.green : AppColors.red;

  TextStyle get _selectedTextStyleRight =>
      awnser.isRight ? AppTextStyles.bodyDarkGreen : AppTextStyles.bodyDarkRed;

  IconData get _selectedIconRight => awnser.isRight ? Icons.check : Icons.close;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
      child: IgnorePointer(
        ignoring: disabled,
        child: GestureDetector(
          onTap: () {
            onTap(awnser.isRight);
          },
          child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: isSelected ? _selectedColorCardRight : AppColors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.fromBorderSide(
                  BorderSide(
                    color: isSelected
                        ? _selectedBorderCardRight
                        : AppColors.border,
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: Text(
                    awnser.title,
                    style: isSelected
                        ? _selectedTextStyleRight
                        : AppTextStyles.body,
                  )),
                  Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(500),
                          border: Border.fromBorderSide(BorderSide(
                              color: isSelected
                                  ? _selectedBorderRight
                                  : AppColors.border)),
                          color: isSelected
                              ? _selectedColorRight
                              : AppColors.white),
                      height: 24,
                      width: 24,
                      child: isSelected
                          ? Icon(_selectedIconRight,
                              color: AppColors.white, size: 16)
                          : null),
                ],
              )),
        ),
      ),
    );
  }
}
