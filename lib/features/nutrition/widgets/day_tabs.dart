import 'package:fitness_tracker/components/app_colors.dart';
import 'package:fitness_tracker/features/nutrition/cubit/nutrition_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DayTabs extends StatelessWidget {
  final AppColors appColors;

  const DayTabs({super.key, required this.appColors});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NutritionCubit, NutritionState>(
      builder: (context, state) {
        return Container(
          height: 100,
          margin: const EdgeInsets.symmetric(vertical: 12),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: NutritionCubit.days.length,
            itemBuilder: (context, index) {
              final isSelected = state.selectedDay == index;
              final dayName = NutritionCubit.days[index];
              final date = DateTime.now().add(
                Duration(days: index - (DateTime.now().weekday - 1)),
              );

              return GestureDetector(
                onTap: () => context.read<NutritionCubit>().selectDay(index),
                child: Container(
                  width: 65,
                  margin: const EdgeInsets.only(right: 12),
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.green : appColors.primary,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: isSelected
                          ? Colors.green
                          : Colors.grey.withOpacity(0.3),
                    ),
                    boxShadow: isSelected
                        ? [
                            BoxShadow(
                              color: Colors.green.withOpacity(0.3),
                              blurRadius: 8,
                              offset: const Offset(0, 4),
                            ),
                          ]
                        : null,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        dayName,
                        style: TextStyle(
                          color: isSelected
                              ? Colors.white
                              : appColors.onSecondary,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${date.day}',
                        style: TextStyle(
                          color: isSelected
                              ? Colors.white70
                              : appColors.onSecondary.withOpacity(0.7),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
