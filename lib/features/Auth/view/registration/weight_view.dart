import 'package:fitness_tracker/components/app_colors.dart';
import 'package:fitness_tracker/components/my_button.dart';
import 'package:fitness_tracker/features/Auth/cubits/registraion_cubit/registration_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:wheel_slider/wheel_slider.dart';
import 'package:flutter/material.dart';

class WeightView extends StatelessWidget {
  const WeightView({super.key});

  final int totalWeight = 400;

  @override
  Widget build(BuildContext context) {
    final appColors = Provider.of<AppColors>(context);

    return BlocProvider(
      create: (context) => RegistrationCubit(),
      child: Scaffold(
        backgroundColor: appColors.background,
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "What's Your Weight ?",
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width / 15,
                    fontWeight: FontWeight.w500,
                    color: appColors.onSecondary,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 40),
                BlocBuilder<RegistrationCubit, RegistrationState>(
                  builder: (context, state) {
                    double currentWeight = 10;
                    if (state is SelectWeight) {
                      currentWeight = state.selectWeight;
                    }
                    return Column(
                      children: [
                        WheelSlider(
                          horizontal: true,
                          interval: 0.5,
                          verticalListHeight: 300.0,
                          perspective: 0.01,
                          totalCount: totalWeight,
                          initValue: currentWeight,
                          pointerColor: appColors.onSecondary,
                          lineColor: Colors.grey[100],
                          onValueChanged: (val) {
                            context.read<RegistrationCubit>().updatedWeight(
                              val,
                            );
                          },
                          hapticFeedbackType: HapticFeedbackType.vibrate,
                        ),
                        Text(
                          "${currentWeight} Kg",
                          style: TextStyle(
                            height: 2.0,
                            fontSize: MediaQuery.of(context).size.height / 45,
                            fontWeight: FontWeight.w500,
                            color: appColors.onSecondary,
                          ),
                        ),
                      ],
                    );
                  },
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 40),
                BlocBuilder<RegistrationCubit, RegistrationState>(
                  builder: (context, state) {
                    return MyButton(
                      onPressed: () {
                        // if (state is SelectWeight) {
                        //   final weight = state.selectWeight;
                        //   context.read<RegistrationCubit>().saveWeight(weight);

                        // } else {
                        //   ScaffoldMessenger.of(context).showSnackBar(
                        //     SnackBar(
                        //       content: Center(
                        //         child: Text('Please select your weight!'),
                        //       ),
                        //       backgroundColor: Colors.redAccent,
                        //     ),
                        //   );
                        // }
                        GoRouter.of(context).push('/heightview');
                      },
                      text: "Next",
                      buttonColor: appColors.onPrimary,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
