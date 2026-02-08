import 'package:fitness_tracker/components/app_colors.dart';
import 'package:fitness_tracker/features/trainer/model/trainer_model.dart';
import 'package:fitness_tracker/features/trainer/widget/trainer_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TrainersScreen extends StatefulWidget {
  const TrainersScreen({super.key});

  @override
  State<TrainersScreen> createState() => _TrainersScreenState();
}

class _TrainersScreenState extends State<TrainersScreen> {
  List<Trainer> trainers = [
    Trainer(
      id: "1",
      name: "John Doe",
      specialization: "Weightlifting",
      experience: "5",
      rating: 4.8,
      imageUrl: "assets/pic2.jpg",
    ),
    Trainer(
      id: "2",
      name: "Jane Smith",
      specialization: "Yoga",
      experience: "3",
      rating: 4.6,
      imageUrl: "assets/pic3.jpg",
    ),
    Trainer(
      id: "3",
      name: "Mike Johnson",
      specialization: "CrossFit",
      experience: "7",
      rating: 4.9,
      imageUrl: "assets/pic1.jpg",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final appColors = Provider.of<AppColors>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: appColors.primary,
        title: Text(
          "Available Trainers",
          style: TextStyle(color: appColors.onSecondary),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: trainers.length,
        itemBuilder: (context, index) {
          return TrainerCard(trainer: trainers[index]);
        },
      ),
    );
  }
}
