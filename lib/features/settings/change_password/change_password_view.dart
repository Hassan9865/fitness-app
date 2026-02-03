import 'package:fitness_tracker/components/app_colors.dart';
import 'package:fitness_tracker/components/collection_buttons.dart';
import 'package:fitness_tracker/components/custom_textfield_collection.dart';
import 'package:fitness_tracker/components/default_text_style.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ChangePasswordView extends StatefulWidget {
  const ChangePasswordView({super.key});

  @override
  State<ChangePasswordView> createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends State<ChangePasswordView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  void _submit() {
    if (_formKey.currentState!.validate()) {
      print("Email: ${_emailController.text}");
      context.push('/verifyPasswordChangeView');
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
          "Change Password",
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.width / 20,
            color: appColors.onSecondary,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            context.go('/settingsview');
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
                  "Enter your email address to confirm it and to receive the code.",
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
                controller: _emailController,
                hintText: "Enter your email...",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email cannot be empty';
                  } else if (!RegExp(
                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                  ).hasMatch(value)) {
                    return 'Enter a valid email';
                  }
                  return null;
                },
                onFieldSubmitted: (value) {
                  if (value.isNotEmpty) {
                    if (value == null || value.isEmpty) {
                      return 'Email cannot be empty';
                    } else if (!RegExp(
                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                    ).hasMatch(value)) {
                      return 'Enter a valid email';
                    }
                    _submit();
                  }
                  print("Email: ${value}");
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 48.0),
              child: CustomButtonCollection(
                appcolors: appColors,
                type: "Primary",
                text: "Send Code",
                onPressed: () {
                  _submit();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
