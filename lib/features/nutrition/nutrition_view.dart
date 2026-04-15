import 'package:fitness_tracker/components/app_colors.dart';
// import 'package:fitness_tracker/features/nutrition/widgets/buildMealSection.dart';
// import 'package:fitness_tracker/features/nutrition/widgets/nutritionCircle.dart';
// import 'package:fitness_tracker/features/nutrition/widgets/nutritiondays.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

// class NutritionScreen extends StatefulWidget {
//   @override
//   _NutritionScreenState createState() => _NutritionScreenState();
// }

// class _NutritionScreenState extends State<NutritionScreen> {
//   int _selectedDay = DateTime.now().weekday - 1; // 0-6 for Monday-Sunday
//   final List<String> _days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

//   @override
//   Widget build(BuildContext context) {
//     final appColors = Provider.of<AppColors>(context);

//     return Scaffold(
//       // backgroundColor: Colors.grey[300],
//       backgroundColor: appColors.primary,
//       appBar: AppBar(
//         toolbarHeight: MediaQuery.of(context).size.height / 9,
//         backgroundColor: appColors.background,
//         leading: InkWell(
//           onTap: () {
//             if (GoRouter.of(context).canPop()) {
//               GoRouter.of(context).pop();
//               // GoRouter.of(context).push('/bottomnavbar');
//             } else {
//               GoRouter.of(context).push('/bottomnavbar');
//             }
//           },
//           child: Container(
//             height: 5,
//             width: 5,
//             margin: const EdgeInsets.only(left: 15, top: 0),
//             child: Icon(Icons.arrow_back_ios_new, color: appColors.onSecondary),
//           ),
//         ),
//         title: Text(
//           'Nutrition Plan',
//           style: TextStyle(color: appColors.onSecondary),
//         ),
//         centerTitle: true,
//         actions: [
//           Padding(
//             padding: const EdgeInsets.only(right: 8.0),
//             child: FloatingActionButton(
//               onPressed: () {},
//               child: Icon(Icons.add, color: appColors.onSecondary),
//             ),
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           // Days of the week tabs
//           NutritionDays(),

//           Expanded(
//             child: SingleChildScrollView(
//               padding: EdgeInsets.all(16).copyWith(top: 50),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Buildmealsection(
//                     title: 'Breakfast',
//                     items: [
//                       MealItem(
//                         name: 'Prataha',
//                         calories: 320,
//                         protein: 12,
//                         carbs: 54,
//                         fat: 6,
//                       ),
//                       MealItem(
//                         name: 'Boiled Eggs (2)',
//                         calories: 140,
//                         protein: 12,
//                         carbs: 1,
//                         fat: 10,
//                       ),
//                       MealItem(
//                         name: 'Green Tea',
//                         calories: 5,
//                         protein: 0,
//                         carbs: 1,
//                         fat: 0,
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 20),
//                   Buildmealsection(
//                     title: 'Lunch',
//                     items: [
//                       MealItem(
//                         name: 'Grilled Chicken Breast',
//                         calories: 165,
//                         protein: 31,
//                         carbs: 0,
//                         fat: 3.6,
//                       ),
//                       MealItem(
//                         name: 'Brown Rice (1 cup)',
//                         calories: 215,
//                         protein: 5,
//                         carbs: 45,
//                         fat: 1.8,
//                       ),
//                       MealItem(
//                         name: 'Steamed Vegetables',
//                         calories: 50,
//                         protein: 2,
//                         carbs: 10,
//                         fat: 0,
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 20),
//                   Buildmealsection(
//                     title: 'Dinner',
//                     items: [
//                       MealItem(
//                         name: 'Salmon Fillet',
//                         calories: 280,
//                         protein: 34,
//                         carbs: 0,
//                         fat: 15,
//                       ),
//                       MealItem(
//                         name: 'Quinoa (1/2 cup)',
//                         calories: 111,
//                         protein: 4,
//                         carbs: 20,
//                         fat: 1.8,
//                       ),
//                       MealItem(
//                         name: 'Mixed Salad',
//                         calories: 80,
//                         protein: 3,
//                         carbs: 10,
//                         fat: 4,
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           // Daily summary
//           Container(
//             padding: EdgeInsets.all(16),
//             decoration: BoxDecoration(
//               color: appColors.background,
//               borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Daily Total',
//                       style: TextStyle(
//                         color: appColors.onSecondary,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 16,
//                       ),
//                     ),
//                     Text(
//                       '${_days[_selectedDay]}, ${DateTime.now().day + (_selectedDay - DateTime.now().weekday + 1)}',
//                       style: TextStyle(color: appColors.secondary),
//                     ),
//                   ],
//                 ),
//                 Row(
//                   children: [
//                     Nutritioncircle(
//                       color: Colors.orange,
//                       label: 'Cal',
//                       value: '1550g',
//                     ),
//                     SizedBox(width: 10),
//                     Nutritioncircle(
//                       color: Colors.green,
//                       label: 'P',
//                       value: '14g',
//                     ),
//                     SizedBox(width: 10),
//                     Nutritioncircle(
//                       color: Colors.red,
//                       label: 'C',
//                       value: '15g',
//                     ),
//                     SizedBox(width: 10),
//                     Nutritioncircle(
//                       color: Colors.orange,
//                       label: 'F',
//                       value: '150g',
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

