import 'package:fitness_tracker/components/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HIcontab extends StatelessWidget {
  final Icon icon;
  final String text;
  final VoidCallback onPressed;

  const HIcontab({
    super.key,
    required this.icon,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final appColors = Provider.of<AppColors>(context);

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          IconButton(
            onPressed: onPressed,
            icon: icon,
            color: appColors.onSecondary,
          ),
          Text(text, style: TextStyle(color: appColors.onSecondary)),
        ],
      ),
    );
  }
}
