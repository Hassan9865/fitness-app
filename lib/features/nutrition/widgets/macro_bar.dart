import 'package:flutter/material.dart';

class MacroBar extends StatelessWidget {
  final String label;
  final double percent;
  final Color color;
  final String current;
  final String goal;

  const MacroBar({
    super.key,
    required this.label,
    required this.percent,
    required this.color,
    required this.current,
    required this.goal,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
              Text(
                '$current / $goal',
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: percent,
              backgroundColor: Colors.grey.withOpacity(0.2),
              color: color,
              minHeight: 6,
            ),
          ),
        ],
      ),
    );
  }
}
