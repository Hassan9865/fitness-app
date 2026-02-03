import 'package:fitness_tracker/components/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NutritionDays extends StatefulWidget {
  const NutritionDays({super.key});

  @override
  State<NutritionDays> createState() => _NutritionDaysState();
}

class _NutritionDaysState extends State<NutritionDays> {
  int _selectedDay = DateTime.now().weekday - 1; // 0-6 (Mon-Sun)
  final List<String> _days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

  int _getDayNumber(int index) {
    final now = DateTime.now();
    final currentWeekday = now.weekday - 1;
    final difference = index - currentWeekday;
    return now.add(Duration(days: difference)).day;
  }

  @override
  Widget build(BuildContext context) {
    final appColors = Provider.of<AppColors>(context);

    return Container(
      // margin: const EdgeInsets.only(
      //   top: 20,
      // ),
      decoration: BoxDecoration(
        color: appColors.primary,
        border: Border(
          top: BorderSide(width: 4, color: appColors.onPrimary),
          bottom: BorderSide(width: 4, color: appColors.onPrimary),
        ),
      ),
      height: 110,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _days.length,
        itemBuilder: (context, index) {
          // return GestureDetector(
          //   onTap: () {
          //     setState(() {
          //       _selectedDay = index;
          //     });
          //   },
          //   child: Container(
          //     width: 80,
          //     alignment: Alignment.center,
          //     decoration: BoxDecoration(
          //       border: Border(
          //         bottom: BorderSide(
          //           width: 3,
          //           color: _selectedDay == index
          //               ? Colors.blue
          //               : Colors.transparent,
          //         ),
          //       ),
          //     ),
          //     child: Column(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       children: [
          //         Text(
          //           _days[index],
          //           style: TextStyle(
          //               fontSize: 16,
          //               fontWeight: _selectedDay == index
          //                   ? FontWeight.bold
          //                   : FontWeight.normal,
          //               color: _selectedDay == index
          //                   ? Colors.blue
          //                   : appColors.onSecondary),
          //         ),
          //         SizedBox(height: 4),
          //         Text(
          //           '${_getDayNumber(index)}',
          //           style: TextStyle(
          //             fontSize: 14,
          //             color: _selectedDay == index
          //                 ? Colors.blue
          //                 : appColors.secondary,
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // );
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedDay = index;
              });
            },
            child: Container(
              width: 90,
              margin: const EdgeInsets.all(10).copyWith(bottom: 20, top: 20),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: _selectedDay == index
                    ? appColors.onPrimary
                    : appColors.background,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: _selectedDay == index
                        ? appColors.onPrimary
                        : appColors.background, // Shadow color
                    spreadRadius: _selectedDay == index
                        ? 0.5
                        : 1, // How wide the shadow spreads
                    blurRadius: _selectedDay == index
                        ? 2
                        : 5, // Softness of the shadow
                    offset: Offset(0, 4), // X and Y offset
                  ),
                ],
                // border: Border(
                //   bottom: BorderSide(
                //     width: 3,
                //     color: _selectedDay == index ? appColors.onPrimary : appColors.background,
                //   ),
                // ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _days[index],
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: appColors.onSecondary,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    '${_getDayNumber(index)}',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: _selectedDay == index
                          ? FontWeight.bold
                          : FontWeight.w300,
                      color: appColors.onSecondary,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
