import 'package:flutter_bloc/flutter_bloc.dart';
import 'workout_state.dart';

class WorkoutCubit extends Cubit<WorkoutState> {
  WorkoutCubit() : super(const WorkoutState());

  static const List<String> days = [
    'Mon',
    'Tues',
    'Wed',
    'Thurs',
    'Fri',
    'Sat',
    'Sun',
  ];

  static const Map<String, List<Map<String, String>>> exercises = {
    'Mon': [
      {
        'title': '🔥 Warm Up: Jumping jack',
        'duration': '30 sec',
        'calories': '15',
        'img': 'assets/animations/Jumping Jack.json',
      },
      {
        'title': '❤️ Cardio: Burpee and jump',
        'duration': '12 reps',
        'calories': '45',
        'img': 'assets/animations/Burpee and Jump Exercise.json',
      },
      {
        'title': '🦵 Lower Body: Squat reach',
        'duration': '15 reps',
        'calories': '30',
        'img': 'assets/animations/Squat Reach.json',
      },
      {
        'title': '💪 Upper Body: Wide arm push up',
        'duration': '10 reps',
        'calories': '25',
        'img': 'assets/animations/Wide_arm_push_up.json',
      },
      {
        'title': '🧘 Core: Reverse crunches',
        'duration': '15 reps',
        'calories': '20',
        'img': 'assets/animations/Reverse Crunches.json',
      },
      {
        'title': '❤️ Cardio: Jumping squats',
        'duration': '12 reps',
        'calories': '35',
        'img': 'assets/animations/Jumping_squats.json',
      },
      {
        'title': '🧘‍♂️ Cool Down: Shoulder stretch',
        'duration': '30 sec',
        'calories': '10',
        'img': 'assets/animations/Shoulder Stretch.json',
      },
    ],
    'Tues': [
      {
        'title': '🔥 Warm Up: Inchworm',
        'duration': '8 reps',
        'calories': '20',
        'img': 'assets/animations/Inchworm.json',
      },
      {
        'title': '❤️ Cardio: Split jump',
        'duration': '12 reps',
        'calories': '40',
        'img': 'assets/animations/Split Jump Exercise.json',
      },
      {
        'title': '🦵 Lower Body: Squat kicks',
        'duration': '15 reps each leg',
        'calories': '35',
        'img': 'assets/animations/Squat kicks.json',
      },
      {
        'title': '🧘 Core: Seated abs circle',
        'duration': '30 sec',
        'calories': '15',
        'img': 'assets/animations/Seated abs circles.json',
      },
      {
        'title': '💪 Upper Body: Punches',
        'duration': '30 sec fast',
        'calories': '30',
        'img': 'assets/animations/Punches.json',
      },
      {
        'title': '💪 Upper Body: T plank',
        'duration': '10 reps each side',
        'calories': '25',
        'img': 'assets/animations/T Plank Excercise.json',
      },
      {
        'title': '🧘‍♂️ Cool Down: Walking hip opener',
        'duration': '30 sec',
        'calories': '10',
        'img': 'assets/animations/walking_hip_opener_standard.json',
      },
    ],
    'Wed': [
      {
        'title': '🔥 Warm Up: Walking hip opener',
        'duration': '30 sec',
        'calories': '10',
        'img': 'assets/animations/walking_hip_opener_standard.json',
      },
      {
        'title': '🦵 Lower Body: Jumping squats',
        'duration': '15 reps',
        'calories': '40',
        'img': 'assets/animations/Jumping_squats.json',
      },
      {
        'title': '❤️ Cardio: Split jump',
        'duration': '12 reps',
        'calories': '40',
        'img': 'assets/animations/Split Jump Exercise.json',
      },
      {
        'title': '🦵 Lower Body: Squat reach',
        'duration': '15 reps',
        'calories': '30',
        'img': 'assets/animations/Squat Reach.json',
      },
      {
        'title': '🦵 Lower Body: Squat kicks',
        'duration': '15 reps',
        'calories': '35',
        'img': 'assets/animations/Squat kicks.json',
      },
      {
        'title': '🧘 Core: Reverse crunches',
        'duration': '15 reps',
        'calories': '20',
        'img': 'assets/animations/Reverse crunches.json',
      },
      {
        'title': '🧘‍♂️ Cool Down: Inchworm slow',
        'duration': '6 reps',
        'calories': '15',
        'img': 'assets/animations/Inchworm.json',
      },
    ],
    'Thurs': [
      {
        'title': '🔥 Warm Up: Shoulder stretch',
        'duration': '30 sec',
        'calories': '10',
        'img': 'assets/animations/Shoulder Stretch.json',
      },
      {
        'title': '💪 Upper Body: Staggered push ups',
        'duration': '8-10 reps',
        'calories': '30',
        'img': 'assets/animations/Staggered_push_ups.json',
      },
      {
        'title': '💪 Upper Body: Wide arm push up',
        'duration': '10 reps',
        'calories': '25',
        'img': 'assets/animations/Wide_arm_push_up.json',
      },
      {
        'title': '💪 Upper Body: T plank',
        'duration': '8 reps each side',
        'calories': '25',
        'img': 'assets/animations/T Plank Excercise.json',
      },
      {
        'title': '🧘 Core: Seated abs circle',
        'duration': '30 sec',
        'calories': '15',
        'img': 'assets/animations/Seated abs circles.json',
      },
      {
        'title': '🧘‍♂️ Cool Down: Walking hip opener',
        'duration': '30 sec',
        'calories': '10',
        'img': 'assets/animations/walking_hip_opener_standard.json',
      },
      {
        'title': '🧘‍♂️ Cool Down: Shoulder stretch',
        'duration': '30 sec',
        'calories': '10',
        'img': 'assets/animations/Shoulder Stretch.json',
      },
    ],
    'Fri': [
      {
        'title': '🔥 Warm Up: Jumping jack',
        'duration': '30 sec',
        'calories': '15',
        'img': 'assets/animations/Jumping Jack.json',
      },
      {
        'title': '❤️ Cardio: Burpee and jump',
        'duration': '10 reps',
        'calories': '45',
        'img': 'assets/animations/Burpee and Jump Exercise.json',
      },
      {
        'title': '🦵 Lower Body: Jumping squats',
        'duration': '12 reps',
        'calories': '40',
        'img': 'assets/animations/Jumping_squats.json',
      },
      {
        'title': '💪 Upper Body: Punches',
        'duration': '30 sec',
        'calories': '30',
        'img': 'assets/animations/Punches.json',
      },
      {
        'title': '❤️ Cardio: Split jump',
        'duration': '10 reps',
        'calories': '40',
        'img': 'assets/animations/Split Jump Exercise.json',
      },
      {
        'title': '🧘 Core: Seated abs circle',
        'duration': '30 sec',
        'calories': '15',
        'img': 'assets/animations/Seated abs circles.json',
      },
      {
        'title': '🧘‍♂️ Cool Down: Inchworm slow',
        'duration': '6 reps',
        'calories': '15',
        'img': 'assets/animations/Inchworm.json',
      },
    ],
    'Sat': [
      {
        'title': '🔥 Warm Up: Walking hip opener',
        'duration': '30 sec',
        'calories': '10',
        'img': 'assets/animations/walking_hip_opener_standard.json',
      },
      {
        'title': '🧘 Core: Reverse crunches',
        'duration': '12 reps',
        'calories': '20',
        'img': 'assets/animations/Reverse Crunches.json',
      },
      {
        'title': '🧘 Core: Seated abs circle',
        'duration': '30 sec',
        'calories': '15',
        'img': 'assets/animations/Seated abs circles.json',
      },
      {
        'title': '💪 Upper Body: T plank',
        'duration': '8 reps each side',
        'calories': '25',
        'img': 'assets/animations/T Plank Excercise.json',
      },
      {
        'title': '🧘‍♂️ Cool Down: Shoulder stretch',
        'duration': '30 sec',
        'calories': '10',
        'img': 'assets/animations/Shoulder Stretch.json',
      },
      {
        'title': '🧘‍♂️ Cool Down: Walking hip opener',
        'duration': '30 sec',
        'calories': '10',
        'img': 'assets/animations/walking_hip_opener_standard.json',
      },
      {
        'title': '🧘‍♂️ Cool Down: Inchworm slow',
        'duration': '6 reps',
        'calories': '15',
        'img': 'assets/animations/Inchworm.json',
      },
    ],
    'Sun': [
      {
        'title': '😴 Rest Day - Complete Rest',
        'duration': 'Full Day',
        'calories': '0',
        'img': 'assets/animations/Rest day.json',
      },
      {
        'title': '🚶 Light Walk',
        'duration': '20 mins',
        'calories': '80',
        'img': 'assets/animations/Light walk.json',
      },
      {
        'title': '🧘‍♂️ Deep Stretching',
        'duration': '15 mins',
        'calories': '40',
        'img': 'assets/animations/Deep stretching.json',
      },
    ],
  };

