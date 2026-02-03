import 'package:fitness_tracker/components/app_colors.dart';
import 'package:fitness_tracker/components/collection_buttons.dart';
import 'package:fitness_tracker/components/custom_radial_dial.dart';
import 'package:fitness_tracker/components/default_text_style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StepsCard extends StatefulWidget {
  final String title;
  final Icon titleIcon;
  final String description;
  final double val;
  final double valPercentage;
  final String valUnit;
  final String? btnText;

  const StepsCard({
    super.key,
    required this.title,
    required this.titleIcon,
    required this.description,
    required this.val,
    required this.valPercentage,
    required this.valUnit,
    this.btnText,
  });

  @override
  State<StepsCard> createState() => _StepsCardState();
}

class _StepsCardState extends State<StepsCard> {
  @override
  Widget build(BuildContext context) {
    final appColors = Provider.of<AppColors>(context);
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(10),
      width: double.infinity,
      // height: 140,
      decoration: BoxDecoration(
        color: appColors.background,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text.rich(
                    style: defaultTextStyle(
                      appColors: appColors,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                    TextSpan(
                      text: "",
                      children: [
                        WidgetSpan(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 18.0),
                            child: widget.titleIcon,
                          ),
                        ),
                        WidgetSpan(
                          child: Text(
                            widget.title,
                            style: defaultTextStyle(appColors: appColors),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    widget.description,
                    style: defaultTextStyle(appColors: appColors),
                  ),
                  Text.rich(
                    style: TextStyle(
                      color: appColors.onPrimary,
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                    ),
                    TextSpan(
                      text: "${widget.val}",
                      children: [
                        WidgetSpan(child: SizedBox(height: 1, width: 20)),
                        WidgetSpan(
                          child: Text(
                            widget.valUnit,
                            style: defaultTextStyle(appColors: appColors),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              CustomRadialDial(
                value: widget.valPercentage,
                guageWidth: 100,
                guageHeight: 100,
                guageThickness: 10,
                labelFontSize: 16,
              ),
            ],
          ),
          if (widget.btnText != null) ...[
            Padding(
              padding: EdgeInsets.all(0).copyWith(top: 30),
              child: CustomButtonCollection(
                onPressed: () {},
                text: widget.btnText!,
                width: 160,
                height: 40,
                appcolors: appColors,
                buttonColor: appColors.onPrimary,
                buttonTextColor: appColors.onSecondary,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
