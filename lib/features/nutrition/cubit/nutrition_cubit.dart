import 'package:fitness_tracker/features/nutrition/model/meal_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'nutrition_state.dart';

class NutritionCubit extends Cubit<NutritionState> {
  NutritionCubit()
    : super(NutritionState(selectedDay: DateTime.now().weekday - 1));

  // ─── Constants ──────────────────────────────────────────────────────────────

  static const List<String> days = [
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
    'Sat',
    'Sun',
  ];

  static const List<String> mealOrder = [
    'Breakfast',
    'Lunch',
    'Snacks',
    'Dinner',
  ];

  static const int waterGoal = 8;

  static const int goalCalories = 2000;
  static const int goalProtein = 120;
  static const int goalCarbs = 250;
  static const int goalFat = 55;

  static const Map<String, Map<String, List<MealItem>>> dietPlan = {
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

  // ─── Actions ────────────────────────────────────────────────────────────────

  void selectDay(int index) {
    emit(state.copyWith(selectedDay: index, completedMeals: {}));
  }

  void incrementWater() {
    if (state.waterIntake < waterGoal) {
      emit(state.copyWith(waterIntake: state.waterIntake + 1));
    }
  }

  void resetWater() {
    emit(state.copyWith(waterIntake: 0));
  }

  void toggleMeal(String mealKey) {
    final updated = Set<String>.from(state.completedMeals);
    if (updated.contains(mealKey)) {
      updated.remove(mealKey);
    } else {
      updated.add(mealKey);
    }
    emit(state.copyWith(completedMeals: updated));
  }

  // ─── Helpers ────────────────────────────────────────────────────────────────

  Map<String, double> getDailyTotals() {
    final meals = dietPlan[days[state.selectedDay]] ?? {};
    double cal = 0, protein = 0, carbs = 0, fat = 0;
    for (final items in meals.values) {
      for (final item in items) {
        cal += item.calories;
        protein += item.protein;
        carbs += item.carbs;
        fat += item.fat;
      }
    }
    return {'calories': cal, 'protein': protein, 'carbs': carbs, 'fat': fat};
  }

  Map<String, List<MealItem>> getMealsForSelectedDay() {
    return dietPlan[days[state.selectedDay]] ?? {};
  }
}
