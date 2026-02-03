import 'package:fitness_tracker/components/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HContainer extends StatelessWidget {
  final String? text;
  final String? timetxt;
  final Icon? icon;
  const HContainer({super.key, this.text, this.timetxt, this.icon});

  @override
  Widget build(BuildContext context) {
    final appColors = Provider.of<AppColors>(context);

    return Container(
      height: MediaQuery.of(context).size.height / 5.5,
      width: MediaQuery.of(context).size.width / 2.3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: appColors.primary,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              height: MediaQuery.of(context).size.height / 8,
              width: MediaQuery.of(context).size.width / 2.3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: appColors.onPrimary,
              ),
              child: Image.asset("assets/splash.jpg", fit: BoxFit.cover),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text(
              text ?? "",
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.width / 25,
                color: Colors.yellowAccent,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Row(
              children: [
                Icon(Icons.timelapse_outlined, color: Colors.blue),
                SizedBox(width: 5),
                Text(
                  timetxt ?? "",
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width / 25,
                    color: appColors.onSecondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
