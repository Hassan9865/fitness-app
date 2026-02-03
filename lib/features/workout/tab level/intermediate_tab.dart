import 'package:flutter/material.dart';

class IntermediateTab extends StatelessWidget {
  const IntermediateTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Itermediate",
        style: TextStyle(
          fontSize: MediaQuery.of(context).size.width / 20,
          fontWeight: FontWeight.bold,
          color: Colors.deepOrange,
        ),
      ),
    );
  }
}
