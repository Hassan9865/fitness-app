import 'package:fitness_tracker/components/app_colors.dart';
import 'package:fitness_tracker/features/nutrition/cubit/nutrition_cubit.dart';
import 'package:fitness_tracker/features/nutrition/widgets/summary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DailySummary extends StatelessWidget {
  final AppColors appColors;

  const DailySummary({super.key, required this.appColors});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NutritionCubit, NutritionState>(
      builder: (context, state) {
        final totals = context.read<NutritionCubit>().getDailyTotals();
        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: appColors.primary,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, -2),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SummaryItem(
                icon: '🔥',
                value: '${totals['calories']!.toInt()}',
                label: 'Calories',
                color: Colors.orange,
              ),
              SummaryItem(
                icon: '💪',
                value: '${totals['protein']!.toInt()}',
                label: 'Protein',
                color: Colors.green,
              ),
              SummaryItem(
                icon: '🍚',
                value: '${totals['carbs']!.toInt()}',
                label: 'Carbs',
                color: Colors.blue,
              ),
              SummaryItem(
                icon: '🥑',
                value: '${totals['fat']!.toInt()}',
                label: 'Fat',
                color: Colors.red,
              ),
            ],
          ),
        );
      },
    );
  }
}
