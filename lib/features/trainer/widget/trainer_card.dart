import 'package:fitness_tracker/components/app_colors.dart';
import 'package:fitness_tracker/features/trainer/model/trainer_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class TrainerCard extends StatelessWidget {
  final Trainer trainer;

  const TrainerCard({super.key, required this.trainer});

  @override
  Widget build(BuildContext context) {
    final appColors = Provider.of<AppColors>(context);

    return Card(
      color: appColors.primary,
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Trainer Profile Image
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: AssetImage(trainer.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 16),

            // Trainer Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    trainer.name,
                    style: TextStyle(
                      color: appColors.onSecondary,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    trainer.specialization,
                    style: TextStyle(fontSize: 14, color: appColors.secondary),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 16),
                      Text(
                        " ${trainer.rating}",
                        style: TextStyle(
                          color: appColors.onSecondary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Icon(
                        Icons.work_outline,
                        color: appColors.secondary,
                        size: 16,
                      ),
                      Text(
                        " ${trainer.experience} yrs exp",
                        style: TextStyle(color: appColors.secondary),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Add Trainer Button
            IconButton(
              onPressed: () {
                GoRouter.of(context).push('/tchattingview');
              },
              icon: Icon(Icons.message_outlined, color: appColors.onSecondary),
            ),
          ],
        ),
      ),
    );
  }
}
