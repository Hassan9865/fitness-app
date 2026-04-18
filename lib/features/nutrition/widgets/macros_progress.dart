import 'package:fitness_tracker/components/app_colors.dart';
import 'package:fitness_tracker/features/nutrition/cubit/nutrition_cubit.dart';
import 'package:fitness_tracker/features/nutrition/widgets/macro_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MacrosProgress extends StatelessWidget {
  final AppColors appColors;

  const MacrosProgress({super.key, required this.appColors});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NutritionCubit, NutritionState>(
      builder: (context, state) {
        final totals = context.read<NutritionCubit>().getDailyTotals();

        final calPercent = (totals['calories']! / NutritionCubit.goalCalories)
            .clamp(0.0, 1.0);
        final proteinPercent = (totals['protein']! / NutritionCubit.goalProtein)
            .clamp(0.0, 1.0);
        final carbsPercent = (totals['carbs']! / NutritionCubit.goalCarbs)
            .clamp(0.0, 1.0);
        final fatPercent = (totals['fat']! / NutritionCubit.goalFat).clamp(
          0.0,
          1.0,
        );

        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: appColors.primary,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '📊 Daily Macros',
                    style: TextStyle(
                      color: appColors.onSecondary,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    '${totals['calories']!.toInt()} / ${NutritionCubit.goalCalories} cal',
                    style: const TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              MacroBar(
                label: '🔥 Calories',
                percent: calPercent,
                color: Colors.orange,
                current: '${totals['calories']!.toInt()}',
                goal: '${NutritionCubit.goalCalories}',
              ),
              MacroBar(
                label: '💪 Protein',
                percent: proteinPercent,
                color: Colors.green,
                current: '${totals['protein']!.toInt()}g',
                goal: '${NutritionCubit.goalProtein}g',
              ),
              MacroBar(
                label: '🍚 Carbs',
                percent: carbsPercent,
                color: Colors.blue,
                current: '${totals['carbs']!.toInt()}g',
                goal: '${NutritionCubit.goalCarbs}g',
              ),
              MacroBar(
                label: '🥑 Fat',
                percent: fatPercent,
                color: Colors.red,
                current: '${totals['fat']!.toInt()}g',
                goal: '${NutritionCubit.goalFat}g',
              ),
            ],
          ),
        );
      },
    );
  }
}
