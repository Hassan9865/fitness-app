import 'package:fitness_tracker/components/app_colors.dart';
import 'package:fitness_tracker/features/home/widget/h_container.dart';
import 'package:fitness_tracker/features/home/widget/h_iconTab.dart';
import 'package:fitness_tracker/features/home/widget/hello.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final appColors = Provider.of<AppColors>(context);
    return Scaffold(
      backgroundColor: appColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Hello(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  HIcontab(
                    icon: Icon(Icons.work_outline_outlined),
                    text: "WorkOut",
                    onPressed: () {
                      GoRouter.of(context).push('/workoutview');
                    },
                  ),
                  Container(
                    height: 50,
                    width: 2,
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    color: appColors.onSecondary,
                  ),
                  HIcontab(
                    icon: Icon(Icons.nat_outlined),
                    text: "Diet",
                    onPressed: () {},
                  ),
                  Container(
                    height: 50,
                    width: 2,
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    color: appColors.onSecondary,
                  ),
                  HIcontab(
                    icon: Icon(Icons.air_outlined),
                    text: "Ai Coach",
                    onPressed: () {
                      GoRouter.of(context).push('/aicoachview');
                    },
                  ),
                  Container(
                    height: 50,
                    width: 2,
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    color: appColors.onSecondary,
                  ),
                  HIcontab(
                    icon: Icon(Icons.person_outline),
                    text: "Tainers",
                    onPressed: () {
                      GoRouter.of(context).push('/Tchatsview');
                    },
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Recommended",
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width / 25,
                    color: Colors.yellowAccent,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 8,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        HContainer(
                          text: "Lifting Exercise",
                          timetxt: "15 mins",
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.height / 40,
                        ),
                      ],
                    );
                  },
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 50),
              Container(
                height: MediaQuery.of(context).size.height / 5,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blue,
                ),
                child: Center(
                  child: Container(
                    height: MediaQuery.of(context).size.height / 6,
                    width: MediaQuery.of(context).size.width / 1.3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: appColors.primary,
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
                                  color: Colors.deepOrange,
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Tips",
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width / 25,
                    color: Colors.yellowAccent,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 50),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 8,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        HContainer(
                          text: "Lifting Exercise",
                          timetxt: "15 mins",
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.height / 40,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
