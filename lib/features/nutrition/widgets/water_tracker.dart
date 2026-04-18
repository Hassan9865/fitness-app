import 'package:fitness_tracker/components/app_colors.dart';
import 'package:fitness_tracker/features/nutrition/cubit/nutrition_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WaterTracker extends StatelessWidget {
  final AppColors appColors;

  const WaterTracker({super.key, required this.appColors});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NutritionCubit, NutritionState>(
      builder: (context, state) {
        final cubit = context.read<NutritionCubit>();
        return GestureDetector(
          onTap: cubit.incrementWater,
          onLongPress: cubit.resetWater,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: appColors.primary,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Icon(
                    Icons.water_drop,
                    color: Colors.blue,
                    size: 28,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '💧 Water Intake',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: LinearProgressIndicator(
                                value:
                                    state.waterIntake /
                                    NutritionCubit.waterGoal,
                                backgroundColor: Colors.grey.withOpacity(0.2),
                                color: Colors.blue,
                                minHeight: 8,
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Text(
                            '${state.waterIntake}/${NutritionCubit.waterGoal}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
