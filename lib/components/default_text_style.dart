import 'package:fitness_tracker/components/app_colors.dart';
import 'package:flutter/material.dart';

TextStyle defaultTextStyle({
  required AppColors appColors,
  double? fontSize,
  FontWeight? fontWeight,
}) {
  return TextStyle(
    color: appColors.onSecondary,
    fontSize: fontSize ?? 16,
    fontWeight: fontWeight ?? FontWeight.w500,
    letterSpacing: 1.2,
  );
}
