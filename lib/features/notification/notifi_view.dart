import 'package:fitness_tracker/components/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class NotifiView extends StatelessWidget {
  const NotifiView({super.key});

  @override
  Widget build(BuildContext context) {
    final appColors = Provider.of<AppColors>(context);

    return Scaffold(
      backgroundColor: appColors.background,
      appBar: AppBar(
        title: Text(
          "Notification",
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.width / 20,
            color: appColors.onSecondary,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            context.go('/homeview');
          },
          icon: Icon(Icons.arrow_back, color: appColors.onSecondary),
        ),
        backgroundColor: appColors.background,
      ),
      body: Column(
        children: [
          Card(
            color: appColors.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: ListTile(
              title: Text(
                "New Workout here",
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width / 25,
                  color: appColors.onSecondary,
                ),
              ),
              subtitle: Text(
                "Notification",
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width / 30,
                  color: appColors.onSecondary,
                ),
              ),
              trailing: Text(
                "2:00 Pm",
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width / 30,
                  color: appColors.onSecondary,
                ),
              ),
              leading: CircleAvatar(
                radius: MediaQuery.of(context).size.width / 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
