import 'package:fitness_tracker/components/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class QuickAction extends StatelessWidget {
  const QuickAction({super.key});

  @override
  Widget build(BuildContext context) {
    final appColors = Provider.of<AppColors>(context);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "⚡ Quick Actions",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              _buildActionButton(
                context,
                appColors,
                "Start Workout",
                Icons.fitness_center,
                Colors.deepOrange,
                '/workoutview',
              ),
              const SizedBox(width: 12),
              _buildActionButton(
                context,
                appColors,
                "Log Meal",
                Icons.restaurant,
                Colors.green,
                '/nutritionview',
              ),
              const SizedBox(width: 12),
              _buildActionButton(
                context,
                appColors,
                "View Progress",
                Icons.trending_up,
                Colors.blue,
                '/progressview',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(
    BuildContext context,
    AppColors appColors,
    String label,
    IconData icon,
    Color color,
    String route,
  ) {
    return Expanded(
      child: GestureDetector(
        onTap: () => GoRouter.of(context).push(route),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: appColors.primary,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: color.withOpacity(0.3)),
          ),
          child: Column(
            children: [
              Icon(icon, color: color, size: 24),
              const SizedBox(height: 6),
              Text(
                label,
                style: TextStyle(color: appColors.onSecondary, fontSize: 11),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