  static const Map<String, List<Map<String, String>>> fullBodyPlan = {
    'exercises': [
      {
        'title': '🔥 Jumping Jack',
        'duration': '45 sec',
        'calories': '25',
        'img': 'assets/animations/Jumping Jack.json',
      },
      {
        'title': '💪 Push Ups',
        'duration': '12 reps',
        'calories': '30',
        'img': 'assets/animations/Wide_arm_push_up.json',
      },
      {
        'title': '🦵 Squats',
        'duration': '15 reps',
        'calories': '35',
        'img': 'assets/animations/Squat Reach.json',
      },
      {
        'title': '❤️ Burpees',
        'duration': '10 reps',
        'calories': '50',
        'img': 'assets/animations/Burpee and Jump Exercise.json',
      },
      {
        'title': '🧘 Plank',
        'duration': '30 sec',
        'calories': '20',
        'img': 'assets/animations/T Plank Excercise.json',
      },
    ],
  };

  static List<Map<String, String>> getCardioPlan() => [
    {
      'title': '❤️ Burpee and Jump',
      'duration': '12 reps',
      'calories': '50',
      'img': 'assets/animations/Burpee and Jump Exercise.json',
    },
    {
      'title': '❤️ Split Jump',
      'duration': '15 reps',
      'calories': '45',
      'img': 'assets/animations/Split Jump Exercise.json',
    },
    {
      'title': '❤️ Jumping Squats',
      'duration': '15 reps',
      'calories': '40',
      'img': 'assets/animations/Jumping_squats.json',
    },
    {
      'title': '❤️ Squat Kicks',
      'duration': '20 reps',
      'calories': '35',
      'img': 'assets/animations/Squat kicks.json',
    },
    {
      'title': '🔥 Jumping Jack',
      'duration': '45 sec',
      'calories': '30',
      'img': 'assets/animations/Jumping Jack.json',
    },
  ];

