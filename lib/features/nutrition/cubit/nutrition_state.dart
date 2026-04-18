part of 'nutrition_cubit.dart';

class NutritionState {
  final int selectedDay;
  final int waterIntake;
  final Set<String> completedMeals;

  const NutritionState({
    this.selectedDay = 0,
    this.waterIntake = 0,
    this.completedMeals = const {},
  });

  NutritionState copyWith({
    int? selectedDay,
    int? waterIntake,
    Set<String>? completedMeals,
  }) {
    return NutritionState(
      selectedDay: selectedDay ?? this.selectedDay,
      waterIntake: waterIntake ?? this.waterIntake,
      completedMeals: completedMeals ?? this.completedMeals,
    );
  }
}
