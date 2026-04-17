import 'package:fitness_tracker/components/app_colors.dart';
import 'package:fitness_tracker/features/home/cubit/home_cubit.dart';
import 'package:fitness_tracker/features/home/cubit/home_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WaterIntake extends StatelessWidget {
  final HomeState state;
  final VoidCallback? onAdd;
  const WaterIntake({super.key, required this.state, this.onAdd});

  @override
  Widget build(BuildContext context) {
    final appColors = Provider.of<AppColors>(context);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: appColors.primary,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "💧 Water Intake",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${state.todayWater} / ${state.waterGoal} glasses",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.lightBlueAccent,
                ),
              ),
              GestureDetector(
                onTap: state.todayWater < state.waterGoal
                    ? () => context.read<HomeCubit>().toggleWater()
                    : null,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.add, color: Colors.blue, size: 18),
                      SizedBox(width: 4),
                      Text("Add Glass", style: TextStyle(color: Colors.blue)),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: List.generate(8, (index) {
              return Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 2),
                  height: 8,
                  decoration: BoxDecoration(
                    color: index < state.todayWater
                        ? Colors.blue
                        : Colors.grey.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
