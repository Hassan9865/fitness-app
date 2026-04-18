import 'package:fitness_tracker/components/app_colors.dart';
import 'package:fitness_tracker/features/workout/cubit/workout_cubit%20.dart';
import 'package:fitness_tracker/features/workout/widgets/exercise_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeeklyTabs extends StatefulWidget {
  final AppColors appColors;
  final double screenWidth;
  final double screenHeight;

  const WeeklyTabs({
    super.key,
    required this.appColors,
    required this.screenWidth,
    required this.screenHeight,
  });

  @override
  State<WeeklyTabs> createState() => _WeeklyTabsState();
}

class _WeeklyTabsState extends State<WeeklyTabs>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: WorkoutCubit.days.length,
      vsync: this,
    );
    _tabController.addListener(() {
      if (!_tabController.indexIsChanging) {
        context.read<WorkoutCubit>().updateTabIndex(_tabController.index);
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          // Day tab bar
          Container(
            height: 50,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: TabBar(
              controller: _tabController,
              isScrollable: true,
              labelColor: Colors.deepOrange,
              unselectedLabelColor: widget.appColors.onSecondary.withOpacity(
                0.6,
              ),
              indicator: BoxDecoration(
                color: Colors.deepOrange.withOpacity(0.1),
                borderRadius: BorderRadius.circular(25),
              ),
              labelStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
              unselectedLabelStyle: const TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 13,
              ),
              tabs: WorkoutCubit.days.map((day) => Tab(text: day)).toList(),
            ),
          ),
          // Tab content
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: WorkoutCubit.days.map((day) {
                return ExerciseList(
                  exercises: WorkoutCubit.exercises[day]!,
                  dayKey: day,
                  appColors: widget.appColors,
                  screenWidth: widget.screenWidth,
                  screenHeight: widget.screenHeight,
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
