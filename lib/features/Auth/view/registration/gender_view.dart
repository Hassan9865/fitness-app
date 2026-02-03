import 'package:fitness_tracker/components/app_colors.dart';
import 'package:fitness_tracker/components/my_button.dart';
import 'package:fitness_tracker/features/Auth/cubits/registraion_cubit/registration_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class GenderView extends StatelessWidget {
  GenderView({super.key});

  final List<Map<String, dynamic>> option = [
    {"icon": Icons.male_outlined, "gender": "Male"},
    {"icon": Icons.female_outlined, "gender": 'Female'},
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
              SizedBox(height: MediaQuery.of(context).size.height / 7),
              Text(
                "What's Your Gender ?",
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width / 15,
                  fontWeight: FontWeight.w500,
                  color: appColors.onSecondary,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 40),
              Expanded(
                child: BlocBuilder<RegistrationCubit, RegistrationState>(
                  builder: (context, state) {
                    int selectedIndex = -1;
                    if (state is SelectGender) {
                      selectedIndex = state.selectgender;
                    }
                    return Center(
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: option.length,
                        itemBuilder: (context, index) {
                          bool isSelected = selectedIndex == index;
                          return GestureDetector(
                            onTap: () {
                              context.read<RegistrationCubit>().selectGender(
                                index,
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: MediaQuery.of(context).size.height / 10,
                                width: MediaQuery.of(context).size.width / 40,
                                decoration: BoxDecoration(
                                  color: appColors.primary,
                                  borderRadius: BorderRadius.circular(10),
                                  border: isSelected
                                      ? Border.all(
                                          color: Colors.deepOrange,
                                          width: 2,
                                        )
                                      : null,
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          option[index]["icon"],
                                          color: appColors.onSecondary,
                                        ),
                                        Text(
                                          option[index]["gender"],
                                          style: TextStyle(
                                            fontSize:
                                                MediaQuery.of(
                                                  context,
                                                ).size.height /
                                                40,
                                            color: appColors.onSecondary,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height /
                                          40,
                                    ),
                                    Icon(
                                      isSelected
                                          ? Icons.radio_button_checked
                                          : Icons.radio_button_off_outlined,
                                      color: Colors.deepOrange,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 40),
              BlocBuilder<RegistrationCubit, RegistrationState>(
                builder: (context, state) {
                  return MyButton(
                    onPressed: () {
                      // if (state is SelectGender) {
                      //   final selectedIndex = state.selectgender;
                      //   final selectGender =
                      //       option[selectedIndex]['gender'] as String;
                      //   context.read<RegistrationCubit>().savegender(
                      //     selectedIndex,
                      //     selectGender,
                      //   );

                      // } else {
                      //   ScaffoldMessenger.of(context).showSnackBar(
                      //     SnackBar(
                      //       content: Center(
                      //         child: Text('Please select Gender'),
                      //       ),
                      //     ),
                      //   );
                      // }
                      GoRouter.of(context).push('/goalview');
                    },
                    text: "Next",
                    buttonColor: appColors.onPrimary,
                  );
                },
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 7),
            ],
          ),
        ),
      ),
    );
  }
}
