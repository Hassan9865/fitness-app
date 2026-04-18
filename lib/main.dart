import 'package:fitness_tracker/components/app_colors.dart';
import 'package:fitness_tracker/features/home/cubit/home_cubit.dart';
import 'package:fitness_tracker/features/nutrition/cubit/nutrition_cubit.dart';
import 'package:fitness_tracker/features/workout/cubit/workout_cubit%20.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // final appColors = Provider.of<AppColors>(context);

    return MultiBlocProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppColors(theme: "light")),
        BlocProvider(create: (context) => HomeCubit()),
        BlocProvider(create: (context) => WorkoutCubit()),
        BlocProvider(create: (context) => NutritionCubit()),

        // Provider<AuthRepository>(create: (_) => AuthRepository()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: router,
        // theme: ThemeData(
        //   scaffoldBackgroundColor: appColors.background,
        //   colorScheme: ColorScheme.light(
        //     primary: appColors.primary,
        //     secondary: appColors.onPrimary,
        //   ),
        // ),
      ),
    );
  }
}
