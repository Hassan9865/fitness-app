import 'package:fitness_tracker/components/app_colors.dart';
import 'package:fitness_tracker/features/workout/cubit/workout_cubit%20.dart';
import 'package:fitness_tracker/features/workout/cubit/workout_state.dart';
import 'package:fitness_tracker/features/workout/widgets/plan_chip.dart';
import 'package:fitness_tracker/features/workout/widgets/progress_card.dart';
import 'package:fitness_tracker/features/workout/widgets/exercise_list.dart';
import 'package:fitness_tracker/features/workout/widgets/weekly_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class WorkoutView extends StatelessWidget {
  const WorkoutView({super.key});

  @override
  Widget build(BuildContext context) {
    final appColors = Provider.of<AppColors>(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return BlocBuilder<WorkoutCubit, WorkoutState>(
      builder: (context, state) {
        final cubit = context.read<WorkoutCubit>();

        // Progress card labels
        final totalExercises = cubit.getTotalExercises();
        final progress = totalExercises > 0
            ? state.completedWorkouts / totalExercises
            : 0.0;
        final progressLabel = state.selectedPlan == 'Weekly'
            ? '${WorkoutCubit.days[state.currentTabIndex]} Progress'
            : '${state.selectedPlan} Plan';
        final progressSub = state.selectedPlan == 'Weekly'
            ? '${state.completedWorkouts} / $totalExercises completed'
            : 'Ready to crush it! 🔥';

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
              "Workout",
              style: TextStyle(
                fontSize: screenWidth / 18,
                fontWeight: FontWeight.bold,
                color: Colors.deepOrange,
              ),
            ),
            centerTitle: true,
          ),
          body: Column(
            children: [
              // ── Plan Selector Chips ───────────────────────────────────────
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: SizedBox(
                  height: 50,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      PlanChip(
                        title: 'Weekly',
                        icon: Icons.calendar_today,
                        isSelected: state.selectedPlan == 'Weekly',
                        appColors: appColors,
                        onTap: () => cubit.selectPlan('Weekly'),
                      ),
                      const SizedBox(width: 12),
                      PlanChip(
                        title: 'Full Body',
                        icon: Icons.fitness_center,
                        isSelected: state.selectedPlan == 'Full Body',
                        appColors: appColors,
                        onTap: () => cubit.selectPlan('Full Body'),
                      ),
                      const SizedBox(width: 12),
                      PlanChip(
                        title: 'Cardio',
                        icon: Icons.directions_run,
                        isSelected: state.selectedPlan == 'Cardio',
                        appColors: appColors,
                        onTap: () => cubit.selectPlan('Cardio'),
                      ),
                      const SizedBox(width: 12),
                      PlanChip(
                        title: 'Core',
                        icon: Icons.accessibility_new,
                        isSelected: state.selectedPlan == 'Core',
                        appColors: appColors,
                        onTap: () => cubit.selectPlan('Core'),
                      ),
                    ],
                  ),
                ),
              ),

              // ── Progress Card ─────────────────────────────────────────────
              ProgressCard(
                label: progressLabel,
                subLabel: progressSub,
                progress: progress,
              ),

              const SizedBox(height: 16),

              // ── Content based on selected plan ────────────────────────────
              if (state.selectedPlan == 'Weekly')
                WeeklyTabs(
                  appColors: appColors,
                  screenWidth: screenWidth,
                  screenHeight: screenHeight,
                ),

              if (state.selectedPlan != 'Weekly')
                Expanded(
                  child: ExerciseList(
                    exercises: cubit.getExercisesForPlan(),
                    dayKey: state.selectedPlan,
                    appColors: appColors,
                    screenWidth: screenWidth,
                    screenHeight: screenHeight,
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
