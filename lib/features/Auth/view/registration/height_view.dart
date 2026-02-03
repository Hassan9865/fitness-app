import 'package:fitness_tracker/components/app_colors.dart';
import 'package:fitness_tracker/components/my_button.dart';
import 'package:fitness_tracker/components/my_textfeild.dart';
import 'package:fitness_tracker/features/Auth/cubits/registraion_cubit/registration_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class HeightView extends StatefulWidget {
  const HeightView({super.key});

  @override
  State<HeightView> createState() => _HeightViewState();
}

class _HeightViewState extends State<HeightView> {
  TextEditingController heightController = TextEditingController();
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
                  "What's Your Height ?",
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width / 15,
                    fontWeight: FontWeight.w500,
                    color: appColors.onSecondary,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 40),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: 8,
                    bottom: 4,
                  ),
                  child: MyTextfeild(
                    controller: heightController,
                    color: appColors.primary,
                    text: "6.1 ft",
                    hintTxtColor: appColors.onSecondary,
                    icon: Icon(
                      Icons.height_outlined,
                      color: appColors.onSecondary,
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 30),
                BlocBuilder<RegistrationCubit, RegistrationState>(
                  builder: (context, state) {
                    return MyButton(
                      onPressed: () {
                        // if (heightController.text.isNotEmpty) {
                        //   context.read<RegistrationCubit>().saveheight(
                        //     heightController.text,
                        //   );
                        //   GoRouter.of(context).push('/ageview');
                        // } else {
                        //   ScaffoldMessenger.of(context).showSnackBar(
                        //     SnackBar(
                        //       content: Center(
                        //         child: Text(
                        //           'Please filled your Height in textfeild!',
                        //         ),
                        //       ),
                        //       backgroundColor: Colors.redAccent,
                        //     ),
                        //   );
                        // }
                        GoRouter.of(context).push('/loginview');
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
