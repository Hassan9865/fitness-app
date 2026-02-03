import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color? buttonColor;
  final Color? buttonTextColor;
  final double? height;
  final double? width;
  final double? fontSize;
  final FontWeight? fontWeight;

  const CustomButton({
    super.key,
    required this.onPressed,
    required this.text,
    required this.buttonColor,
    required this.buttonTextColor,
    this.height,
    this.width,
    this.fontSize,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: height ?? MediaQuery.of(context).size.height / 18,
        width: width ?? MediaQuery.of(context).size.width / 1.5,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: buttonTextColor,
              fontSize: fontSize ?? MediaQuery.of(context).size.width / 18,
              fontWeight: fontWeight ?? FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}
