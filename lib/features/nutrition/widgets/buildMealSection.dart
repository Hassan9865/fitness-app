import 'package:fitness_tracker/components/app_colors.dart';
import 'package:fitness_tracker/components/food_item_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Buildmealsection extends StatelessWidget {
  final String title;
  final List<MealItem> items;
  const Buildmealsection({super.key, required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    final appColors = Provider.of<AppColors>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: appColors.onSecondary,
            fontSize: 23,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 20),
        Column(
          children: [
            ...items.map(
              (item) => FoodItemCard(item: item, appColors: appColors),
            ),
          ],
        ),
      ],
    );
  }
}

class MealItem {
  final String name;
  final int calories;
  final double protein;
  final double carbs;
  final double fat;

  MealItem({
    required this.name,
    required this.calories,
    required this.protein,
    required this.carbs,
    required this.fat,
  });
}
