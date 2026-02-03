import 'package:fitness_tracker/components/app_colors.dart';
import 'package:fitness_tracker/components/my_button.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wheel_slider/wheel_slider.dart';
import 'package:provider/provider.dart';

class AgeView extends StatelessWidget {
  const AgeView({super.key});

  static const int totalAge = 120;

  @override
  Widget build(BuildContext context) {
    final appColors = Provider.of<AppColors>(context);

    return Scaffold(
      backgroundColor: appColors.background,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "What's your age?",
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width / 15,
                  fontWeight: FontWeight.w500,
                  color: appColors.onSecondary,
                ),
              ),

              const SizedBox(height: 20),

              /// 👇 Bloc se age read ho rahi
              WheelSlider.number(
                horizontal: false,
                verticalListHeight: 300,
                perspective: 0.01,
                totalCount: totalAge,
                initValue: 18,
                currentIndex: 12,
                unSelectedNumberStyle: TextStyle(
                  fontSize: 20,
                  color: appColors.onSecondary,
                ),
                selectedNumberStyle: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrange,
                ),
                onValueChanged: (val) {
                  // context.read<RegistrationCubit>().updatedAge(val);
                },
                hapticFeedbackType: HapticFeedbackType.heavyImpact,
              ),

              const SizedBox(height: 30),

              MyButton(
                text: "Next",
                buttonColor: appColors.onPrimary,
                onPressed: () {
                  GoRouter.of(context).push('/genderview');
                  // final age =
                  //     context.read<RegistrationCubit>().state.age;

                  // debugPrint("Selected Age: $age");

                  // next screen navigation / API call yahan
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
