import 'package:fitness_tracker/components/app_colors.dart';
import 'package:fitness_tracker/features/home/cubit/home_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Achivements extends StatelessWidget {
  final HomeState state;
  const Achivements({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final appColors = Provider.of<AppColors>(context);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "🏆 Recent Achievements",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 80,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.achievements.length,
              itemBuilder: (context, index) {
                final achievement = state.achievements[index];
                return Container(
                  width: 80,
                  margin: const EdgeInsets.only(right: 12),
                  decoration: BoxDecoration(
                    color: appColors.primary,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: achievement.unlocked
                          ? Colors.amber
                          : Colors.grey.withOpacity(0.3),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        achievement.icon,
                        style: TextStyle(
                          fontSize: 30,
                          color: achievement.unlocked
                              ? Colors.amber
                              : Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        achievement.name,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 10,
                          color: achievement.unlocked
                              ? appColors.onSecondary
                              : Colors.grey,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