class NutritionScreen extends StatefulWidget {
  const NutritionScreen({super.key});

  @override
  State<NutritionScreen> createState() => _NutritionScreenState();
}

class _NutritionScreenState extends State<NutritionScreen> {
  int _selectedDay = DateTime.now().weekday - 1;
  final List<String> _days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

  // Track water intake (glasses)
  int _waterIntake = 0;
  final int _waterGoal = 8;

  // Track completed meals
  Set<String> _completedMeals = {};

  // Day-wise diet plan data
  final Map<String, Map<String, List<MealItem>>> _dietPlan = {
    'Mon': {
      'Breakfast': [
        MealItem(
          name: '🥣 Oatmeal with Berries',
          calories: 350,
          protein: 12,
          carbs: 58,
          fat: 8,
          isVeg: true,
        ),
        MealItem(
          name: '🥛 Almond Milk',
          calories: 30,
          protein: 1,
          carbs: 1,
          fat: 2.5,
          isVeg: true,
        ),
      ],
      'Lunch': [
        MealItem(
          name: '🍗 Grilled Chicken Breast',
          calories: 165,
          protein: 31,
          carbs: 0,
          fat: 3.6,
          isVeg: false,
        ),
        MealItem(
          name: '🍚 Brown Rice (1 cup)',
          calories: 215,
          protein: 5,
          carbs: 45,
          fat: 1.8,
          isVeg: true,
        ),
        MealItem(
          name: '🥦 Steamed Broccoli',
          calories: 55,
          protein: 3.7,
          carbs: 11,
          fat: 0.6,
          isVeg: true,
        ),
      ],
      'Dinner': [
        MealItem(
          name: '🐟 Baked Salmon',
          calories: 280,
          protein: 34,
          carbs: 0,
          fat: 15,
          isVeg: false,
        ),
        MealItem(
          name: '🥗 Quinoa Salad',
          calories: 150,
          protein: 6,
          carbs: 27,
          fat: 3,
          isVeg: true,
        ),
      ],
      'Snacks': [
        MealItem(
          name: '🍎 Apple',
          calories: 95,
          protein: 0.5,
          carbs: 25,
          fat: 0.3,
          isVeg: true,
        ),
        MealItem(
          name: '🥜 Handful Almonds',
          calories: 160,
          protein: 6,
          carbs: 6,
          fat: 14,
          isVeg: true,
        ),
      ],
    },
    'Tue': {
      'Breakfast': [
        MealItem(
          name: '🍳 Scrambled Eggs (3)',
          calories: 210,
          protein: 18,
          carbs: 3,
          fat: 14,
          isVeg: false,
        ),
        MealItem(
          name: '🍞 Whole Grain Toast',
          calories: 80,
          protein: 3,
          carbs: 15,
          fat: 1,
          isVeg: true,
        ),
      ],
      'Lunch': [
        MealItem(
          name: '🥙 Chickpea Wrap',
          calories: 420,
          protein: 15,
          carbs: 65,
          fat: 12,
          isVeg: true,
        ),
        MealItem(
          name: '🥒 Cucumber Salad',
          calories: 30,
          protein: 1,
          carbs: 6,
          fat: 0,
          isVeg: true,
        ),
      ],
      'Dinner': [
        MealItem(
          name: '🍝 Whole Wheat Pasta',
          calories: 380,
          protein: 14,
          carbs: 68,
          fat: 7,
          isVeg: true,
        ),
        MealItem(
          name: '🥫 Marinara Sauce',
          calories: 70,
          protein: 2,
          carbs: 10,
          fat: 2.5,
          isVeg: true,
        ),
      ],
      'Snacks': [
        MealItem(
          name: '🍌 Banana',
          calories: 105,
          protein: 1.3,
          carbs: 27,
          fat: 0.4,
          isVeg: true,
        ),
        MealItem(
          name: '🥛 Greek Yogurt',
          calories: 100,
          protein: 17,
          carbs: 6,
          fat: 0.7,
          isVeg: true,
        ),
      ],
    },
    'Wed': {
      'Breakfast': [
        MealItem(
          name: '🥤 Protein Smoothie',
          calories: 300,
          protein: 25,
          carbs: 35,
          fat: 8,
          isVeg: true,
        ),
        MealItem(
          name: '🌰 Chia Seeds (1 tbsp)',
          calories: 60,
          protein: 2,
          carbs: 5,
          fat: 4,
          isVeg: true,
        ),
      ],
      'Lunch': [
        MealItem(
          name: '🍣 Tuna Salad',
          calories: 350,
          protein: 30,
          carbs: 10,
          fat: 20,
          isVeg: false,
        ),
        MealItem(
          name: '🍞 Rye Crackers',
          calories: 120,
          protein: 3,
          carbs: 22,
          fat: 2,
          isVeg: true,
        ),
      ],
      'Dinner': [
        MealItem(
          name: '🍗 Turkey Meatballs',
          calories: 320,
          protein: 35,
          carbs: 12,
          fat: 15,
          isVeg: false,
        ),
        MealItem(
          name: '🍝 Zucchini Noodles',
          calories: 40,
          protein: 2,
          carbs: 8,
          fat: 0.5,
          isVeg: true,
        ),
      ],
      'Snacks': [
        MealItem(
          name: '🍊 Orange',
          calories: 62,
          protein: 1.2,
          carbs: 15,
          fat: 0.2,
          isVeg: true,
        ),
        MealItem(
          name: '🧀 Cottage Cheese',
          calories: 98,
          protein: 11,
          carbs: 3.6,
          fat: 4.3,
          isVeg: true,
        ),
      ],
    },
    'Thu': {
      'Breakfast': [
        MealItem(
          name: '🥞 Banana Pancakes',
          calories: 380,
          protein: 10,
          carbs: 55,
          fat: 14,
          isVeg: true,
        ),
        MealItem(
          name: '🍯 Honey (1 tbsp)',
          calories: 64,
          protein: 0.1,
          carbs: 17,
          fat: 0,
          isVeg: true,
        ),
      ],
      'Lunch': [
        MealItem(
          name: '🍛 Lentil Curry',
          calories: 280,
          protein: 15,
          carbs: 45,
          fat: 6,
          isVeg: true,
        ),
        MealItem(
          name: '🍚 Basmati Rice',
          calories: 200,
          protein: 4,
          carbs: 45,
          fat: 0.5,
          isVeg: true,
        ),
      ],
      'Dinner': [
        MealItem(
          name: '🍤 Shrimp Stir-fry',
          calories: 300,
          protein: 35,
          carbs: 20,
          fat: 10,
          isVeg: false,
        ),
        MealItem(
          name: '🥬 Bok Choy',
          calories: 20,
          protein: 2,
          carbs: 3,
          fat: 0,
          isVeg: true,
        ),
      ],
      'Snacks': [
        MealItem(
          name: '🥝 Kiwi (2)',
          calories: 84,
          protein: 1.6,
          carbs: 20,
          fat: 0.8,
          isVeg: true,
        ),
        MealItem(
          name: '🍫 Dark Chocolate (1 square)',
          calories: 50,
          protein: 1,
          carbs: 4,
          fat: 3.5,
          isVeg: true,
        ),
      ],
    },
    'Fri': {
      'Breakfast': [
        MealItem(
          name: '🥑 Avocado Toast',
          calories: 320,
          protein: 8,
          carbs: 28,
          fat: 20,
          isVeg: true,
        ),
        MealItem(
          name: '🍳 Poached Egg',
          calories: 72,
          protein: 6,
          carbs: 0.4,
          fat: 4.8,
          isVeg: false,
        ),
      ],
      'Lunch': [
        MealItem(
          name: '🍔 Veggie Burger',
          calories: 350,
          protein: 15,
          carbs: 45,
          fat: 14,
          isVeg: true,
        ),
        MealItem(
          name: '🍟 Sweet Potato Fries',
          calories: 180,
          protein: 2,
          carbs: 27,
          fat: 8,
          isVeg: true,
        ),
      ],
      'Dinner': [
        MealItem(
          name: '🍕 Margherita Pizza',
          calories: 450,
          protein: 18,
          carbs: 55,
          fat: 18,
          isVeg: true,
        ),
        MealItem(
          name: '🥗 Side Salad',
          calories: 40,
          protein: 1,
          carbs: 8,
          fat: 0.5,
          isVeg: true,
        ),
      ],
      'Snacks': [
        MealItem(
          name: '🍓 Strawberries (1 cup)',
          calories: 49,
          protein: 1,
          carbs: 12,
          fat: 0.5,
          isVeg: true,
        ),
        MealItem(
          name: '🥜 Peanut Butter (1 tbsp)',
          calories: 94,
          protein: 4,
          carbs: 3.5,
          fat: 8,
          isVeg: true,
        ),
      ],
    },
    'Sat': {
      'Breakfast': [
        MealItem(
          name: '🍳 Full English Breakfast',
          calories: 550,
          protein: 28,
          carbs: 35,
          fat: 35,
          isVeg: false,
        ),
        MealItem(
          name: '☕ Black Coffee',
          calories: 5,
          protein: 0,
          carbs: 0,
          fat: 0,
          isVeg: true,
        ),
      ],
      'Lunch': [
        MealItem(
          name: '🍜 Chicken Noodle Soup',
          calories: 280,
          protein: 20,
          carbs: 35,
          fat: 8,
          isVeg: false,
        ),
        MealItem(
          name: '🥖 Bread Roll',
          calories: 120,
          protein: 4,
          carbs: 22,
          fat: 1.5,
          isVeg: true,
        ),
      ],
      'Dinner': [
        MealItem(
          name: '🥩 Steak',
          calories: 450,
          protein: 45,
          carbs: 0,
          fat: 30,
          isVeg: false,
        ),
        MealItem(
          name: '🥔 Mashed Potatoes',
          calories: 210,
          protein: 4,
          carbs: 35,
          fat: 8,
          isVeg: true,
        ),
      ],
      'Snacks': [
        MealItem(
          name: '🍦 Frozen Yogurt',
          calories: 150,
          protein: 5,
          carbs: 28,
          fat: 3,
          isVeg: true,
        ),
        MealItem(
          name: '🍿 Air-popped Popcorn',
          calories: 30,
          protein: 1,
          carbs: 6,
          fat: 0.5,
          isVeg: true,
        ),
      ],
    },
    'Sun': {
      'Breakfast': [
        MealItem(
          name: '🥞 French Toast',
          calories: 350,
          protein: 12,
          carbs: 42,
          fat: 16,
          isVeg: true,
        ),
        MealItem(
          name: '🍁 Maple Syrup',
          calories: 52,
          protein: 0,
          carbs: 13,
          fat: 0,
          isVeg: true,
        ),
      ],
      'Lunch': [
        MealItem(
          name: '🥗 Buddha Bowl',
          calories: 420,
          protein: 14,
          carbs: 55,
          fat: 18,
          isVeg: true,
        ),
        MealItem(
          name: '🥑 Tahini Dressing',
          calories: 90,
          protein: 3,
          carbs: 4,
          fat: 8,
          isVeg: true,
        ),
      ],
      'Dinner': [
        MealItem(
          name: '🍣 Sushi Roll',
          calories: 320,
          protein: 16,
          carbs: 45,
          fat: 9,
          isVeg: false,
        ),
        MealItem(
          name: '🥟 Miso Soup',
          calories: 35,
          protein: 3,
          carbs: 5,
          fat: 1,
          isVeg: true,
        ),
      ],
      'Snacks': [
        MealItem(
          name: '🍎 Apple',
          calories: 95,
          protein: 0.5,
          carbs: 25,
          fat: 0.3,
          isVeg: true,
        ),
        MealItem(
          name: '🧀 Cheese Stick',
          calories: 80,
          protein: 6,
          carbs: 1,
          fat: 6,
          isVeg: true,
        ),
      ],
    },
  };

