import 'package:fitness_tracker/components/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fitness_tracker/features/nutrition/cubit/nutrition_cubit.dart';
import 'package:fitness_tracker/features/nutrition/widgets/daily_summary.dart';
import 'package:fitness_tracker/features/nutrition/widgets/day_tabs.dart';
import 'package:fitness_tracker/features/nutrition/widgets/macros_progress.dart';
import 'package:fitness_tracker/features/nutrition/widgets/meal_section.dart';
import 'package:fitness_tracker/features/nutrition/widgets/water_tracker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NutritionScreen extends StatelessWidget {
  const NutritionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appColors = Provider.of<AppColors>(context);

    return BlocBuilder<NutritionCubit, NutritionState>(
      builder: (context, state) {
        final cubit = context.read<NutritionCubit>();
        final meals = cubit.getMealsForSelectedDay();
        final dayKey = NutritionCubit.days[state.selectedDay];

        return Scaffold(
          backgroundColor: appColors.background,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            // leading: IconButton(
            //   onPressed: () => context.go('/bottomnavbar'),
            //   icon: Icon(Icons.arrow_back_ios, color: appColors.onSecondary),
            // ),
            title: Text(
              '🥗 Nutrition Plan',
              style: TextStyle(
                color: appColors.onSecondary,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: () {}, // TODO: _showAddFoodDialog
                icon: const Icon(Icons.add_circle_outline, color: Colors.green),
              ),
              IconButton(
                onPressed: () {}, // TODO: _showSettings
                icon: Icon(
                  Icons.settings_outlined,
                  color: appColors.onSecondary,
                ),
              ),
            ],
          ),
          body: Column(
            children: [
              // 📅 Day tabs
              DayTabs(appColors: appColors),

              // 📊 Macros progress
              MacrosProgress(appColors: appColors),

              // 💧 Water tracker
              WaterTracker(appColors: appColors),

              // 🍽️ Meals list
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  children: NutritionCubit.mealOrder.map((mealType) {
                    if (!meals.containsKey(mealType)) {
                      return const SizedBox();
                    }
                    return MealSection(
                      mealType: mealType,
                      items: meals[mealType]!,
                      mealKey: '${dayKey}_$mealType',
                      appColors: appColors,
                    );
                  }).toList(),
                ),
              ),

              // 📈 Daily summary bar
              DailySummary(appColors: appColors),
            ],
          ),
        );
      },
    );
  }
}

// class _NutritionBody extends StatelessWidget {
//   const _NutritionBody();

//   @override
//   Widget build(BuildContext context) {

//   }
// }
