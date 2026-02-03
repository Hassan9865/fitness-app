import 'package:fitness_tracker/components/app_colors.dart';
import 'package:fitness_tracker/components/my_button.dart';
import 'package:fitness_tracker/components/my_textfeild.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final appColors = Provider.of<AppColors>(context);
    return Scaffold(
      backgroundColor: appColors.background,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Trainer App Login",
              style: TextStyle(
                color: appColors.onSecondary,
                fontSize: MediaQuery.of(context).size.height / 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 40),
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
            SizedBox(height: MediaQuery.of(context).size.height / 40),

            MyButton(
              onPressed: () {
                // final email = emailController.text;
                // final password = passController.text;
                // context.read<AuthCubit>().loginvalidate(email, password);
                GoRouter.of(context).push('/bottomnavbar');
              },
              text: "Login",
              buttonColor: appColors.onPrimary,
            ),

            SizedBox(height: MediaQuery.of(context).size.height / 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    context.go('/signupview');
                  },
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Don't have an account? ",
                          style: TextStyle(
                            color: appColors.onSecondary,
                            fontSize: 16,
                          ),
                        ),
                        TextSpan(
                          text: "Sign up",
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