  // Meal order for display
  final List<String> _mealOrder = ['Breakfast', 'Lunch', 'Snacks', 'Dinner'];

  // Calculate daily totals
  Map<String, double> _getDailyTotals() {
    final dayKey = _days[_selectedDay];
    final meals = _dietPlan[dayKey] ?? {};

    double totalCal = 0;
    double totalProtein = 0;
    double totalCarbs = 0;
    double totalFat = 0;

    for (var mealItems in meals.values) {
      for (var item in mealItems) {
        totalCal += item.calories;
        totalProtein += item.protein;
        totalCarbs += item.carbs;
        totalFat += item.fat;
      }
    }

    return {
      'calories': totalCal,
      'protein': totalProtein,
      'carbs': totalCarbs,
      'fat': totalFat,
    };
  }

  void _toggleWaterIntake() {
    setState(() {
      if (_waterIntake < _waterGoal) {
        _waterIntake++;
      }
    });
  }

  void _resetWaterIntake() {
    setState(() {
      _waterIntake = 0;
    });
  }

  void _toggleMealCompletion(String mealName) {
    setState(() {
      if (_completedMeals.contains(mealName)) {
        _completedMeals.remove(mealName);
      } else {
        _completedMeals.add(mealName);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final appColors = Provider.of<AppColors>(context);
    final totals = _getDailyTotals();
    final dayKey = _days[_selectedDay];
    final meals = _dietPlan[dayKey] ?? {};
    final totalMeals = meals.values.expand((i) => i).length;
    final completedCount = _completedMeals.length;

    return Scaffold(
      backgroundColor: appColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => context.go('/bottomnavbar'),
          icon: Icon(Icons.arrow_back_ios, color: appColors.onSecondary),
        ),
        title: Text(
          '🥗 Nutrition Plan',
          style: TextStyle(
            color: appColors.onSecondary,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: _showAddFoodDialog,
            icon: Icon(Icons.add_circle_outline, color: Colors.green),
          ),
          IconButton(
            onPressed: _showSettings,
            icon: Icon(Icons.settings_outlined, color: appColors.onSecondary),
          ),
        ],
      ),
      body: Column(
        children: [
          // 📅 Days Tabs (Improved)
          _buildDayTabs(appColors),

          // 📊 Macros Progress Bars
          _buildMacrosProgress(appColors, totals),

          // 💧 Water Intake Tracker
          _buildWaterTracker(appColors),

          // 🍽️ Meals List
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: _mealOrder.map((mealType) {
                if (!meals.containsKey(mealType)) return const SizedBox();
                return _buildMealSection(
                  appColors,
                  mealType,
                  meals[mealType]!,
                  completedCount,
                  totalMeals,
                );
              }).toList(),
            ),
          ),

          // 📈 Daily Summary Bottom Bar
          _buildDailySummary(appColors, totals),
        ],
      ),
    );
  }

  Widget _buildDayTabs(AppColors appColors) {
    return Container(
      height: 100,
      margin: const EdgeInsets.symmetric(vertical: 12),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: _days.length,
        itemBuilder: (context, index) {
          final isSelected = _selectedDay == index;
          final dayName = _days[index];
          final date = DateTime.now().add(
            Duration(days: index - (DateTime.now().weekday - 1)),
          );

          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedDay = index;
                _completedMeals.clear();
              });
            },
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
                      color: isSelected ? Colors.white : appColors.onSecondary,
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
  }

  Widget _buildMacrosProgress(AppColors appColors, Map<String, double> totals) {
    // Daily goals
    const goalCalories = 2000;
    const goalProtein = 120;
    const goalCarbs = 250;
    const goalFat = 55;

    final calPercent = (totals['calories']! / goalCalories).clamp(0.0, 1.0);
    final proteinPercent = (totals['protein']! / goalProtein).clamp(0.0, 1.0);
    final carbsPercent = (totals['carbs']! / goalCarbs).clamp(0.0, 1.0);
    final fatPercent = (totals['fat']! / goalFat).clamp(0.0, 1.0);

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
                '${totals['calories']!.toInt()} / $goalCalories cal',
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          _buildMacroBar(
            '🔥 Calories',
            calPercent,
            Colors.orange,
            '${totals['calories']!.toInt()}',
            '$goalCalories',
          ),
          _buildMacroBar(
            '💪 Protein',
            proteinPercent,
            Colors.green,
            '${totals['protein']!.toInt()}g',
            '${goalProtein}g',
          ),
          _buildMacroBar(
            '🍚 Carbs',
            carbsPercent,
            Colors.blue,
            '${totals['carbs']!.toInt()}g',
            '${goalCarbs}g',
          ),
          _buildMacroBar(
            '🥑 Fat',
            fatPercent,
            Colors.red,
            '${totals['fat']!.toInt()}g',
            '${goalFat}g',
          ),
        ],
      ),
    );
  }

  Widget _buildMacroBar(
    String label,
    double percent,
    Color color,
    String current,
    String goal,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
              Text(
                '$current / $goal',
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: percent,
              backgroundColor: Colors.grey.withOpacity(0.2),
              color: color,
              minHeight: 6,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWaterTracker(AppColors appColors) {
    return GestureDetector(
      onTap: _toggleWaterIntake,
      onLongPress: _resetWaterIntake,
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
              child: const Icon(Icons.water_drop, color: Colors.blue, size: 28),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '💧 Water Intake',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: LinearProgressIndicator(
                            value: _waterIntake / _waterGoal,
                            backgroundColor: Colors.grey.withOpacity(0.2),
                            color: Colors.blue,
                            minHeight: 8,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        '$_waterIntake/$_waterGoal',
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
  }

  Widget _buildMealSection(
    AppColors appColors,
    String mealType,
    List<MealItem> items,
    int completedCount,
    int totalMeals,
  ) {
    final mealKey = '${_days[_selectedDay]}_$mealType';
    final isCompleted = _completedMeals.contains(mealKey);

    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: appColors.primary,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Meal header with checkbox
          GestureDetector(
            onTap: () => _toggleMealCompletion(mealKey),
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
                  Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: isCompleted ? Colors.green : Colors.grey,
                        width: 2,
                      ),
                      color: isCompleted ? Colors.green : Colors.transparent,
                    ),
                    child: isCompleted
                        ? const Icon(Icons.check, size: 16, color: Colors.white)
                        : null,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      _getMealIcon(mealType) + ' ' + mealType,
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
                      style: const TextStyle(color: Colors.green, fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Meal items list
          ...items.map((item) => _buildFoodItemCard(item, appColors)),
        ],
      ),
    );
  }

  Widget _buildFoodItemCard(MealItem item, AppColors appColors) {
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
                    _buildNutrientChip('${item.calories} cal', Colors.orange),
                    const SizedBox(width: 8),
                    _buildNutrientChip('P: ${item.protein}g', Colors.green),
                    const SizedBox(width: 8),
                    _buildNutrientChip('C: ${item.carbs}g', Colors.blue),
                    const SizedBox(width: 8),
                    _buildNutrientChip('F: ${item.fat}g', Colors.red),
                  ],
                ),
              ],
            ),
          ),

          // Veg/Non-veg indicator
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

  Widget _buildNutrientChip(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: 10,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildDailySummary(AppColors appColors, Map<String, double> totals) {
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
          _buildSummaryItem(
            '🔥',
            '${totals['calories']!.toInt()}',
            'Calories',
            Colors.orange,
          ),
          _buildSummaryItem(
            '💪',
            '${totals['protein']!.toInt()}',
            'Protein',
            Colors.green,
          ),
          _buildSummaryItem(
            '🍚',
            '${totals['carbs']!.toInt()}',
            'Carbs',
            Colors.blue,
          ),
          _buildSummaryItem(
            '🥑',
            '${totals['fat']!.toInt()}',
            'Fat',
            Colors.red,
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryItem(
    String icon,
    String value,
    String label,
    Color color,
  ) {
    return Column(
      children: [
        Text(icon, style: const TextStyle(fontSize: 20)),
        const SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        Text(label, style: const TextStyle(color: Colors.grey, fontSize: 10)),
      ],
    );
  }

  String _getMealIcon(String mealType) {
    switch (mealType) {
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

  IconData _getFoodIcon(String foodName) {
    if (foodName.contains('Chicken') || foodName.contains('Egg'))
      return Icons.egg;
    if (foodName.contains('Salad') || foodName.contains('Vegetable'))
      return Icons.eco;
    if (foodName.contains('Rice') || foodName.contains('Pasta'))
      return Icons.grain;
    if (foodName.contains('Fruit') ||
        foodName.contains('Apple') ||
        foodName.contains('Banana'))
      return Icons.apple;
    if (foodName.contains('Smoothie')) return Icons.local_drink;
    return Icons.restaurant;
  }

  Color _getFoodColor(String foodName) {
    if (foodName.contains('Chicken') || foodName.contains('Egg'))
      return Colors.orange;
    if (foodName.contains('Salad') || foodName.contains('Vegetable'))
      return Colors.green;
    if (foodName.contains('Rice') || foodName.contains('Pasta'))
      return Colors.brown;
    if (foodName.contains('Fruit')) return Colors.red;
    return Colors.grey;
  }

  void _showAddFoodDialog() {
    // TODO: Implement add custom food dialog
  }

  void _showSettings() {
    // TODO: Implement nutrition settings
  }
}

// MealItem Model (updated)
class MealItem {
  final String name;
  final int calories;
  final double protein;
  final double carbs;
  final double fat;
  final bool isVeg;

  MealItem({
    required this.name,
    required this.calories,
    required this.protein,
    required this.carbs,
    required this.fat,
    this.isVeg = true,
  });
}
