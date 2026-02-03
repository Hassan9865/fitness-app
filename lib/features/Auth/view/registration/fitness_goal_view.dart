import 'package:fitness_tracker/components/app_colors.dart';
import 'package:fitness_tracker/components/my_button.dart';
import 'package:fitness_tracker/features/Auth/cubits/registraion_cubit/registration_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class FitnessGoalView extends StatelessWidget {
  FitnessGoalView({super.key});

  final List<Map<String, dynamic>> option = [
    {"icon": Icons.fitness_center_outlined, "text": "i wana lose weight"},
    {"icon": Icons.smart_toy_outlined, "text": "i wana try Ai Coach"},
    {"icon": Icons.accessibility_new_outlined, "text": "i wana get bulk"},
    {"icon": Icons.directions_run_outlined, "text": "i wana gain edurance"},
    {"icon": Icons.emoji_emotions_outlined, "text": "Just trying out the app!"},
  ];

  @override
  Widget build(BuildContext context) {
    final appColors = Provider.of<AppColors>(context);
    return BlocProvider(
      create: (context) => RegistrationCubit(),
      child: Scaffold(
        backgroundColor: appColors.background,
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height / 5),
              Center(
                child: Text(
                  "What's Your Fitness Goals/Target ?",
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width / 17,
                    fontWeight: FontWeight.w500,
                    color: appColors.onSecondary,
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 40),
              Expanded(
                child: BlocBuilder<RegistrationCubit, RegistrationState>(
                  builder: (context, state) {
                    int selectedIndex = -1;
                    if (state is GoalSelcte) {
                      selectedIndex = state.selectedGoal;
                    }
                    return Center(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: option.length,
                        itemBuilder: (context, index) {
                          bool isSelected = selectedIndex == index;
                          return GestureDetector(
                            onTap: () {
                              context.read<RegistrationCubit>().selectGoal(
                                index,
                              );
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(vertical: 8),
                              padding: EdgeInsets.symmetric(
                                vertical: 16,
                                horizontal: 12,
                              ),
                              decoration: BoxDecoration(
                                border: isSelected
                                    ? Border.all(color: Colors.orange, width: 2)
                                    : null,
                                borderRadius: BorderRadius.circular(10),
                                color: appColors.primary,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        option[index]["icon"],
                                        color: appColors.onSecondary,
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.height /
                                            40,
                                      ),
                                      Text(
                                        option[index]["text"],
                                        style: TextStyle(
                                          color: appColors.onSecondary,
                                          fontSize:
                                              MediaQuery.of(
                                                context,
                                              ).size.height /
                                              50,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Icon(
                                    isSelected
                                        ? Icons.radio_button_checked_outlined
                                        : Icons.radio_button_off_outlined,
                                    color: isSelected
                                        ? Colors.deepOrange
                                        : appColors.onSecondary,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 30),
              BlocBuilder<RegistrationCubit, RegistrationState>(
                builder: (context, state) {
                  return MyButton(
                    onPressed: () {
                      if (state is GoalSelcte) {
                        final selectedIndex = state.selectedGoal;
                        final selectedGoaltxt =
                            option[selectedIndex]['text'] as String;
                        context.read<RegistrationCubit>().savegoal(
                          selectedIndex,
                          selectedGoaltxt,
                        );
                        GoRouter.of(context).push('/genderview');
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Center(
                              child: Text("Please Select Fitness Goal"),
                            ),
                          ),
                        );
                      }
                    },
                    text: "Next",
                    buttonColor: appColors.onPrimary,
                  );
                },
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 10),
            ],
          ),
        ),
      ),
    );
  }
}
