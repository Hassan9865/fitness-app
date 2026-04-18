import 'package:fitness_tracker/components/app_colors.dart';
import 'package:fitness_tracker/features/nutrition/model/meal_item.dart';

import 'package:fitness_tracker/features/nutrition/widgets/nutrition_chip.dart';
import 'package:flutter/material.dart';

class FoodItemCard extends StatelessWidget {
  final MealItem item;
  final AppColors appColors;

  const FoodItemCard({super.key, required this.item, required this.appColors});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: appColors.background, width: 1)),
      ),
      child: Row(
        children: [
          // Food icon
          Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              color: _getFoodColor(item.name).withOpacity(0.15),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              _getFoodIcon(item.name),
              color: _getFoodColor(item.name),
              size: 24,
            ),
          ),
          const SizedBox(width: 12),
          // Food details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: TextStyle(
                    color: appColors.onSecondary,
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    NutrientChip(
                      text: '${item.calories} cal',
                      color: Colors.orange,
                    ),
                    const SizedBox(width: 8),
                    NutrientChip(
                      text: 'P: ${item.protein}g',
                      color: Colors.green,
                    ),
                    const SizedBox(width: 8),
                    NutrientChip(text: 'C: ${item.carbs}g', color: Colors.blue),
                    const SizedBox(width: 8),
                    NutrientChip(text: 'F: ${item.fat}g', color: Colors.red),
                  ],
                ),
              ],
            ),
          ),
          // Veg/Non-veg dot
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: item.isVeg ? Colors.green : Colors.red,
              shape: BoxShape.circle,
            ),
          ),
        ],
      ),
    );
  }

  IconData _getFoodIcon(String name) {
    if (name.contains('Chicken') || name.contains('Egg')) return Icons.egg;
    if (name.contains('Salad') || name.contains('Vegetable')) return Icons.eco;
    if (name.contains('Rice') || name.contains('Pasta')) return Icons.grain;
    if (name.contains('Fruit') ||
        name.contains('Apple') ||
        name.contains('Banana'))
      return Icons.apple;
    if (name.contains('Smoothie')) return Icons.local_drink;
    return Icons.restaurant;
  }

  Color _getFoodColor(String name) {
    if (name.contains('Chicken') || name.contains('Egg')) return Colors.orange;
    if (name.contains('Salad') || name.contains('Vegetable'))
      return Colors.green;
    if (name.contains('Rice') || name.contains('Pasta')) return Colors.brown;
    if (name.contains('Fruit')) return Colors.red;
    return Colors.grey;
  }
}
