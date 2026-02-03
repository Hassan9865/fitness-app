import 'package:fitness_tracker/components/app_colors.dart';
import 'package:fitness_tracker/features/home/widget/h_iconTab.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';

class HomeTopNavBar extends StatefulWidget {
  final AppColors appColors;
  const HomeTopNavBar({super.key, required this.appColors});

  @override
  State<HomeTopNavBar> createState() => _HomeTopNavBarState();
}

class _HomeTopNavBarState extends State<HomeTopNavBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
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
          margin: EdgeInsets.symmetric(horizontal: 30),
          color: widget.appColors.onSecondary,
        ),
        HIcontab(
          icon: Icon(Ionicons.nutrition_outline),
          text: "Nutrition",
          onPressed: () {
            GoRouter.of(context).push('/nutritionview');
          },
        ),
        // Container(
        //   height: 50,
        //   width: 2,
        //   margin: EdgeInsets.symmetric(horizontal: 10),
        //   color: widget.appColors.onSecondary,
        // ),
        // HIcontab(
        //   icon: Icon(Icons.watch_outlined),
        //   text: "Watch",
        //   onPressed: () {
        //     GoRouter.of(context).push('/watchView');
        //   },
        // ),
        Container(
          height: 50,
          width: 2,
          margin: EdgeInsets.symmetric(horizontal: 30),
          color: widget.appColors.onSecondary,
        ),
        HIcontab(
          icon: Icon(Icons.person_outline),
          text: "Tainers",
          onPressed: () {
            GoRouter.of(context).push('/trainersview');
          },
        ),
      ],
    );
  }
}
