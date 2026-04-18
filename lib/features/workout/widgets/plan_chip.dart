import 'package:fitness_tracker/components/app_colors.dart';
import 'package:flutter/material.dart';

class PlanChip extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isSelected;
  final AppColors appColors;
  final VoidCallback onTap;

  const PlanChip({
    super.key,
    required this.title,
    required this.icon,
    required this.isSelected,
    required this.appColors,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? Colors.deepOrange : appColors.primary,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: isSelected
                ? Colors.deepOrange
                : Colors.deepOrange.withOpacity(0.3),
          ),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 18,
              color: isSelected ? Colors.white : Colors.deepOrange,
            ),
            const SizedBox(width: 6),
            Text(
              title,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.deepOrange,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
