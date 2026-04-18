import 'package:fitness_tracker/components/app_colors.dart';
import 'package:fitness_tracker/features/workout/widgets/info_chip.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ExerciseCard extends StatelessWidget {
  final Map<String, String> item;
  final bool isCompleted;
  final VoidCallback onTap;
  final AppColors appColors;
  final double screenWidth;
  final double screenHeight;

  const ExerciseCard({
    super.key,
    required this.item,
    required this.isCompleted,
    required this.onTap,
    required this.appColors,
    required this.screenWidth,
    required this.screenHeight,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: isCompleted
              ? Colors.deepOrange.withOpacity(0.1)
              : appColors.primary,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: isCompleted
                ? Colors.deepOrange
                : Colors.deepOrange.withOpacity(0.2),
            width: isCompleted ? 1.5 : 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            // Completion circle
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isCompleted ? Colors.deepOrange : Colors.transparent,
                  border: Border.all(
                    color: isCompleted
                        ? Colors.deepOrange
                        : Colors.deepOrange.withOpacity(0.5),
                    width: 2,
                  ),
                ),
                child: isCompleted
                    ? const Icon(Icons.check, size: 18, color: Colors.white)
                    : null,
              ),
            ),
            // Title + chips
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item['title']!,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: isCompleted
                            ? Colors.deepOrange
                            : appColors.onSecondary,
                        decoration: isCompleted
                            ? TextDecoration.lineThrough
                            : null,
                      ),
                    ),
                    const SizedBox(height: 8),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          InfoChip(
                            icon: Icons.timer_outlined,
                            label: item['duration']!,
                            color: Colors.deepOrange,
                          ),
                          const SizedBox(width: 12),
                          InfoChip(
                            icon: Icons.local_fire_department,
                            label: '${item['calories']} cal',
                            color: Colors.orange,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Lottie animation
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(24),
                bottomRight: Radius.circular(24),
              ),
              child: Lottie.asset(
                item['img']!,
                width: screenWidth * 0.28,
                height: screenHeight / 7,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
