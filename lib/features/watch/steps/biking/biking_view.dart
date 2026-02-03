import 'package:fitness_tracker/components/app_colors.dart';
import 'package:fitness_tracker/components/default_text_style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BikingView extends StatefulWidget {
  const BikingView({super.key});

  @override
  State<BikingView> createState() => _BikingViewState();
}

class _BikingViewState extends State<BikingView> {
  @override
  Widget build(BuildContext context) {
    final appColors = Provider.of<AppColors>(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: appColors.onBackground,
        appBar: AppBar(
          backgroundColor: appColors.onBackground,
          centerTitle: true,
          leading: FloatingActionButton(
            elevation: 10,
            backgroundColor: appColors.onBackground,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_ios_new),
          ),
          title: Text(
            "Biking",
            style: defaultTextStyle(appColors: appColors, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
