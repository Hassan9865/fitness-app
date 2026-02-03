import 'package:flutter/material.dart';

class PulsatingButton extends StatefulWidget {
  final double height;
  final double width;
  final Color bgColor;
  final Color pulseColor;
  final String text;
  final TextStyle textStyle;
  final Function onTap;
  final EdgeInsets margin;
  final EdgeInsets padding;

  const PulsatingButton({
    super.key,
    required this.height,
    required this.width,
    required this.bgColor,
    required this.pulseColor,
    required this.text,
    required this.onTap,
    required this.textStyle,
    this.margin = const EdgeInsets.only(top: 10, bottom: 10),
    this.padding = const EdgeInsets.all(0),
  });

  @override
  State<PulsatingButton> createState() => _PulsatingButtonState();
}

class _PulsatingButtonState extends State<PulsatingButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);

    _animation = Tween<double>(
      begin: 0.0,
      end: 20.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(30),
            radius: 50,
            splashColor: widget.pulseColor.withValues(alpha: 0.5),
            child: Container(
              height: widget.height,
              width: widget.width,
              margin: widget.margin,
              padding: widget.padding,
              decoration: BoxDecoration(
                color: widget.bgColor,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: widget.pulseColor.withValues(alpha: 0.5),
                    blurRadius: _animation.value,
                    spreadRadius: _animation.value / 2,
                  ),
                ],
              ),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  widget.text,
                  style: widget.textStyle,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
