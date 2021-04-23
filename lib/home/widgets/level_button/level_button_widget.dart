import 'package:flutter/material.dart';
import 'package:devquiz/core/core.dart';
import 'package:google_fonts/google_fonts.dart';

class LevelButton extends StatelessWidget {
  final String text;
  LevelButton({
    Key? key,
    required this.text,
  })   : assert(["Fácil", "Médio", "Difícil", "Perito"].contains(text)),
        super(key: key);
  final config = {
    "Fácil": {
      "color": AppColors.levelButtonFacil,
      "borderColor": AppColors.levelButtonBorderFacil,
      "fontColor": AppColors.levelButtonTextFacil
    },
    "Médio": {
      "color": AppColors.levelButtonMedio,
      "borderColor": AppColors.levelButtonBorderMedio,
      "fontColor": AppColors.levelButtonTextMedio
    },
    "Difícil": {
      "color": AppColors.levelButtonDificil,
      "borderColor": AppColors.levelButtonBorderDificil,
      "fontColor": AppColors.levelButtonTextDificil
    },
    "Perito": {
      "color": AppColors.levelButtonPerito,
      "borderColor": AppColors.levelButtonBorderPerito,
      "fontColor": AppColors.levelButtonTextPerito
    }
  };
  Color get color => config[text]!['color']!;
  Color get bordercolor => config[text]!['borderColor']!;
  Color get fontColor => config[text]!['fontColor']!;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(
            28,
          ),
          border: Border.fromBorderSide(BorderSide(color: bordercolor))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 26.0, vertical: 6),
        child: Text(
          text,
          style: GoogleFonts.notoSans(
            color: fontColor,
            fontSize: 13,
          ),
        ),
      ),
    );
  }
}
