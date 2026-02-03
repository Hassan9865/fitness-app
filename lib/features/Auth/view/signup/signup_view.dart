import 'package:fitness_tracker/components/app_colors.dart';
import 'package:fitness_tracker/components/my_button.dart';
import 'package:fitness_tracker/components/my_textfeild.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  TextEditingController firstNController = TextEditingController();
  TextEditingController lastNController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confirmpassController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    confirmpassController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appColors = Provider.of<AppColors>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: appColors.background,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Trainer App Signup",
              style: TextStyle(
                color: appColors.onSecondary,
                fontSize: MediaQuery.of(context).size.height / 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 60),
            SizedBox(height: MediaQuery.of(context).size.height / 60),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                      top: 8,
                      bottom: 10,
                    ),
                    child: MyTextfeild(
                      controller: firstNController,
                      label: "First Name",
                      text: "first name",
                      hintTxtColor: appColors.onSecondary,
                      icon: Icon(
                        Icons.person_outline,
                        color: appColors.onSecondary,
                      ),
                      color: appColors.primary,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                      top: 8,
                      bottom: 10,
                    ),
                    child: MyTextfeild(
                      controller: lastNController,
                      label: "Last Nmae",
                      text: "last name",
                      hintTxtColor: appColors.onSecondary,
                      icon: Icon(
                        Icons.person_outline,
                        color: appColors.onSecondary,
                      ),
                      color: appColors.primary,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 8,
                bottom: 10,
              ),
              child: MyTextfeild(
                controller: emailController,
                label: "Email",
                text: "Email",
                hintTxtColor: appColors.onSecondary,
                icon: Icon(Icons.email_outlined, color: appColors.onSecondary),
                color: appColors.primary,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 70),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 8,
                bottom: 10,
              ),
              child: MyTextfeild(
                controller: passController,
                label: "Password",
                text: "Password",
                hintTxtColor: appColors.onSecondary,
                icon: Icon(
                  Icons.password_outlined,
                  color: appColors.onSecondary,
                ),
                color: appColors.primary,
                ispassword: true,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 70),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 8,
                bottom: 10,
              ),
              child: MyTextfeild(
                controller: confirmpassController,
                label: "Confirm Password",
                text: "Confirm Password",
                hintTxtColor: appColors.onSecondary,
                icon: Icon(
                  Icons.password_outlined,
                  color: appColors.onSecondary,
                ),
                color: appColors.primary,
                ispassword: true,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 40),
            MyButton(
              onPressed: () {
                // context.read<AuthCubit>().validateAndNavigate(
                //     firstNController.text,
                //     lastNController.text,
                //     emailController.text,
                //     passController.text,
                //     confirmpassController.text);
                GoRouter.of(context).push('/ageview');
              },
              text: "Next",
              buttonColor: appColors.onPrimary,
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    context.go('/loginView');
                  },
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Already have an account? ",
                          style: TextStyle(
                            color: appColors.onSecondary,
                            fontSize: 16,
                          ),
                        ),
                        TextSpan(
                          text: "Login",
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
