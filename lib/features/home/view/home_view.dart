import 'package:fitness_tracker/components/app_colors.dart';
import 'package:fitness_tracker/features/home/cubit/home_cubit.dart';
import 'package:fitness_tracker/features/home/cubit/home_state.dart';
import 'package:fitness_tracker/features/home/widget/achivements.dart';
import 'package:fitness_tracker/features/home/widget/quick_action.dart';
import 'package:fitness_tracker/features/home/widget/hello_user.dart';
import 'package:fitness_tracker/features/home/widget/quote_card.dart';
import 'package:fitness_tracker/features/home/widget/quick_log.dart';
import 'package:fitness_tracker/features/home/widget/stats_row.dart';
import 'package:fitness_tracker/features/home/widget/water_intake.dart';
import 'package:fitness_tracker/features/home/widget/xp_progress.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final appColors = Provider.of<AppColors>(context);

    return Scaffold(
      backgroundColor: appColors.background,
      body: SafeArea(
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(child: HelloUser()),

                SliverToBoxAdapter(child: XpProgress(state: state)),

                SliverToBoxAdapter(child: QuoteCard(state: state)),

                SliverToBoxAdapter(child: QuickAction()),
                SliverToBoxAdapter(child: StatsRow(state: state)),

                // SliverToBoxAdapter(child: StatsRow(state: state)),

                // SliverToBoxAdapter(child: StepsCard(state: state)),

                // SliverToBoxAdapter(
                //   child: WorkoutList(
                //     state: state,
                //     onTap: (i) => context.read<HomeCubit>().toggleWorkout(i),
                //   ),
                // ),
                SliverToBoxAdapter(
                  child: WaterIntake(
                    state: state,
                    onAdd: () => context.read<HomeCubit>().toggleWater(),
                  ),
                ),

                SliverToBoxAdapter(child: Achivements(state: state)),
              ],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => QuickLogBottomSheet.show(context),
        backgroundColor: Colors.deepOrange,
        child: const Icon(Icons.add, color: Colors.white, size: 30),
      ),
    );
  }
}