  static List<Map<String, String>> getCorePlan() => [
    {
      'title': '🧘 Reverse Crunches',
      'duration': '15 reps',
      'calories': '25',
      'img': 'assets/animations/Reverse Crunches.json',
    },
    {
      'title': '🧘 Seated Abs Circle',
      'duration': '30 sec',
      'calories': '20',
      'img': 'assets/animations/Seated abs circles.json',
    },
    {
      'title': '🧘 T Plank',
      'duration': '10 reps each side',
      'calories': '30',
      'img': 'assets/animations/T Plank Excercise.json',
    },
    {
      'title': '💪 Plank',
      'duration': '45 sec',
      'calories': '25',
      'img': 'assets/animations/Wide_arm_push_up.json',
    },
  ];

  // ─── Actions ────────────────────────────────────────────────────────────────

  void selectPlan(String plan) {
    emit(state.copyWith(selectedPlan: plan, completedWorkouts: 0));
  }

  void updateTabIndex(int index) {
    final day = days[index];
    emit(
      state.copyWith(
        currentTabIndex: index,
        completedWorkouts: state.completedExercises[day]?.length ?? 0,
      ),
    );
  }

  void toggleExercise(String dayKey, int index) {
    // Deep-copy the map so Cubit detects the change
    final updated = Map<String, Set<int>>.from(
      state.completedExercises.map((k, v) => MapEntry(k, Set<int>.from(v))),
    );

    updated.putIfAbsent(dayKey, () => {});

    if (updated[dayKey]!.contains(index)) {
      updated[dayKey]!.remove(index);
    } else {
      updated[dayKey]!.add(index);
    }

    emit(
      state.copyWith(
        completedExercises: updated,
        completedWorkouts: updated[dayKey]?.length ?? 0,
      ),
    );
  }

  // ─── Helpers ────────────────────────────────────────────────────────────────

  List<Map<String, String>> getExercisesForPlan() {
    switch (state.selectedPlan) {
      case 'Full Body':
        return fullBodyPlan['exercises']!;
      case 'Cardio':
        return getCardioPlan();
      case 'Core':
        return getCorePlan();
      default:
        return [];
    }
  }

  int getTotalExercises() {
    if (state.selectedPlan == 'Weekly') {
      return exercises[days[state.currentTabIndex]]?.length ?? 0;
    }
    return 0;
  }
}
