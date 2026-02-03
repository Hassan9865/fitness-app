import 'package:fitness_tracker/components/app_colors.dart';
import 'package:fitness_tracker/components/default_text_style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WatchHomeView extends StatefulWidget {
  const WatchHomeView({super.key});

  @override
  State<WatchHomeView> createState() => _WatchHomeViewState();
}

class _WatchHomeViewState extends State<WatchHomeView> {
  @override
  Widget build(BuildContext context) {
    final appColors = Provider.of<AppColors>(context);
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset('assets/SmartWatchPic.png', fit: BoxFit.cover),
        ),
        // Your actual content
        SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20, width: MediaQuery.of(context).size.width),
              Container(
                height: 80,
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.only(left: 15, right: 15, bottom: 50),
                decoration: BoxDecoration(
                  color: appColors.onPrimary.withAlpha(150),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    "Watch Status : Disconnected \n Battery Level : 0%",
                    style: defaultTextStyle(
                      appColors: appColors,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0).copyWith(bottom: 30),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    overlayColor: appColors.onSecondary,
                    backgroundColor: appColors.background,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    side: BorderSide(color: appColors.onSecondary, width: .5),
                    padding: const EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: 30,
                    ),
                  ),
                  onPressed: () {},
                  child: Text.rich(
                    style: defaultTextStyle(
                      appColors: appColors,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                    TextSpan(
                      text: "Connect ",
                      children: [
                        WidgetSpan(
                          child: Icon(
                            Icons.bluetooth_connected_sharp,
                            color: appColors.onPrimary,
                            size: 26,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
