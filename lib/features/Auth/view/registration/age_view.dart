import 'package:fitness_tracker/components/app_colors.dart';
import 'package:fitness_tracker/components/my_button.dart';

import 'package:fitness_tracker/features/Auth/cubits/registraion_cubit/registration_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wheel_slider/wheel_slider.dart';
import 'package:provider/provider.dart';

// class AgeView extends StatelessWidget {
//   const AgeView({super.key});

//   final int totalAge = 120;

//   @override
//   Widget build(BuildContext context) {

//     final appColors = Provider.of<AppColors>(context);
//     return
//       Scaffold(
//         backgroundColor: appColors.background,
//         body: SafeArea(
//             child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Text(
//                 "What's Your age ?",
//                 style: TextStyle(
//                     fontSize: MediaQuery.of(context).size.width / 15,
//                     fontWeight: FontWeight.w500,
//                     color: appColors.onSecondary),
//               ),
//               SizedBox(
//                 height: MediaQuery.of(context).size.height / 40,
//               ),
//               Column(
//                     children: [
//                       WheelSlider.number(
//                         horizontal: false,
//                         verticalListHeight: 300.0,
//                         perspective: 0.01,
//                         totalCount: totalAge,
//                         initValue: 10,
//                         unSelectedNumberStyle: TextStyle(
//                           fontSize: 20.0,
//                           color: appColors.onSecondary,
//                         ),
//                         selectedNumberStyle: const TextStyle(
//                           fontSize: 24.0,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.deepOrange,
//                         ),
//                         currentIndex: currentAge,
//                         onValueChanged: (val) {
//                           context.read<RegistrationCubit>().updatedAge(val);
//                         },
//                         hapticFeedbackType: HapticFeedbackType.heavyImpact,
//                       ),
//                     ],
//                   );
//                 },
//               ),
//               SizedBox(
//                 height: MediaQuery.of(context).size.height / 40,
//               ),
//              MyButton(
//                     onPressed: ()  {
//                       // if (state is SelectAge) {
//                       //   final age = state.selectAge;
//                       //   context.read<RegistrationCubit>().saveAge(age);

//                       //   final saveData = await context
//                       //       .read<RegistrationCubit>()
//                       //       .getSaveData();

//                       //   print("Saved Data: $saveData");
//                       //   print("First Name: ${saveData['firstName']}");
//                       //   print("Last Name: ${saveData['lastName']}");
//                       //   final model = CreateUserModel(
//                       //     name: saveData['name'],
//                       //     firstName: saveData['firstName'],
//                       //     lastName: saveData['lastName'],
//                       //     email: saveData['email'],
//                       //     password: saveData['password'],
//                       //     fitnessGoal: saveData['goaltxt'],
//                       //     age: saveData['age'].toString(),
//                       //     height: saveData['height'],
//                       //     weight: saveData['weight'].toString(),
//                       //     gender: saveData['gender'],
//                       //     image: UserImage(
//                       //       image: "path/to/your/image.png",
//                       //       ext: "png",
//                       //     ),
//                       //   );

//                       //   print('Request Body: ${model.toJson()}');
//                       //   context.read<AuthCubit>().createUser(model);
//                       // }
//                     },
//                     text: "Next",
//                     buttonColor: appColors.onPrimary,
//                   );

//             ],
//           ),
//         )),
//       );

//   }

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
                  context.read<RegistrationCubit>().updatedAge(val);
                },
                hapticFeedbackType: HapticFeedbackType.heavyImpact,
              ),

              const SizedBox(height: 30),

              MyButton(
                text: "Next",
                buttonColor: appColors.onPrimary,
                onPressed: () {
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
