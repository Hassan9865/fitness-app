import 'package:fitness_tracker/components/app_colors.dart';
import 'package:fitness_tracker/components/custom_bar_chart.dart';
import 'package:fitness_tracker/components/default_text_style.dart';
import 'package:fitness_tracker/components/excercises_list_home.dart';
import 'package:fitness_tracker/components/radial_progress_cards.dart';
import 'package:fitness_tracker/features/home/widget/h_topNavBar.dart';
import 'package:fitness_tracker/features/home/widget/hello.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    final appColors = Provider.of<AppColors>(context);
    return Scaffold(
      backgroundColor: appColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Hello(),
                HomeTopNavBar(appColors: appColors),
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: Text(
                //     "Current Progress",
                //     style: TextStyle(
                //       fontSize: MediaQuery.of(context).size.width / 25,
                //       color: appColors.onSecondaryHeading,
                //       fontWeight: FontWeight.bold,
                //     ),
                //   ),
                // ),
                // Padding(
                //   padding: const EdgeInsets.only(top: 18.0, bottom: 18.0),
                //   child: PulsatingButton(
                //     height: 50,
                //     width: 200,
                //     text: "Generate Plan",
                //     bgColor: appColors.primary,
                //     pulseColor: appColors.onPrimary,
                //     onTap: () {},
                //     textStyle: TextStyle(
                //         color: appColors.onPrimary,
                //         fontSize: 20,
                //         fontWeight: FontWeight.bold),
                //   ),
                // ),
                Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(top: 20, bottom: 30),
                  decoration: BoxDecoration(
                    color: appColors.primary,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Text(
                        "Recent Progress",
                        style: TextStyle(
                          color: appColors.onSecondary,
                          fontSize: MediaQuery.of(context).size.width / 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RadialProgressCards(
                            appColors: appColors,
                            value: 865,
                            label: "Steps",
                            icon: Ionicons.footsteps_sharp,
                            unit: "steps",
                            total: 1000,
                          ),
                          RadialProgressCards(
                            appColors: appColors,
                            value: 251,
                            label: "Calories to burn",
                            icon: Ionicons.flame_sharp,
                            unit: "Cals",
                            total: 600,
                          ),
                          // RadialProgressCards(
                          //     appColors: appColors,
                          //     value: 75,
                          //     label: "Nutrition"),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 5,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: appColors.onPrimary,
                  ),
                  child: Center(
                    child: Container(
                      height: MediaQuery.of(context).size.height / 6,
                      width: MediaQuery.of(context).size.width / 1.3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: appColors.background,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Weekly ",
                                  style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width / 20,
                                    color: appColors.onSecondary,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  "Challenge",
                                  style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width / 20,
                                    color: appColors.onPrimary,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              height: double.infinity,
                              width: MediaQuery.of(context).size.width / 2.7,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Image.asset(
                                "assets/splash.jpg",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(top: 20, bottom: 30),
                  decoration: BoxDecoration(
                    color: appColors.primary,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 30),
                        child: Text(
                          "Excersises",
                          style: defaultTextStyle(
                            appColors: appColors,
                            fontSize: 22,
                          ),
                        ),
                      ),
                      ConstrainedBox(
                        constraints: BoxConstraints(maxHeight: 350),
                        child: ExcercisesListHome(appColors: appColors),
                      ),
                    ],
                  ),
                ),
                // CustomLineChart(appColors: appColors),
                Container(
                  decoration: BoxDecoration(
                    color: appColors.background,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: CustomBarChart(appColors: appColors),
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 50),
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: Text(
                //     "Tips",
                //     style: TextStyle(
                //       fontSize: MediaQuery.of(context).size.width / 25,
                //       color: appColors.onSecondaryHeading,
                //       fontWeight: FontWeight.bold,
                //     ),
                //   ),
                // ),
                // SizedBox(
                //   height: MediaQuery.of(context).size.height / 50,
                // ),
                // SizedBox(
                //     height: MediaQuery.of(context).size.height / 5,
                //     width: double.infinity,
                //     child: ListView.builder(
                //         scrollDirection: Axis.horizontal,
                //         itemCount: 8,
                //         itemBuilder: (context, index) {
                //           return Row(
                //             children: [
                //               HContainer(
                //                 text: "Lifting Exercise",
                //                 timetxt: "15 mins",
                //               ),
                //               SizedBox(
                //                 width: MediaQuery.of(context).size.height / 40,
                //               ),
                //             ],
                //           );
                //         })),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
