import 'package:fitness_tracker/components/app_colors.dart';
import 'package:fitness_tracker/features/home/cubit/home_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class XpProgress extends StatelessWidget {
  final HomeState state;
  const XpProgress({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final appColors = Provider.of<AppColors>(context);

    final xpProgress = state.userXP / state.nextLevelXP;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: appColors.primary,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.deepOrange.withOpacity(0.2),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(
              "Lvl ${state.userLevel}",
              style: const TextStyle(
                color: Colors.deepOrange,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${state.userXP} / ${state.nextLevelXP} XP",
                      style: TextStyle(
                        fontSize: 12,
                        color: appColors.onSecondary.withOpacity(0.7),
                      ),
                    ),
                    Text(
                      "${(xpProgress * 100).toInt()}%",
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.deepOrange,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: LinearProgressIndicator(
                    value: xpProgress,
                    backgroundColor: Colors.grey.withOpacity(0.2),
                    color: Colors.deepOrange,
                    minHeight: 6,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
