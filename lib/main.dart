import 'package:fitness_tracker/components/app_colors.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppColors(theme: "light")),
        // Provider<AuthRepository>(create: (_) => AuthRepository()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // final authRepo = Provider.of<AuthRepository>(context);
    final appColors = Provider.of<AppColors>(context);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      theme: ThemeData(
        scaffoldBackgroundColor: appColors.background,
        colorScheme: ColorScheme.light(
          primary: appColors.primary,
          secondary: appColors.onPrimary,
        ),
      ),
    );
  }
}
