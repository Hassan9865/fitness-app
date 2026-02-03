import 'package:fitness_tracker/components/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Nutritionindicator extends StatelessWidget {
  final Color color;
  final String label;
  final String value;
  const Nutritionindicator({
    super.key,
    required this.color,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final appColors = Provider.of<AppColors>(context);

    return Column(
      children: [
        Container(
          width: 6,
          height: 6,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            color: appColors.onSecondary,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: TextStyle(fontSize: 10, color: appColors.onSecondary),
        ),
      ],
    );
  }
}
