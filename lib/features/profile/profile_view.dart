import 'package:fitness_tracker/components/app_colors.dart';
import 'package:fitness_tracker/components/my_button.dart';
import 'package:fitness_tracker/components/my_textfeild.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final appColors = Provider.of<AppColors>(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: appColors.background,
      appBar: AppBar(
        title: Text(
          "My Profile",
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
        actions: [
          Text(
            "Logout",
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width / 30,
              color: appColors.onSecondary,
              fontWeight: FontWeight.bold,
            ),
          ),
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Are you sure'),
                    content: Text('You want to LogOut'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () {
                          // context.read<AuthCubit>().logout();
                        },
                        child: Text('LogOut'),
                      ),
                    ],
                  );
                },
              );
            },
            icon: Icon(Icons.logout_outlined, color: appColors.onSecondary),
          ),
        ],
        backgroundColor: appColors.background,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(radius: MediaQuery.of(context).size.width / 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Kelvin",
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width / 20,
                  color: appColors.onSecondary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.favorite, color: Colors.deepOrange, size: 16),
                SizedBox(width: 4),
                Text(
                  "88% Healthy",
                  style: TextStyle(
                    color: appColors.onSecondary,
                    fontSize: MediaQuery.of(context).size.width / 30,
                  ),
                ),
                SizedBox(width: 4),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.deepOrange,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    "Pro",
                    style: TextStyle(
                      color: appColors.onSecondary,
                      fontSize: MediaQuery.of(context).size.width / 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                      top: 8,
                      bottom: 10,
                    ),
                    child: MyTextfeild(
                      label: 'Full Name',
                      text: "kelvin",
                      color: appColors.primary,
                      hintTxtColor: appColors.onSecondary,
                      icon: Icon(
                        Icons.person_outline,
                        color: appColors.onSecondary,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                      top: 8,
                      bottom: 10,
                    ),
                    child: MyTextfeild(
                      label: 'Email',
                      text: "kelvin@gmail.com",
                      color: appColors.primary,
                      hintTxtColor: appColors.onSecondary,
                      icon: Icon(
                        Icons.email_outlined,
                        color: appColors.onSecondary,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                      top: 8,
                      bottom: 10,
                    ),
                    child: MyTextfeild(
                      label: 'Goals',
                      text: "I have goals",
                      color: appColors.primary,
                      hintTxtColor: appColors.onSecondary,
                      icon: Icon(
                        Icons.track_changes_outlined,
                        color: appColors.onSecondary,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                      top: 8,
                      bottom: 10,
                    ),
                    child: MyTextfeild(
                      label: 'weight',
                      text: "60 kg",
                      color: appColors.primary,
                      hintTxtColor: appColors.onSecondary,
                      icon: Icon(
                        Icons.line_weight_outlined,
                        color: appColors.onSecondary,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                      top: 8,
                      bottom: 10,
                    ),
                    child: MyTextfeild(
                      label: 'Height',
                      text: "6 ft",
                      color: appColors.primary,
                      hintTxtColor: appColors.onSecondary,
                      icon: Icon(
                        Icons.height_outlined,
                        color: appColors.onSecondary,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: MyButton(
                      onPressed: () {},
                      text: "Update Profile",
                      buttonColor: Colors.deepOrange,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
