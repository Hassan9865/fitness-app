import 'package:fitness_tracker/components/app_colors.dart';
import 'package:fitness_tracker/components/default_text_style.dart';
import 'package:flutter/material.dart';
import 'package:girix_code_gauge/girix_code_gauge.dart';

class RadialProgressCards extends StatefulWidget {
  final AppColors appColors;
  final double value;
  final String label;
  final GestureTapCallback? onTap;
  final IconData icon;
  final String unit;
  final double total;
  const RadialProgressCards({
    super.key,
    required this.appColors,
    required this.value,
    required this.label,
    this.onTap,
    required this.icon,
    required this.unit,
    required this.total,
  });

  @override
  State<RadialProgressCards> createState() => _RadialProgressCardsState();
}

class _RadialProgressCardsState extends State<RadialProgressCards>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 7),
    );

    _animation =
        Tween<double>(
            begin: 0,
            end: ((widget.value / widget.total) * 100),
          ).animate(
            CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic),
          )
          ..addListener(() {
            setState(() {});
          });

    _controller.forward();
  }

  @override
  void didUpdateWidget(covariant RadialProgressCards oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.value != widget.value) {
      _animation =
          Tween<double>(
            begin: 0,
            end: ((widget.value / widget.total) * 100),
          ).animate(
            CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic),
          );
      _controller.forward(from: 0);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap ?? () {},
      child: Container(
        padding: const EdgeInsets.all(25),
        margin: const EdgeInsets.only(top: 20),
        width: MediaQuery.of(context).size.width / 1.1,
        height: 150,
        decoration: BoxDecoration(
          color: widget.appColors.background,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 0.0),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // Text(
                      //   '${_animation.value.toInt()}%',
                      //   style: TextStyle(
                      //     fontSize: 18,
                      //     fontWeight: FontWeight.w900,
                      //     foreground: Paint()..color = widget.appColors.onPrimary,
                      //   ),
                      // ),
                      Icon(
                        widget.icon,
                        color: widget.appColors.onPrimary,
                        size: 35,
                      ),
                      GxRadialGauge(
                        showValueAtCenter: false,
                        size: const Size(80, 80),
                        value: GaugeValue(
                          value: _animation.value,
                          min: 0,
                          max: 100,
                        ),
                        showLabels: false,
                        labelTickStyle: RadialTickLabelStyle(
                          padding: 10,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                          offset: 10,
                        ),
                        interval: 10,
                        style: RadialGaugeStyle(
                          color: Colors.cyan,
                          thickness: 8,
                          gradient: LinearGradient(
                            colors: [
                              widget.appColors.onPrimary,
                              widget.appColors.onPrimary,
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            stops: [0.0, 1.0],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.total.toString(),
                        style: defaultTextStyle(
                          appColors: widget.appColors,
                          fontSize: 26,
                        ),
                      ),
                      Text(
                        "${widget.unit} total",
                        style: defaultTextStyle(
                          appColors: widget.appColors,
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.value.toString(),
                  style: defaultTextStyle(
                    appColors: widget.appColors,
                    fontSize: 38,
                  ),
                ),
                Text(
                  widget.unit,
                  style: defaultTextStyle(
                    appColors: widget.appColors,
                    fontSize: 13,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
