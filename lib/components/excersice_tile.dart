import 'package:fitness_tracker/components/app_colors.dart';
import 'package:fitness_tracker/components/default_text_style.dart';
import 'package:flutter/material.dart';

class ExerciseTile extends StatelessWidget {
  final Map exercises;
  final AppColors appColors;
  const ExerciseTile({
    super.key,
    required this.exercises,
    required this.appColors,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 0),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
      decoration: BoxDecoration(
        color: appColors.background,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Image with better styling
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 6,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(exercises["image"]!, fit: BoxFit.cover),
            ),
          ),

          // Exercise name with improved gradient text
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                exercises["name"]!,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: appColors.onSecondary,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),

          // Reps counter with better styling
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: appColors.background,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: appColors.onPrimary, width: 2),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Center(
              child: Text(
                exercises["reps"]!,
                style: defaultTextStyle(
                  appColors: appColors,
                ).copyWith(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
