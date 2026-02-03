import 'package:fitness_tracker/components/app_colors.dart';
import 'package:fitness_tracker/components/custom_radial_dial.dart';
import 'package:fitness_tracker/components/default_text_style.dart';
import 'package:fitness_tracker/components/steps_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Package:provider/provider.dart';
import 'package:go_router/go_router.dart';

class StepsView extends StatefulWidget {
  const StepsView({super.key});

  @override
  State<StepsView> createState() => _StepsViewState();
}

class _StepsViewState extends State<StepsView> {
  @override
  Widget build(BuildContext context) {
    final appColors = Provider.of<AppColors>(context);
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned.fill(
          child: Image.asset('assets/HeartWatch.png', fit: BoxFit.cover),
        ),
        Container(
          height: 150,
          width: 150,
          margin: const EdgeInsets.only(
            left: 15,
            right: 18,
            bottom: 350,
            top: 60,
          ),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: CustomRadialDial(
                  value: 75,
                  guageWidth: 100,
                  guageHeight: 100,
                  guageThickness: 10,
                  labelFontSize: 20,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: Text(
                  "Steps : 21256.0",
                  style: defaultTextStyle(
                    appColors: appColors,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
        SafeArea(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.only(
                  top: 335,
                  left: 15,
                  right: 15,
                  bottom: 50,
                ),
                decoration: BoxDecoration(
                  color: appColors.onBackground.withAlpha(120),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 30),
                      child: Text(
                        "Statistics",
                        style: defaultTextStyle(appColors: appColors),
                      ),
                    ),
                    SizedBox(
                      height: 38,
                      width: MediaQuery.of(context).size.width,
                    ),
                    StepsCard(
                      title: "Today's Step",
                      titleIcon: Icon(
                        Icons.directions_walk_sharp,
                        color: appColors.onPrimary,
                        size: 26,
                      ),
                      description: "steps",
                      val: 21256,
                      valUnit: "steps",
                      valPercentage: 75,
                    ),
                    InkWell(
                      onTap: () {
                        GoRouter.of(context).push("/walkingView");
                      },
                      child: StepsCard(
                        title: "Walking",
                        titleIcon: Icon(
                          FontAwesomeIcons.personWalking,
                          color: appColors.onPrimary,
                          size: 26,
                        ),
                        description: "Kilometer",
                        val: 256,
                        valUnit: "KM",
                        valPercentage: 25,
                        btnText: "Start Walking",
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        GoRouter.of(context).push("/runningView");
                      },
                      child: StepsCard(
                        title: "Running",
                        titleIcon: Icon(
                          FontAwesomeIcons.personRunning,
                          color: appColors.onPrimary,
                          size: 26,
                        ),
                        description: "Kilometer",
                        val: 21256,
                        valUnit: "KM",
                        valPercentage: 52,
                        btnText: "Start Running",
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        GoRouter.of(context).push("/bikingView");
                      },
                      child: StepsCard(
                        title: "Biking",
                        titleIcon: Icon(
                          FontAwesomeIcons.bicycle,
                          color: appColors.onPrimary,
                          size: 26,
                        ),
                        description: "Kilometer",
                        val: 21256,
                        valUnit: "KM",
                        valPercentage: 38,
                        btnText: "Start Biking",
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
