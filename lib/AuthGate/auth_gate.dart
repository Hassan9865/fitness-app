import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
        future: SharedPreferences.getInstance()
            .then((prefs) => prefs.getString('token')),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          final token = snapshot.data;
          print('Retrieved token: $token');
          Future.delayed(Duration.zero, () {
            if (token != null) {
              GoRouter.of(context).replace('/bottomnavbar');
              print('Navigating to homeview');
            } else {
              GoRouter.of(context).replace('/loginview');
              print('Navigating to loginview');
            }
          });
          return SizedBox();
        });
  }
}
