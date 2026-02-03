import 'package:fitness_tracker/components/app_colors.dart';
import 'package:fitness_tracker/components/collection_buttons.dart';
import 'package:fitness_tracker/components/default_text_style.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  bool rememberMe = false;
  bool notifications = false;
  bool notificationSound = false;

  @override
  Widget build(BuildContext context) {
    final appColors = Provider.of<AppColors>(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: appColors.background,
      appBar: AppBar(
        title: Text(
          "Settings",
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.width / 20,
            color: appColors.onSecondary,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            context.go('/bottomnavbar');
          },
          icon: Icon(Icons.arrow_back, color: appColors.onSecondary),
        ),
        backgroundColor: appColors.background,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(
                "Preferences",
                style: defaultTextStyle(appColors: appColors),
              ),
            ),
            CustomButtonCollection(
              type: "Tile",
              appcolors: appColors,
              text: "Change Theme",
              onPressed: () {
                final appColors = context.read<AppColors>();
                appColors.changeTheme(
                  theme: appColors.theme == "light" ? "dark" : "light",
                );
              },
              leadingIcon: appColors.theme == 'light'
                  ? Icons.light_mode_rounded
                  : Icons.dark_mode_outlined,
              trailingIcon: Icons.color_lens_sharp,
            ),
            CustomButtonCollection(
              type: "Tile",
              appcolors: appColors,
              text: "Notifications",
              onPressed: () {
                setState(() {
                  notifications = !notifications;
                });
              },
              leadingIcon: notifications
                  ? Icons.notifications_active_sharp
                  : Icons.notifications_off_outlined,
              trailingIcon: Icons.edit_notifications,
            ),
            CustomButtonCollection(
              type: "Tile",
              appcolors: appColors,
              text: "Notification Sound",
              onPressed: () {
                setState(() {
                  notificationSound = !notificationSound;
                });
              },
              leadingIcon: notificationSound
                  ? Icons.volume_up_sharp
                  : Icons.volume_mute_sharp,
              trailingIcon: Icons.edit_notifications_sharp,
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(
                "Account Settings",
                style: defaultTextStyle(appColors: appColors),
              ),
            ),
            CustomButtonCollection(
              type: "Tile",
              appcolors: appColors,
              text: "Change Password",
              trailingIcon: Icons.key_sharp,
              onPressed: () {
                context.push('/changepasswordview');
              },
            ),
            CustomButtonCollection(
              type: "Tile",
              appcolors: appColors,
              text: "Wallet",
              trailingIcon: Icons.wallet_sharp,
            ),
            CustomButtonCollection(
              type: "Tile",
              appcolors: appColors,
              text: "Remember Me",
              trailingIcon: Icons.remember_me_sharp,
              leadingIcon: rememberMe
                  ? Icons.radio_button_checked_sharp
                  : Icons.radio_button_unchecked_sharp,
              onPressed: () {
                setState(() {
                  rememberMe = !rememberMe;
                });
              },
            ),
            CustomButtonCollection(
              type: "Tile",
              appcolors: appColors,
              text: "Logout",
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      backgroundColor: appColors.primary,
                      title: Text(
                        'Are you sure',
                        style: defaultTextStyle(appColors: appColors),
                      ),
                      content: Text(
                        'You want to LogOut',
                        style: defaultTextStyle(appColors: appColors),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            'Cancel',
                            style: defaultTextStyle(appColors: appColors),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            // context.read<AuthCubit>().logout();
                          },
                          child: Text(
                            'Logout',
                            style: defaultTextStyle(appColors: appColors),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
              trailingIcon: Icons.logout_sharp,
              buttonColor: appColors.error,
            ),
          ],
        ),
      ),
    );
  }
}
