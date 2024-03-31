import 'package:flutter/material.dart';
import 'package:loanxtimate/consts/app_colors.dart';

class CustomDefaultTextStyle {
  const CustomDefaultTextStyle({
    this.color = AppColors.grey,
    this.fontSize = 16,
    this.fontWeight = FontWeight.w600,
  });

  final Color color;
  final double fontSize;
  final FontWeight fontWeight;

  TextStyle build() {
    return TextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
    );
  }
}
