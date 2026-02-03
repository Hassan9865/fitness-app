import 'package:fitness_tracker/components/app_colors.dart';
import 'package:fitness_tracker/components/excersice_tile.dart';
import 'package:flutter/material.dart';

class ExcercisesListHome extends StatefulWidget {
  final AppColors appColors;
  final bool shrinkWrapping;
  const ExcercisesListHome({
    super.key,
    required this.appColors,
    this.shrinkWrapping = true,
  });

  @override
  State<ExcercisesListHome> createState() => _ExcercisesListHomeState();
}

class _ExcercisesListHomeState extends State<ExcercisesListHome> {
  final excersices = [
    {"name": "Squats", "reps": "15", "image": "assets/splash.jpg"},
    {"name": "Push Ups", "reps": "20", "image": "assets/splash.jpg"},
    {"name": "Lunges", "reps": "30", "image": "assets/splash.jpg"},
  ];
  @override
  Widget build(BuildContext context) {
    void completeExcersice(int index) {
      setState(() {
        if (int.parse(excersices[index]["reps"]!) > 1) {
          excersices[index]["reps"] =
              (int.parse(excersices[index]["reps"]!) - 1).toString();
        } else {
          excersices.removeAt(index);
        }
        print(excersices);
      });
    }

    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      itemCount: excersices.length,
      shrinkWrap: widget.shrinkWrapping,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: InkWell(
            onTap: () => completeExcersice(index),
            child: ExerciseTile(
              exercises: excersices[index],
              appColors: widget.appColors,
            ),
          ),
        );
      },
    );
  }
}
