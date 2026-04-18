import 'dart:math';

import 'package:fitness_tracker/features/home/cubit/home_state.dart';
import 'package:fitness_tracker/features/home/models/achivement.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(_initialState()) {
    loadInitialData();
  }

  static HomeState _initialState() {
    return HomeState(
      userName: "Hassan",
      userLevel: 3,
      userXP: 450,
      nextLevelXP: 1000,
      todaySteps: 6842,
      todayGoalSteps: 10000,
      todayCalories: 320,
      todayCaloriesGoal: 500,
      todayWater: 5,
      waterGoal: 8,
      // workouts: [],
      achievements: [],
      quote: "",
    );
  }

  // void loadInitialData() {
  //   emit(state.copyWith(workouts: _dummyWorkouts(), quote: _randomQuote()));
  // }

  void loadInitialData() {
    emit(state.copyWith(quote: _randomQuote()));
    loadAchievements();
  }

  void toggleWater() {
    if (state.todayWater < state.waterGoal) {
      emit(state.copyWith(todayWater: state.todayWater + 1));
    }
  }

  // void toggleWorkout(int index) {
  //   final updated = List<TodayWorkout>.from(state.workouts);

  //   updated[index].isCompleted = !updated[index].isCompleted;

  //   int calories = state.todayCalories;
  //   calories += updated[index].isCompleted
  //       ? updated[index].calories
  //       : -updated[index].calories;

  //   emit(state.copyWith(workouts: updated, todayCalories: calories));
  // }

  // Helpers
  // List<TodayWorkout> _dummyWorkouts() => [
  //   TodayWorkout(name: "Push Ups", duration: "3 sets", calories: 60),
  //   TodayWorkout(name: "Squats", duration: "3 sets", calories: 70),
  // ];

  String _randomQuote() {
    final quotes = [
      "💪 Don't stop when you're tired",
      "🔥 The only bad workout is none",
      "💪 Don't stop when you're tired. Stop when you're done!",
      "🔥 The only bad workout is the one that didn't happen.",
      "🌟 Your only limit is your mind.",
      "🏆 Success starts with self-discipline.",
      "⚡ Make your future self proud!",
    ];
    return quotes[Random().nextInt(quotes.length)];
  }

  void loadAchievements() {
    emit(
      state.copyWith(
        achievements: [
          HomeAchievement(name: "7 Day Streak", icon: "🔥", unlocked: true),
          HomeAchievement(name: "1000 Calories", icon: "⚡", unlocked: true),
          HomeAchievement(name: "Early Bird", icon: "🌅", unlocked: false),
          HomeAchievement(name: "Perfect Week", icon: "⭐", unlocked: false),
        ],
      ),
    );
  }
}
