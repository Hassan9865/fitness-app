import 'package:fitness_tracker/model/sqllite_model.dart';
import 'package:flutter/material.dart';

class AppColors with ChangeNotifier {
  // PRIMARY COLORS

  late Color primary;
  late Color primaryVariant;
  late Color secondary;
  late Color secondaryVariant;

  // BACKGROUND COLOR

  late Color background;
  late Color surface;

  // ERROR COLOR

  late Color error;

  // TEXT COLORS

  late Color onPrimary;
  late Color onSecondary;
  late Color onSecondaryHeading;
  late Color onBackground;
  late Color onSurface;
  late Color onError;

  late String theme;

  AppColors({required String theme}) {
    this.theme = theme;
    _setTheme(theme: theme);
  }

  void _setTheme({required String theme}) {
    if (theme == "dark") {
      primary = const Color(0xFF24262B);
      primaryVariant = const Color(0xFF3700B3);
      secondary = const Color(0xFF03DAC6);
      secondaryVariant = const Color(0xFF018786);
      background = const Color(0xFF111214);
      surface = const Color(0xFFFFFFFF);
      error = const Color(0xFFB00020);
      onPrimary = const Color(0xFFF97316);
      onSecondaryHeading = const Color(0xFFFFFF00);
      onSecondary = const Color.fromARGB(255, 255, 255, 255);
      onBackground = const Color(0xFF000000);
      onSurface = const Color(0xFF000000);
      onError = const Color(0xFFFFFFFF);
    } else {
      background = const Color.fromARGB(255, 248, 244, 242);
      primaryVariant = const Color(0xFF3700B3);
      secondary = const Color(0xFF03DAC6);
      secondaryVariant = const Color(0xFF018786);
      primary = const Color.fromARGB(255, 221, 220, 219);
      surface = const Color(0xFFFFFFFF);
      error = const Color(0xFFB00020);
      onPrimary = const Color(0xFFF97316);
      onSecondaryHeading = const Color(0xFFFFFF00);
      onSecondary = const Color(0xFF000000);
      onBackground = const Color(0xFF000000);
      onSurface = const Color(0xFF000000);
      onError = const Color(0xFFFFFFFF);
    }

    this.theme = theme;
    print("Theme changed to $theme");
    notifyListeners();
  }

  void changeTheme({required String theme}) {
    _setTheme(theme: theme);
    SqlliteModel()
        .updateUserPrefrence(theme: theme, prefrenceId: 1)
        .then((value) {
          print("Theme updated in database to $theme");
        })
        .catchError((error) {
          print("Error updating theme in database: $error");
        });
  }
}
