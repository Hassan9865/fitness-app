import 'package:flutter/material.dart';

class AdvanceTab extends StatelessWidget {
  const AdvanceTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Advance",
        style: TextStyle(
          fontSize: MediaQuery.of(context).size.width / 20,
          fontWeight: FontWeight.bold,
          color: Colors.deepOrange,
        ),
      ),
    );
  }
}
