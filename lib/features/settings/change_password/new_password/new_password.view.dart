import 'package:fitness_tracker/components/app_colors.dart';
import 'package:fitness_tracker/components/collection_buttons.dart';
import 'package:fitness_tracker/components/custom_textfield_collection.dart';
import 'package:fitness_tracker/components/default_text_style.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class NewPasswordView extends StatefulWidget {
  const NewPasswordView({super.key});

  @override
  State<NewPasswordView> createState() => _NewPasswordViewState();
}

class _NewPasswordViewState extends State<NewPasswordView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _newPass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();

  void _submit() {
    if (_newPass.text == _confirmPass.text) {
      print("New Password: ${_newPass.text}");
      context.push('/settingsview');
    } else {
      print("Passwords do not match");
    }
  }

  @override
  Widget build(BuildContext context) {
    final AppColors appColors = Provider.of<AppColors>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: appColors.background,
      appBar: AppBar(
        title: Text(
          "Enter New Password",
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.width / 20,
            color: appColors.onSecondary,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            context.push('/settingsview');
          },
          icon: Icon(Icons.arrow_back, color: appColors.onSecondary),
        ),
        backgroundColor: appColors.background,
      ),
      body: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(38.0).copyWith(top: 80),
              child: Align(
                alignment: Alignment.topCenter,
                child: Text(
                  "Enter your New Password.",
                  style: defaultTextStyle(appColors: appColors),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(
                18.0,
              ).copyWith(top: MediaQuery.of(context).size.width / 3),
              child: CustomTextFieldCollection(
                appColors: appColors,
                type: "Tile",
                controller: _newPass,
                hintText: "Enter your new Password...",
                obscureText: true,
                validator: (value) {
                  if (_newPass.text != _confirmPass.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0).copyWith(top: 20),
              child: CustomTextFieldCollection(
                appColors: appColors,
                type: "Tile",
                controller: _newPass,
                hintText: "Confirm Password...",
                obscureText: true,
                validator: (value) {
                  if (_newPass.text != _confirmPass.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 48.0),
              child: CustomButtonCollection(
                appcolors: appColors,
                type: "Primary",
                text: "Change Password",
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
                          'You want to Change your Password?',
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
                              _submit();
                            },
                            child: Text(
                              'Change Password',
                              style: defaultTextStyle(appColors: appColors),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
