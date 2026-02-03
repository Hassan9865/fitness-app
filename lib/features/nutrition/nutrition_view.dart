import 'package:fitness_tracker/components/app_colors.dart';
import 'package:fitness_tracker/features/nutrition/widgets/buildMealSection.dart';
import 'package:fitness_tracker/features/nutrition/widgets/nutritionCircle.dart';
import 'package:fitness_tracker/features/nutrition/widgets/nutritiondays.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class NutritionScreen extends StatefulWidget {
  @override
  _NutritionScreenState createState() => _NutritionScreenState();
}

class _NutritionScreenState extends State<NutritionScreen> {
  int _selectedDay = DateTime.now().weekday - 1; // 0-6 for Monday-Sunday
  final List<String> _days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

  @override
  Widget build(BuildContext context) {
    final appColors = Provider.of<AppColors>(context);

    return Scaffold(
      // backgroundColor: Colors.grey[300],
      backgroundColor: appColors.primary,
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height / 9,
        backgroundColor: appColors.background,
        leading: InkWell(
          onTap: () {
            if (GoRouter.of(context).canPop()) {
              GoRouter.of(context).pop();
              // GoRouter.of(context).push('/bottomnavbar');
            } else {
              GoRouter.of(context).push('/bottomnavbar');
            }
          },
          child: Container(
            height: 5,
            width: 5,
            margin: const EdgeInsets.only(left: 15, top: 0),
            child: Icon(Icons.arrow_back_ios_new, color: appColors.onSecondary),
          ),
        ),
        title: Text(
          'Nutrition Plan',
          style: TextStyle(color: appColors.onSecondary),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: FloatingActionButton(
              onPressed: () {},
              child: Icon(Icons.add, color: appColors.onSecondary),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // Days of the week tabs
          NutritionDays(),
          Container(
            height: 20,
            decoration: BoxDecoration(
              color: appColors.background,
              // boxShadow: [
              //   BoxShadow(
              //   color: appColors.primary,
              //   blurRadius: 12,
              //   spreadRadius: 15,
              //   offset: Offset(10, 14),
              // ),
              // ],
              // borderRadius: BorderRadius.only(
              //   bottomLeft: Radius.circular(20),
              //   bottomRight: Radius.circular(20),
              // ),
            ),
            width: MediaQuery.of(context).size.width,
          ),
          Divider(height: 1),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16).copyWith(top: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Buildmealsection(
                    title: 'Breakfast',
                    items: [
                      MealItem(
                        name: 'Prataha',
                        calories: 320,
                        protein: 12,
                        carbs: 54,
                        fat: 6,
                      ),
                      MealItem(
                        name: 'Boiled Eggs (2)',
                        calories: 140,
                        protein: 12,
                        carbs: 1,
                        fat: 10,
                      ),
                      MealItem(
                        name: 'Green Tea',
                        calories: 5,
                        protein: 0,
                        carbs: 1,
                        fat: 0,
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Buildmealsection(
                    title: 'Lunch',
                    items: [
                      MealItem(
                        name: 'Grilled Chicken Breast',
                        calories: 165,
                        protein: 31,
                        carbs: 0,
                        fat: 3.6,
                      ),
                      MealItem(
                        name: 'Brown Rice (1 cup)',
                        calories: 215,
                        protein: 5,
                        carbs: 45,
                        fat: 1.8,
                      ),
                      MealItem(
                        name: 'Steamed Vegetables',
                        calories: 50,
                        protein: 2,
                        carbs: 10,
                        fat: 0,
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Buildmealsection(
                    title: 'Dinner',
                    items: [
                      MealItem(
                        name: 'Salmon Fillet',
                        calories: 280,
                        protein: 34,
                        carbs: 0,
                        fat: 15,
                      ),
                      MealItem(
                        name: 'Quinoa (1/2 cup)',
                        calories: 111,
                        protein: 4,
                        carbs: 20,
                        fat: 1.8,
                      ),
                      MealItem(
                        name: 'Mixed Salad',
                        calories: 80,
                        protein: 3,
                        carbs: 10,
                        fat: 4,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // Daily summary
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: appColors.background,
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Daily Total',
                      style: TextStyle(
                        color: appColors.onSecondary,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      '${_days[_selectedDay]}, ${DateTime.now().day + (_selectedDay - DateTime.now().weekday + 1)}',
                      style: TextStyle(color: appColors.secondary),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Nutritioncircle(
                      color: Colors.orange,
                      label: 'Cal',
                      value: '1550g',
                    ),
                    SizedBox(width: 10),
                    Nutritioncircle(
                      color: Colors.green,
                      label: 'P',
                      value: '14g',
                    ),
                    SizedBox(width: 10),
                    Nutritioncircle(
                      color: Colors.red,
                      label: 'C',
                      value: '15g',
                    ),
                    SizedBox(width: 10),
                    Nutritioncircle(
                      color: Colors.orange,
                      label: 'F',
                      value: '150g',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
