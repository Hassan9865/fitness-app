import 'package:fitness_tracker/components/app_colors.dart';
import 'package:fitness_tracker/components/custom_button.dart';
import 'package:fitness_tracker/components/default_text_style.dart';
import 'package:flutter/material.dart';

class CustomButtonCollection extends StatefulWidget {
  final String? type;
  final AppColors appcolors;
  final Function? onPressed;
  final String text;
  final Color? buttonColor;
  final Color? buttonTextColor;
  final double? width;
  final double? height;
  final double? fontSize;
  final double? padding;
  final IconData? trailingIcon;
  final IconData? leadingIcon;
  final FontWeight? fontWeight;

  const CustomButtonCollection({
    super.key,
    this.type,
    required this.appcolors,
    this.onPressed,
    required this.text,
    this.buttonColor,
    this.buttonTextColor,
    this.width,
    this.height,
    this.fontSize,
    this.padding,
    this.leadingIcon,
    this.trailingIcon,
    this.fontWeight,
  });

  @override
  State<CustomButtonCollection> createState() => _CustomButtonCollectionState();
}

class _CustomButtonCollectionState extends State<CustomButtonCollection> {
  @override
  Widget build(BuildContext context) {
    switch (widget.type) {
      case "Tile":
        return Padding(
          padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
          child: ElevatedButton(
            onPressed: widget.onPressed as VoidCallback? ?? () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: widget.buttonColor ?? widget.appcolors.primary,
              foregroundColor:
                  widget.buttonTextColor ?? widget.appcolors.onSecondary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: widget.padding ?? 20,
                vertical: widget.padding ?? 10,
              ),
              minimumSize: Size(
                widget.width ?? MediaQuery.of(context).size.width / 1.1,
                widget.height ?? MediaQuery.of(context).size.height / 13,
              ),
              textStyle: TextStyle(fontSize: widget.fontSize ?? 16),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: widget.trailingIcon != null
                      ? Alignment.center
                      : Alignment.centerLeft,
                  child: Row(
                    children: [
                      if (widget.trailingIcon != null) ...[
                        Icon(
                          widget.trailingIcon,
                          color: widget.appcolors.onSecondary,
                          size: 26,
                        ),
                        const SizedBox(width: 20),
                      ],
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(widget.text),
                      ),
                    ],
                  ),
                ),
                if (widget.leadingIcon != null) ...[
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 18.0),
                      child: Icon(
                        widget.leadingIcon,
                        color: widget.appcolors.onSecondary,
                        size: 26,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        );
      case "Primary":
        return ElevatedButton(
          onPressed: widget.onPressed as VoidCallback? ?? () {},
          style: ButtonStyle(
            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            ),
            fixedSize: WidgetStateProperty.all<Size>(
              Size(
                widget.width ?? MediaQuery.of(context).size.width / 1.6,
                widget.height ?? MediaQuery.of(context).size.height / 13,
              ),
            ),
            elevation: WidgetStateProperty.all(10),
            backgroundColor: WidgetStateProperty.all(
              widget.buttonColor ?? widget.appcolors.onPrimary,
            ),
            foregroundColor: WidgetStateProperty.all(
              widget.buttonTextColor ?? widget.appcolors.onSecondary,
            ),
          ),
          child: Text(
            widget.text,
            style: defaultTextStyle(
              appColors: widget.appcolors,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
        );
      default:
        return CustomButton(
          onPressed: widget.onPressed as VoidCallback? ?? () {},
          text: widget.text,
          buttonColor: widget.buttonColor ?? widget.appcolors.primary,
          buttonTextColor:
              widget.buttonTextColor ?? widget.appcolors.onSecondary,
          width: widget.width,
          height: widget.height,
          fontSize: widget.fontSize,
          fontWeight: widget.fontWeight,
        );
    }
  }
}
