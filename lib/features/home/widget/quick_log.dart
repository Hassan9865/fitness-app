import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../cubit/home_cubit.dart';

class QuickLogBottomSheet extends StatelessWidget {
  const QuickLogBottomSheet({super.key});

  static Future<void> show(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => const QuickLogBottomSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "Quick Log",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 20),

          _item(
            context,
            title: "💪 Log Workout",
            icon: Icons.fitness_center,
            route: '/workout',
          ),

          _item(
            context,
            title: "🥗 Log Meal",
            icon: Icons.restaurant,
            route: '/nutrition',
          ),

          _item(
            context,
            title: "💧 Add Water",
            icon: Icons.water_drop,
            onTap: () {
              context.read<HomeCubit>().toggleWater();
            },
          ),

          _item(context, title: "⚖️ Update Weight", icon: Icons.monitor_weight),
        ],
      ),
    );
  }

  Widget _item(
    BuildContext context, {
    required String title,
    required IconData icon,
    String? route,
    VoidCallback? onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.deepOrange),
      title: Text(title),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {
        Navigator.pop(context);

        if (route != null) {
          context.push(route);
        } else {
          onTap?.call();
        }
      },
    );
  }
}
