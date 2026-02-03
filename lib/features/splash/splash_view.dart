import 'dart:async';

import 'package:fitness_tracker/components/app_colors.dart';
import 'package:fitness_tracker/model/sqllite_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _loadPreferencesAndNavigate();
  }

  Future<void> _loadPreferencesAndNavigate() async {
    await Future.delayed(const Duration(seconds: 3));

    if (mounted) {
      try {
        final userPreference = await SqlliteModel().getUserPrefrence();
        if (userPreference.isNotEmpty) {
          print("User Preference: $userPreference");
          final userTheme = userPreference[0]['theme'] as String;
          final appColors = Provider.of<AppColors>(context, listen: false);
          appColors.changeTheme(theme: userTheme);
        } else {
          await SqlliteModel().insertUserPrefrence();
          print("No User Preference found. Default inserted.");
        }
      } catch (e) {
        print("Error loading user preferences: $e");
      }

      context.go('/authgate');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/splash.jpg"),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
