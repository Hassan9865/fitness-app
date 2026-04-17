import 'package:fitness_tracker/components/app_colors.dart';
import 'package:fitness_tracker/features/home/cubit/home_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StatsRow extends StatelessWidget {
  final HomeState state;
  const StatsRow({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final appColors = Provider.of<AppColors>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Row(
        children: [
          _buildStatCard(
            appColors,
            "🔥 Calories",
            "${state.todayCalories}",
            "/ 500",
            Icons.local_fire_department,
            Colors.orange,
            (state.todayCalories / 500).clamp(0.0, 1.0),
          ),
          const SizedBox(width: 12),
          _buildStatCard(
            appColors,
            "💧 Water",
            "${state.todayWater}",
            "/ 10",
            Icons.water_drop,
            Colors.blue,
            (state.todayWater / 10).clamp(0.0, 1.0),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(
    AppColors appColors,
    String title,
    String value,
    String goal,
    IconData icon,
    Color color,
    double progress,
  ) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: appColors.primary,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(icon, color: color, size: 20),
                ),
                Text(
                  title,
                  style: TextStyle(
                    color: appColors.onSecondary.withOpacity(0.7),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  value,
                  style: TextStyle(
                    color: appColors.onSecondary,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  goal,
                  style: TextStyle(
                    color: appColors.onSecondary.withOpacity(0.5),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: LinearProgressIndicator(
                value: progress,
                backgroundColor: Colors.grey.withOpacity(0.2),
                color: color,
                minHeight: 4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
