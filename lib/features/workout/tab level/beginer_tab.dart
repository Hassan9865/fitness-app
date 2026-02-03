import 'package:fitness_tracker/components/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BeginerTab extends StatelessWidget {
  const BeginerTab({super.key});

  @override
  Widget build(BuildContext context) {
    final appColors = Provider.of<AppColors>(context);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
            height: MediaQuery.of(context).size.height / 5,
            width: MediaQuery.of(context).size.width / 1,
            decoration: BoxDecoration(
              color: appColors.primary,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.deepOrange),
            ),
            child: Center(
              child: Text(
                "Focus on Your Goals",
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width / 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrange,
                ),
              ),
            ),
          ),
        ),
        Text(
          "Let's Go Beginner",
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.width / 15,
            fontWeight: FontWeight.bold,
            color: Colors.deepOrange,
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 8,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 6,
                    width: MediaQuery.of(context).size.width / 1.1,
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
                                "Upper Body",
                                style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width / 18,
                                  color: appColors.onSecondary,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 80,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.timelapse_outlined,
                                    color: appColors.onSecondary,
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 50,
                                  ),
                                  Text(
                                    "20 mins",
                                    style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width /
                                          30,
                                      color: Colors.deepOrange,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 80,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.calculate_outlined,
                                    color: appColors.onSecondary,
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 50,
                                  ),
                                  Text(
                                    "320 calories",
                                    style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width /
                                          30,
                                      color: Colors.deepOrange,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
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
                  SizedBox(height: 20),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
