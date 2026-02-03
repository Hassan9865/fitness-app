import 'package:flutter/material.dart';
import 'package:girix_code_gauge/girix_code_gauge.dart';

class CustomRadialDial extends StatefulWidget {
  final double value;
  final double guageWidth;
  final double guageHeight;
  final double guageThickness;
  final double labelFontSize;
  const CustomRadialDial({
    super.key,
    required this.value,
    this.guageWidth = 200,
    this.guageHeight = 200,
    this.guageThickness = 20,
    this.labelFontSize = 30,
  });

  @override
  State<CustomRadialDial> createState() => _CustomRadialDialState();
}

class _CustomRadialDialState extends State<CustomRadialDial> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Text(
          '${widget.value}%',
          style: TextStyle(
            fontSize: widget.labelFontSize,
            fontWeight: FontWeight.w900,
            foreground: Paint()
              ..shader = LinearGradient(
                colors: <Color>[
                  Colors.pinkAccent,
                  Colors.redAccent,
                  Colors.cyan,
                  const Color.fromARGB(255, 151, 208, 255),
                ],
              ).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0)),
          ),
        ),
        GxRadialGauge(
          showValueAtCenter: false,
          size: Size(widget.guageWidth, widget.guageHeight),
          value: GaugeValue(value: widget.value, min: 0, max: 100),
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
            thickness: widget.guageThickness,
            gradient: LinearGradient(
              colors: [
                Colors.cyan,
                Colors.blue,
                Colors.purple,
                Colors.pinkAccent,
                Colors.redAccent,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.0, 0.2, 0.4, 0.6, 1.0],
            ),
          ),
        ),
      ],
    );
  }
}
