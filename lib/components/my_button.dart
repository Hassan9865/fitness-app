import 'package:fitness_tracker/components/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyButton extends StatelessWidget {
  final String text;
  final Color? buttonColor;
  final Color? textColor;
  final VoidCallback onPressed;

  MyButton({
    Key? key,
    this.buttonColor,
    this.textColor,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appColors = Provider.of<AppColors>(context);

    return InkWell(
      onTap: onPressed,
      child: Container(
        height: MediaQuery.of(context).size.height / 18,
        width: MediaQuery.of(context).size.width / 1.5,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: appColors.onSecondary,
              fontSize: MediaQuery.of(context).size.width / 18,
            ),
          ),
        ),
      ),
    );
  }
}
