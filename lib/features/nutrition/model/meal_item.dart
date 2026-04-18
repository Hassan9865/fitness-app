class MealItem {
  final String name;
  final int calories;
  final double protein;
  final double carbs;
  final double fat;
  final bool isVeg;

  const MealItem({
    required this.name,
    required this.calories,
    required this.protein,
    required this.carbs,
    required this.fat,
    this.isVeg = true,
  });
}
