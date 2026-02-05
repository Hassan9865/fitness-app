import 'dart:ui';

import 'package:fitness_tracker/components/app_colors.dart';
import 'package:fitness_tracker/features/nutrition/widgets/buildMealSection.dart';
import 'package:fitness_tracker/features/nutrition/widgets/nutritionIndicator.dart';
import 'package:flutter/material.dart';

class FoodItemCard extends StatelessWidget {
  final MealItem item;
  final AppColors appColors;
  const FoodItemCard({super.key, required this.item, required this.appColors});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 100,
        margin: const EdgeInsets.all(8).copyWith(left: 0, right: 0),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: appColors.background.withAlpha(100),
              blurRadius: 5,
              spreadRadius: 5,
              offset: Offset(4, 4),
            ),
          ],
          borderRadius: BorderRadius.circular(10),
          color: appColors.background,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Stack(
            fit: StackFit.expand,
            children: [
              // Image.asset('assets/paratha.jpg', fit: BoxFit.cover),
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Container(color: appColors.background.withAlpha(10)),
              ),
              // Dark overlay
              Container(color: appColors.background.withAlpha(50)),
              Padding(
                padding: EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          item.name,
                          style: TextStyle(
                            color: appColors.onSecondary,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '${item.calories} kcal',
                          style: TextStyle(
                            color: appColors.onPrimary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Nutritionindicator(
                          color: Colors.blue,
                          label: 'Protein',
                          value: '${item.protein}g',
                        ),
                        Nutritionindicator(
                          color: Colors.green,
                          label: 'Carbs',
                          value: '${item.carbs}g',
                        ),
                        Nutritionindicator(
                          color: Colors.red,
                          label: 'Fat',
                          value: '${item.fat}g',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
