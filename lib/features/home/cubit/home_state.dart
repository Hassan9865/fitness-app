import 'package:fitness_tracker/features/home/models/achivement.dart';

class HomeState {
  final String userName;
  final int userLevel;
  final int userXP;
  final int nextLevelXP;

  final int todaySteps;
  final int todayGoalSteps;
  final int todayCalories;
  final int todayCaloriesGoal;
  final int todayWater;
  final int waterGoal;

  // final List<TodayWorkout> workouts;
  final List<HomeAchievement> achievements;

  final String quote;

  HomeState({
    required this.userName,
    required this.userLevel,
    required this.userXP,
    required this.nextLevelXP,
    required this.todaySteps,
    required this.todayGoalSteps,
    required this.todayCalories,
    required this.todayCaloriesGoal,
    required this.todayWater,
    required this.waterGoal,
    // required this.workouts,
    required this.achievements,
    required this.quote,
  });

  HomeState copyWith({
    String? userName,
    int? userLevel,
    int? userXP,
    int? todayCalories,
    int? todayWater,
    // List<TodayWorkout>? workouts,
    List<HomeAchievement>? achievements,
    String? quote,
  }) {
    return HomeState(
      userName: userName ?? this.userName,
      userLevel: userLevel ?? this.userLevel,
      userXP: userXP ?? this.userXP,
      nextLevelXP: nextLevelXP,
      todaySteps: todaySteps,
      todayGoalSteps: todayGoalSteps,
      todayCalories: todayCalories ?? this.todayCalories,
      todayCaloriesGoal: todayCaloriesGoal,
      todayWater: todayWater ?? this.todayWater,
      waterGoal: waterGoal,
      // workouts: workouts ?? this.workouts,
      achievements: achievements ?? this.achievements,
      quote: quote ?? this.quote,
    );
  }
}
