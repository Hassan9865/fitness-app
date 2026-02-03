import 'package:fitness_tracker/components/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyTextfeild extends StatelessWidget {
  final String? text;
  final Icon? icon;
  final Color? color;
  final Color? hintTxtColor;
  final bool ispassword;
  final String? label;

  final TextEditingController? controller;
  const MyTextfeild({
    super.key,
    this.text,
    this.icon,
    this.color,
    this.hintTxtColor,
    this.controller,
    this.ispassword = false,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    final appColors = Provider.of<AppColors>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label ?? "",
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.width / 27,
            color: appColors.onSecondary,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 5),
        TextField(
          style: TextStyle(color: appColors.onSecondary),
          controller: controller,
          obscureText: ispassword,
          decoration: InputDecoration(
            hintText: text,
            hintStyle: TextStyle(color: hintTxtColor),
            prefixIcon: icon,
            filled: true,
            fillColor: color,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          ),
        ),
      ],
    );
  }
}
