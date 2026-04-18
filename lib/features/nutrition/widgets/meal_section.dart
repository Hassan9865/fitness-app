import 'package:fitness_tracker/components/app_colors.dart';
import 'package:fitness_tracker/features/nutrition/cubit/nutrition_cubit.dart';
import 'package:fitness_tracker/features/nutrition/model/meal_item.dart';
import 'package:fitness_tracker/features/nutrition/widgets/food_item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MealSection extends StatelessWidget {
  final String mealType;
  final List<MealItem> items;
  final String mealKey;
  final AppColors appColors;

  const MealSection({
    super.key,
    required this.mealType,
    required this.items,
    required this.mealKey,
    required this.appColors,
  });

  String _getMealIcon(String type) {
    switch (type) {
      case 'Breakfast':
        return '🌅';
      case 'Lunch':
        return '☀️';
      case 'Snacks':
        return '🍿';
      case 'Dinner':
        return '🌙';
      default:
        return '🍽️';
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NutritionCubit, NutritionState>(
      builder: (context, state) {
        final isCompleted = state.completedMeals.contains(mealKey);
        return Container(
          margin: const EdgeInsets.only(bottom: 20),
          decoration: BoxDecoration(
            color: appColors.primary,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Meal header
              GestureDetector(
                onTap: () => context.read<NutritionCubit>().toggleMeal(mealKey),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: isCompleted ? Colors.green.withOpacity(0.1) : null,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Row(
                    children: [
                      // Completion circle
                      Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: isCompleted ? Colors.green : Colors.grey,
                            width: 2,
                          ),
                          color: isCompleted
                              ? Colors.green
                              : Colors.transparent,
                        ),
                        child: isCompleted
                            ? const Icon(
                                Icons.check,
                                size: 16,
                                color: Colors.white,
                              )
                            : null,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          '${_getMealIcon(mealType)} $mealType',
                          style: TextStyle(
                            color: appColors.onSecondary,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.green.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          '${items.length} items',
                          style: const TextStyle(
                            color: Colors.green,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Food items
              ...items.map(
                (item) => FoodItemCard(item: item, appColors: appColors),
              ),
            ],
          ),
        );
      },
    );
  }
}
