import 'package:fitness_tracker/components/app_colors.dart';
import 'package:fitness_tracker/features/workout/cubit/workout_cubit%20.dart';
import 'package:fitness_tracker/features/workout/cubit/workout_state.dart';
import 'package:fitness_tracker/features/workout/widgets/exercise_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExerciseList extends StatelessWidget {
  final List<Map<String, String>> exercises;
  final String dayKey;
  final AppColors appColors;
  final double screenWidth;
  final double screenHeight;

  const ExerciseList({
    super.key,
    required this.exercises,
    required this.dayKey,
    required this.appColors,
    required this.screenWidth,
    required this.screenHeight,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkoutCubit, WorkoutState>(
      builder: (context, state) {
        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: exercises.length,
          itemBuilder: (context, index) {
            final isCompleted =
                state.completedExercises[dayKey]?.contains(index) ?? false;
            return ExerciseCard(
              item: exercises[index],
              isCompleted: isCompleted,
              appColors: appColors,
              screenWidth: screenWidth,
              screenHeight: screenHeight,
              onTap: () =>
                  context.read<WorkoutCubit>().toggleExercise(dayKey, index),
            );
          },
        );
      },
    );
  }
}
