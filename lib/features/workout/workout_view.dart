import 'package:fitness_tracker/components/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class WorkoutView extends StatelessWidget {
  const WorkoutView({super.key});

  final List<String> days = const [
    'Mon',
    'Tues',
    'Wed',
    'Thurs',
    'Fri',
    'Sat',
    'Sun',
  ];

  final Map<String, List<String>> exercises = const {
    'Mon': [
      'Push-ups: 3 sets of 12',
      'Bench Press: 4 sets of 8',
      'Tricep Dips: 3 sets of 10',
    ],
    'Tues': [
      'Pull-ups: 3 sets max reps',
      'Deadlifts: 4 sets of 6',
      'Bicep Curls: 3 sets of 12',
    ],
    'Wed': [
      'Squats: 4 sets of 10',
      'Lunges: 3 sets of 12 each leg',
      'Calf Raises: 3 sets of 15',
    ],
    'Thurs': [
      'Shoulder Press: 4 sets of 8',
      'Lateral Raises: 3 sets of 12',
      'Front Raises: 3 sets of 10',
    ],
    'Fri': [
      'Plank: 3 sets of 1 min',
      'Leg Raises: 3 sets of 15',
      'Russian Twists: 3 sets of 20',
    ],
    'Sat': ['Swimming: 30 mins', 'Cycling: 45 mins', 'Stretching: 20 mins'],
    'Sun': ['Rest Day', 'Light Yoga', 'Meditation'],
  };

  @override
  Widget build(BuildContext context) {
    final appColors = Provider.of<AppColors>(context);
    return DefaultTabController(
      length: days.length,
      child: Scaffold(
        backgroundColor: appColors.background,
        appBar: AppBar(
          backgroundColor: appColors.background,
          title: Text(
            "Workout",
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width / 20,
              fontWeight: FontWeight.bold,
              color: Colors.deepOrange,
            ),
          ),
          leading: IconButton(
            onPressed: () => context.go('/bottomnavbar'),
            icon: Icon(Icons.arrow_back, color: appColors.onSecondary),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              height: 45,
              child: TabBar(
                isScrollable: true,
                labelColor: Colors.white,
                unselectedLabelColor: Colors.deepOrange,
                indicator: BoxDecoration(
                  color: Colors.deepOrange,
                  borderRadius: BorderRadius.circular(25),
                ),
                tabs: days
                    .map(
                      (day) => Tab(
                        child: Text(
                          day,
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: days.map((day) {
            return Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 6,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: appColors.primary,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.deepOrange),
                    ),
                    child: Center(
                      child: Text(
                        "Focus on Your Goals",
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width / 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepOrange,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: ListView.builder(
                      itemCount: exercises[day]?.length ?? 0,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                            bottom: 16.0,
                            left: 10,
                            right: 10,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: appColors.primary,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 8,
                                  offset: Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(16),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          exercises[day]![index],
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: appColors.onSecondary,
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Row(
                                          children: [
                                            Container(
                                              padding: EdgeInsets.all(6),
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.deepOrange
                                                    .withOpacity(0.1),
                                              ),
                                              child: Icon(
                                                Icons.timelapse_outlined,
                                                size: 18,
                                                color: Colors.deepOrange,
                                              ),
                                            ),
                                            const SizedBox(width: 8),
                                            Text(
                                              "20 mins",
                                              style: TextStyle(
                                                color: Colors.deepOrange,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 6),
                                        Row(
                                          children: [
                                            Container(
                                              padding: EdgeInsets.all(6),
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.deepOrange
                                                    .withOpacity(0.1),
                                              ),
                                              child: Icon(
                                                Icons.calculate_outlined,
                                                size: 18,
                                                color: Colors.deepOrange,
                                              ),
                                            ),
                                            const SizedBox(width: 8),
                                            Text(
                                              "320 calories",
                                              style: TextStyle(
                                                color: Colors.deepOrange,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                  ),
                                  child: Image.asset(
                                    "assets/splash.jpg",
                                    width:
                                        MediaQuery.of(context).size.width *
                                        0.35,
                                    height:
                                        MediaQuery.of(context).size.height / 6,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
