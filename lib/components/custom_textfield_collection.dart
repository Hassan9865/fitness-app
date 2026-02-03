import 'package:fitness_tracker/components/app_colors.dart';
import 'package:fitness_tracker/components/default_text_style.dart';
import 'package:flutter/material.dart';

class CustomTextFieldCollection extends StatelessWidget {
  final AppColors appColors;
  final String? type;
  final String? hintText;
  final String? labelText;
  final String? errorText;
  final TextEditingController controller;
  final bool? obscureText;
  final bool? enabled;
  final bool? readOnly;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  const CustomTextFieldCollection({
    super.key,
    required this.appColors,
    this.type,
    this.hintText,
    this.labelText,
    this.errorText,
    required this.controller,
    this.obscureText = false,
    this.enabled = true,
    this.readOnly = false,
    this.validator,
    this.onChanged,
    this.onFieldSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case "Tile":
        return TextFormField(
          enabled: enabled,
          readOnly: readOnly!,
          validator: validator,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              color: appColors.onSecondary.withAlpha(150),
              fontSize: MediaQuery.of(context).size.width / 25,
            ),
            filled: true,
            fillColor: appColors.primary,
            contentPadding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.width / 25,
              horizontal: MediaQuery.of(context).size.width / 25,
            ),
            border: OutlineInputBorder(),
          ),
          style: defaultTextStyle(appColors: appColors),
          cursorColor: appColors.onSecondary,
          obscureText: obscureText!,
          onChanged: onChanged,
          onFieldSubmitted: onFieldSubmitted,
        );
      default:
        return TextFormField(
          enabled: enabled,
          readOnly: readOnly!,
          validator: validator,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              color: appColors.onSecondary.withAlpha(150),
              fontSize: MediaQuery.of(context).size.width / 25,
            ),
            filled: true,
            fillColor: appColors.primary,
            contentPadding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.width / 25,
              horizontal: MediaQuery.of(context).size.width / 25,
            ),
          ),
          style: defaultTextStyle(appColors: appColors),
          cursorColor: appColors.onSecondary,
          obscureText: obscureText!,
          onChanged: onChanged,
          onFieldSubmitted: onFieldSubmitted,
        );
    }
  }
}
