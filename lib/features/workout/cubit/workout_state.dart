class WorkoutState {
  final String selectedPlan;
  final int completedWorkouts;
  final Map<String, Set<int>> completedExercises;
  final int currentTabIndex;

  const WorkoutState({
    this.selectedPlan = 'Weekly',
    this.completedWorkouts = 0,
    this.completedExercises = const {},
    this.currentTabIndex = 0,
  });

  WorkoutState copyWith({
    String? selectedPlan,
    int? completedWorkouts,
    Map<String, Set<int>>? completedExercises,
    int? currentTabIndex,
  }) {
    return WorkoutState(
      selectedPlan: selectedPlan ?? this.selectedPlan,
      completedWorkouts: completedWorkouts ?? this.completedWorkouts,
      completedExercises: completedExercises ?? this.completedExercises,
      currentTabIndex: currentTabIndex ?? this.currentTabIndex,
    );
  }
}
