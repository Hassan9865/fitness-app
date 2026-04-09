import 'package:fitness_tracker/components/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

// class WorkoutView extends StatelessWidget {
//   const WorkoutView({super.key});

//   final List<String> days = const [
//     'Mon',
//     'Tues',
//     'Wed',
//     'Thurs',
//     'Fri',
//     'Sat',
//     'Sun',
//   ];

//   final Map<String, List<Map<String, String>>> exercises = const {
//     'Mon': [
//       {
//         'title': '🔥 Warm Up: Jumping jack (30 sec)',
//         'img': 'assets/animations/Jumping Jack.json',
//       },
//       {
//         'title': '❤️ Cardio: Burpee and jump (12 reps)',
//         'img': 'assets/animations/Burpee and Jump Exercise.json',
//       },
//       {
//         'title': '🦵 Lower Body: Squat reach (15 reps)',
//         'img': 'assets/animations/Squat Reach.json',
//       },
//       {
//         'title': '💪 Upper Body: Wide arm push up (10 reps)',
//         'img': 'assets/animations/Wide_arm_push_up.json',
//       },
//       {
//         'title': '🧘 Core: Reverse crunches (15 reps)',
//         'img': 'assets/animations/Reverse Crunches.json',
//       },
//       {
//         'title': '❤️ Cardio: Jumping squats (12 reps)',
//         'img': 'assets/animations/Jumping_squats.json',
//       },
//       {
//         'title': '🧘‍♂️ Cool Down: Shoulder stretch (30 sec)',
//         'img': 'assets/animations/Shoulder Stretch.json',
//       },
//     ],
//     'Tues': [
//       {
//         'title': '🔥 Warm Up: Inchworm (8 reps)',
//         'img': 'assets/animations/Inchworm.json',
//       },
//       {
//         'title': '❤️ Cardio: Split jump (12 reps)',
//         'img': 'assets/animations/Split Jump Exercise.json',
//       },
//       {
//         'title': '🦵 Lower Body: Squat kicks (15 reps each leg)',
//         'img': 'assets/animations/Squat kicks.json',
//       },
//       {
//         'title': '🧘 Core: Seated abs circle (30 sec)',
//         'img': 'assets/animations/Seated abs circles.json',
//       },
//       {
//         'title': '💪 Upper Body: Punches (30 sec fast)',
//         'img': 'assets/animations/Punches.json',
//       },
//       {
//         'title': '💪 Upper Body: T plank (10 reps each side)',
//         'img': 'assets/animations/T Plank Excercise.json',
//       },
//       {
//         'title': '🧘‍♂️ Cool Down: Walking hip opener (30 sec)',
//         'img': 'assets/animations/walking_hip_opener_standard.json',
//       },
//     ],
//     'Wed': [
//       {
//         'title': '🔥 Warm Up: Walking hip opener (30 sec)',
//         'img': 'assets/animations/walking_hip_opener_standard.json',
//       },
//       {
//         'title': '🦵 Lower Body: Jumping squats (15 reps)',
//         'img': 'assets/animations/Jumping_squats.json',
//       },
//       {
//         'title': '❤️ Cardio: Split jump (12 reps)',
//         'img': 'assets/animations/Split Jump Exercise.json',
//       },
//       {
//         'title': '🦵 Lower Body: Squat reach (15 reps)',
//         'img': 'assets/animations/Squat Reach.json',
//       },
//       {
//         'title': '🦵 Lower Body: Squat kicks (15 reps)',
//         'img': 'assets/animations/Squat kicks.json',
//       },
//       {
//         'title': '🧘 Core: Reverse crunches (15 reps)',
//         'img': 'assets/animations/Reverse crunches.json',
//       },
//       {
//         'title': '🧘‍♂️ Cool Down: Inchworm slow (6 reps)',
//         'img': 'assets/animations/Inchworm.json',
//       },
//     ],
//     'Thurs': [
//       {
//         'title': '🔥 Warm Up: Shoulder stretch (30 sec)',
//         'img': 'assets/animations/Shoulder Stretch.json',
//       },
//       {
//         'title': '💪 Upper Body: Staggered push ups (8-10 reps)',
//         'img': 'assets/animations/Staggered_push_ups.json',
//       },
//       {
//         'title': '💪 Upper Body: Wide arm push up (10 reps)',
//         'img': 'assets/animations/Wide_arm_push_up.json',
//       },
//       {
//         'title': '💪 Upper Body: T plank (8 reps each side)',
//         'img': 'assets/animations/T Plank Excercise.json',
//       },
//       {
//         'title': '🧘 Core: Seated abs circle (30 sec)',
//         'img': 'assets/animations/Seated abs circles.json',
//       },
//       {
//         'title': '🧘‍♂️ Cool Down: Walking hip opener (30 sec)',
//         'img': 'assets/animations/walking_hip_opener_standard.json',
//       },
//       {
//         'title': '🧘‍♂️ Cool Down: Shoulder stretch (30 sec)',
//         'img': 'assets/animations/Shoulder Stretch.json',
//       },
//     ],
//     'Fri': [
//       {
//         'title': '🔥 Warm Up: Jumping jack (30 sec)',
//         'img': 'assets/animations/Jumping Jack.json',
//       },
//       {
//         'title': '❤️ Cardio: Burpee and jump (10 reps)',
//         'img': 'assets/animations/Burpee and Jump Exercise.json',
//       },
//       {
//         'title': '🦵 Lower Body: Jumping squats (12 reps)',
//         'img': 'assets/animations/Jumping_squats.json',
//       },
//       {
//         'title': '💪 Upper Body: Punches (30 sec)',
//         'img': 'assets/animations/Punches.json',
//       },
//       {
//         'title': '❤️ Cardio: Split jump (10 reps)',
//         'img': 'assets/animations/Split Jump Exercise.json',
//       },
//       {
//         'title': '🧘 Core: Seated abs circle (30 sec)',
//         'img': 'assets/animations/Seated abs circles.json',
//       },
//       {
//         'title': '🧘‍♂️ Cool Down: Inchworm slow (6 reps)',
//         'img': 'assets/animations/Inchworm.json',
//       },
//     ],
//     'Sat': [
//       {
//         'title': '🔥 Warm Up: Walking hip opener (30 sec)',
//         'img': 'assets/animations/walking_hip_opener_standard.json',
//       },
//       {
//         'title': '🧘 Core: Reverse crunches (12 reps)',
//         'img': 'assets/animations/Reverse Crunches.json',
//       },
//       {
//         'title': '🧘 Core: Seated abs circle (30 sec)',
//         'img': 'assets/animations/Seated abs circles.json',
//       },
//       {
//         'title': '💪 Upper Body: T plank (8 reps each side)',
//         'img': 'assets/animations/T Plank Excercise.json',
//       },
//       {
//         'title': '🧘‍♂️ Cool Down: Shoulder stretch (30 sec)',
//         'img': 'assets/animations/Shoulder Stretch.json',
//       },
//       {
//         'title': '🧘‍♂️ Cool Down: Walking hip opener (30 sec)',
//         'img': 'assets/animations/walking_hip_opener_standard.json',
//       },
//       {
//         'title': '🧘‍♂️ Cool Down: Inchworm slow (6 reps)',
//         'img': 'assets/animations/Inchworm.json',
//       },
//     ],
//     'Sun': [
//       {
//         'title': '😴 Rest Day - Complete Rest',
//         'img': 'assets/animations/Rest day.json',
//       },
//       {
//         'title': '🚶 Light Walk (20 mins)',
//         'img': 'assets/animations/Light walk.json',
//       },
//       {
//         'title': '🧘‍♂️ Deep Stretching (15 mins)',
//         'img': 'assets/animations/Deep stretching.json',
//       },
//     ],
//   };

//   @override
//   Widget build(BuildContext context) {
//     final appColors = Provider.of<AppColors>(context);
//     return DefaultTabController(
//       length: days.length,
//       child: Scaffold(
//         backgroundColor: appColors.background,
//         appBar: AppBar(
//           backgroundColor: appColors.background,
//           title: Text(
//             "Workout",
//             style: TextStyle(
//               fontSize: MediaQuery.of(context).size.width / 20,
//               fontWeight: FontWeight.bold,
//               color: Colors.deepOrange,
//             ),
//           ),
//           leading: IconButton(
//             onPressed: () => context.go('/bottomnavbar'),
//             icon: Icon(Icons.arrow_back, color: appColors.onSecondary),
//           ),
//           bottom: PreferredSize(
//             preferredSize: const Size.fromHeight(50),
//             child: Container(
//               margin: const EdgeInsets.symmetric(vertical: 8),
//               height: 45,
//               child: TabBar(
//                 isScrollable: true,
//                 labelColor: Colors.white,
//                 unselectedLabelColor: Colors.deepOrange,
//                 indicator: BoxDecoration(
//                   color: Colors.deepOrange,
//                   borderRadius: BorderRadius.circular(25),
//                 ),
//                 tabs: days
//                     .map(
//                       (day) => Tab(
//                         child: Text(
//                           day,
//                           style: const TextStyle(fontWeight: FontWeight.w600),
//                         ),
//                       ),
//                     )
//                     .toList(),
//               ),
//             ),
//           ),
//         ),
//         body: TabBarView(
//           children: days.map((day) {
//             return Padding(
//               padding: const EdgeInsets.all(12.0),
//               child: Column(
//                 children: [
//                   Container(
//                     height: MediaQuery.of(context).size.height / 6,
//                     width: double.infinity,
//                     decoration: BoxDecoration(
//                       color: appColors.primary,
//                       borderRadius: BorderRadius.circular(10),
//                       border: Border.all(color: Colors.deepOrange),
//                     ),
//                     child: Center(
//                       child: Text(
//                         "Focus on Your Goals",
//                         style: TextStyle(
//                           fontSize: MediaQuery.of(context).size.width / 15,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.deepOrange,
//                         ),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   Expanded(
//                     child: ListView.builder(
//                       itemCount: exercises[day]!.length,
//                       itemBuilder: (context, index) {
//                         final item = exercises[day]![index];

//                         return Padding(
//                           padding: const EdgeInsets.only(
//                             bottom: 16,
//                             left: 10,
//                             right: 10,
//                           ),
//                           child: Container(
//                             decoration: BoxDecoration(
//                               color: appColors.primary,
//                               borderRadius: BorderRadius.circular(20),
//                               boxShadow: const [
//                                 BoxShadow(
//                                   color: Colors.black12,
//                                   blurRadius: 8,
//                                   offset: Offset(0, 4),
//                                 ),
//                               ],
//                             ),
//                             child: Row(
//                               children: [
//                                 Expanded(
//                                   child: Padding(
//                                     padding: const EdgeInsets.all(16),
//                                     child: Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.center,
//                                       children: [
//                                         Text(
//                                           item['title']!,
//                                           // 'jumping jacks: 3 sets of 20',
//                                           style: TextStyle(
//                                             fontSize: 16,
//                                             fontWeight: FontWeight.bold,
//                                             color: appColors.onSecondary,
//                                           ),
//                                         ),
//                                         const SizedBox(height: 10),

//                                         // Time
//                                         Row(
//                                           children: [
//                                             Container(
//                                               padding: const EdgeInsets.all(6),
//                                               decoration: BoxDecoration(
//                                                 shape: BoxShape.circle,
//                                                 color: Colors.deepOrange
//                                                     .withOpacity(0.1),
//                                               ),
//                                               child: const Icon(
//                                                 Icons.timelapse_outlined,
//                                                 size: 18,
//                                                 color: Colors.deepOrange,
//                                               ),
//                                             ),
//                                             const SizedBox(width: 8),
//                                             const Text(
//                                               "20 mins",
//                                               style: TextStyle(
//                                                 color: Colors.deepOrange,
//                                                 fontWeight: FontWeight.w500,
//                                               ),
//                                             ),
//                                           ],
//                                         ),

//                                         const SizedBox(height: 6),

//                                         // Calories
//                                         Row(
//                                           children: [
//                                             Container(
//                                               padding: const EdgeInsets.all(6),
//                                               decoration: BoxDecoration(
//                                                 shape: BoxShape.circle,
//                                                 color: Colors.deepOrange
//                                                     .withOpacity(0.1),
//                                               ),
//                                               child: const Icon(
//                                                 Icons.calculate_outlined,
//                                                 size: 18,
//                                                 color: Colors.deepOrange,
//                                               ),
//                                             ),
//                                             const SizedBox(width: 8),
//                                             const Text(
//                                               "320 calories",
//                                               style: TextStyle(
//                                                 color: Colors.deepOrange,
//                                                 fontWeight: FontWeight.w500,
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),

//                                 // 🔥 Network Image
//                                 ClipRRect(
//                                   borderRadius: const BorderRadius.only(
//                                     topRight: Radius.circular(20),
//                                     bottomRight: Radius.circular(20),
//                                   ),
//                                   child: Lottie.asset(
//                                     width:
//                                         MediaQuery.of(context).size.width *
//                                         0.35,
//                                     height:
//                                         MediaQuery.of(context).size.height / 6,
//                                     fit: BoxFit.cover,
//                                     item['img']!,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           }).toList(),
//         ),
//       ),
//     );
//   }
// }

class WorkoutView extends StatefulWidget {
  const WorkoutView({super.key});

  @override
  State<WorkoutView> createState() => _WorkoutViewState();
}

class _WorkoutViewState extends State<WorkoutView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String _selectedPlan = 'Weekly'; // 'Weekly', 'Full Body', 'Cardio', 'Core'
  int _completedWorkouts = 0;

  final List<String> days = const [
    'Mon',
    'Tues',
    'Wed',
    'Thurs',
    'Fri',
    'Sat',
    'Sun',
  ];

  // Track completed exercises per day
  final Map<String, Set<int>> _completedExercises = {};

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: days.length, vsync: this);
    _tabController.addListener(_updateCompletionCount);
  }

  void _updateCompletionCount() {
    final currentDay = days[_tabController.index];
    setState(() {
      _completedWorkouts = _completedExercises[currentDay]?.length ?? 0;
    });
  }

  void _toggleExercise(String day, int index) {
    setState(() {
      if (!_completedExercises.containsKey(day)) {
        _completedExercises[day] = {};
      }
      if (_completedExercises[day]!.contains(index)) {
        _completedExercises[day]!.remove(index);
      } else {
        _completedExercises[day]!.add(index);
      }
      _completedWorkouts = _completedExercises[day]?.length ?? 0;
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  final Map<String, List<Map<String, String>>> exercises = const {
    'Mon': [
      {
        'title': '🔥 Warm Up: Jumping jack',
        'duration': '30 sec',
        'calories': '15',
        'img': 'assets/animations/Jumping Jack.json',
      },
      {
        'title': '❤️ Cardio: Burpee and jump',
        'duration': '12 reps',
        'calories': '45',
        'img': 'assets/animations/Burpee and Jump Exercise.json',
      },
      {
        'title': '🦵 Lower Body: Squat reach',
        'duration': '15 reps',
        'calories': '30',
        'img': 'assets/animations/Squat Reach.json',
      },
      {
        'title': '💪 Upper Body: Wide arm push up',
        'duration': '10 reps',
        'calories': '25',
        'img': 'assets/animations/Wide_arm_push_up.json',
      },
      {
        'title': '🧘 Core: Reverse crunches',
        'duration': '15 reps',
        'calories': '20',
        'img': 'assets/animations/Reverse Crunches.json',
      },
      {
        'title': '❤️ Cardio: Jumping squats',
        'duration': '12 reps',
        'calories': '35',
        'img': 'assets/animations/Jumping_squats.json',
      },
      {
        'title': '🧘‍♂️ Cool Down: Shoulder stretch',
        'duration': '30 sec',
        'calories': '10',
        'img': 'assets/animations/Shoulder Stretch.json',
      },
    ],
    'Tues': [
      {
        'title': '🔥 Warm Up: Inchworm',
        'duration': '8 reps',
        'calories': '20',
        'img': 'assets/animations/Inchworm.json',
      },
      {
        'title': '❤️ Cardio: Split jump',
        'duration': '12 reps',
        'calories': '40',
        'img': 'assets/animations/Split Jump Exercise.json',
      },
      {
        'title': '🦵 Lower Body: Squat kicks',
        'duration': '15 reps each leg',
        'calories': '35',
        'img': 'assets/animations/Squat kicks.json',
      },
      {
        'title': '🧘 Core: Seated abs circle',
        'duration': '30 sec',
        'calories': '15',
        'img': 'assets/animations/Seated abs circles.json',
      },
      {
        'title': '💪 Upper Body: Punches',
        'duration': '30 sec fast',
        'calories': '30',
        'img': 'assets/animations/Punches.json',
      },
      {
        'title': '💪 Upper Body: T plank',
        'duration': '10 reps each side',
        'calories': '25',
        'img': 'assets/animations/T Plank Excercise.json',
      },
      {
        'title': '🧘‍♂️ Cool Down: Walking hip opener',
        'duration': '30 sec',
        'calories': '10',
        'img': 'assets/animations/walking_hip_opener_standard.json',
      },
    ],
    'Wed': [
      {
        'title': '🔥 Warm Up: Walking hip opener',
        'duration': '30 sec',
        'calories': '10',
        'img': 'assets/animations/walking_hip_opener_standard.json',
      },
      {
        'title': '🦵 Lower Body: Jumping squats',
        'duration': '15 reps',
        'calories': '40',
        'img': 'assets/animations/Jumping_squats.json',
      },
      {
        'title': '❤️ Cardio: Split jump',
        'duration': '12 reps',
        'calories': '40',
        'img': 'assets/animations/Split Jump Exercise.json',
      },
      {
        'title': '🦵 Lower Body: Squat reach',
        'duration': '15 reps',
        'calories': '30',
        'img': 'assets/animations/Squat Reach.json',
      },
      {
        'title': '🦵 Lower Body: Squat kicks',
        'duration': '15 reps',
        'calories': '35',
        'img': 'assets/animations/Squat kicks.json',
      },
      {
        'title': '🧘 Core: Reverse crunches',
        'duration': '15 reps',
        'calories': '20',
        'img': 'assets/animations/Reverse crunches.json',
      },
      {
        'title': '🧘‍♂️ Cool Down: Inchworm slow',
        'duration': '6 reps',
        'calories': '15',
        'img': 'assets/animations/Inchworm.json',
      },
    ],
    'Thurs': [
      {
        'title': '🔥 Warm Up: Shoulder stretch',
        'duration': '30 sec',
        'calories': '10',
        'img': 'assets/animations/Shoulder Stretch.json',
      },
      {
        'title': '💪 Upper Body: Staggered push ups',
        'duration': '8-10 reps',
        'calories': '30',
        'img': 'assets/animations/Staggered_push_ups.json',
      },
      {
        'title': '💪 Upper Body: Wide arm push up',
        'duration': '10 reps',
        'calories': '25',
        'img': 'assets/animations/Wide_arm_push_up.json',
      },
      {
        'title': '💪 Upper Body: T plank',
        'duration': '8 reps each side',
        'calories': '25',
        'img': 'assets/animations/T Plank Excercise.json',
      },
      {
        'title': '🧘 Core: Seated abs circle',
        'duration': '30 sec',
        'calories': '15',
        'img': 'assets/animations/Seated abs circles.json',
      },
      {
        'title': '🧘‍♂️ Cool Down: Walking hip opener',
        'duration': '30 sec',
        'calories': '10',
        'img': 'assets/animations/walking_hip_opener_standard.json',
      },
      {
        'title': '🧘‍♂️ Cool Down: Shoulder stretch',
        'duration': '30 sec',
        'calories': '10',
        'img': 'assets/animations/Shoulder Stretch.json',
      },
    ],
    'Fri': [
      {
        'title': '🔥 Warm Up: Jumping jack',
        'duration': '30 sec',
        'calories': '15',
        'img': 'assets/animations/Jumping Jack.json',
      },
      {
        'title': '❤️ Cardio: Burpee and jump',
        'duration': '10 reps',
        'calories': '45',
        'img': 'assets/animations/Burpee and Jump Exercise.json',
      },
      {
        'title': '🦵 Lower Body: Jumping squats',
        'duration': '12 reps',
        'calories': '40',
        'img': 'assets/animations/Jumping_squats.json',
      },
      {
        'title': '💪 Upper Body: Punches',
        'duration': '30 sec',
        'calories': '30',
        'img': 'assets/animations/Punches.json',
      },
      {
        'title': '❤️ Cardio: Split jump',
        'duration': '10 reps',
        'calories': '40',
        'img': 'assets/animations/Split Jump Exercise.json',
      },
      {
        'title': '🧘 Core: Seated abs circle',
        'duration': '30 sec',
        'calories': '15',
        'img': 'assets/animations/Seated abs circles.json',
      },
      {
        'title': '🧘‍♂️ Cool Down: Inchworm slow',
        'duration': '6 reps',
        'calories': '15',
        'img': 'assets/animations/Inchworm.json',
      },
    ],
    'Sat': [
      {
        'title': '🔥 Warm Up: Walking hip opener',
        'duration': '30 sec',
        'calories': '10',
        'img': 'assets/animations/walking_hip_opener_standard.json',
      },
      {
        'title': '🧘 Core: Reverse crunches',
        'duration': '12 reps',
        'calories': '20',
        'img': 'assets/animations/Reverse Crunches.json',
      },
      {
        'title': '🧘 Core: Seated abs circle',
        'duration': '30 sec',
        'calories': '15',
        'img': 'assets/animations/Seated abs circles.json',
      },
      {
        'title': '💪 Upper Body: T plank',
        'duration': '8 reps each side',
        'calories': '25',
        'img': 'assets/animations/T Plank Excercise.json',
      },
      {
        'title': '🧘‍♂️ Cool Down: Shoulder stretch',
        'duration': '30 sec',
        'calories': '10',
        'img': 'assets/animations/Shoulder Stretch.json',
      },
      {
        'title': '🧘‍♂️ Cool Down: Walking hip opener',
        'duration': '30 sec',
        'calories': '10',
        'img': 'assets/animations/walking_hip_opener_standard.json',
      },
      {
        'title': '🧘‍♂️ Cool Down: Inchworm slow',
        'duration': '6 reps',
        'calories': '15',
        'img': 'assets/animations/Inchworm.json',
      },
    ],
    'Sun': [
      {
        'title': '😴 Rest Day - Complete Rest',
        'duration': 'Full Day',
        'calories': '0',
        'img': 'assets/animations/Rest day.json',
      },
      {
        'title': '🚶 Light Walk',
        'duration': '20 mins',
        'calories': '80',
        'img': 'assets/animations/Light walk.json',
      },
      {
        'title': '🧘‍♂️ Deep Stretching',
        'duration': '15 mins',
        'calories': '40',
        'img': 'assets/animations/Deep stretching.json',
      },
    ],
  };

  // Other workout plans
  final Map<String, List<Map<String, String>>> fullBodyPlan = {
    'exercises': [
      {
        'title': '🔥 Jumping Jack',
        'duration': '45 sec',
        'calories': '25',
        'img': 'assets/animations/Jumping Jack.json',
      },
      {
        'title': '💪 Push Ups',
        'duration': '12 reps',
        'calories': '30',
        'img': 'assets/animations/Wide_arm_push_up.json',
      },
      {
        'title': '🦵 Squats',
        'duration': '15 reps',
        'calories': '35',
        'img': 'assets/animations/Squat Reach.json',
      },
      {
        'title': '❤️ Burpees',
        'duration': '10 reps',
        'calories': '50',
        'img': 'assets/animations/Burpee and Jump Exercise.json',
      },
      {
        'title': '🧘 Plank',
        'duration': '30 sec',
        'calories': '20',
        'img': 'assets/animations/T Plank Excercise.json',
      },
    ],
  };

  @override
  Widget build(BuildContext context) {
    // final appColors = Provider.of<AppColors>(context);
    final appColors = Provider.of<AppColors>(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: appColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => context.go('/bottomnavbar'),
          icon: Icon(Icons.arrow_back_ios, color: appColors.onSecondary),
        ),
        title: Text(
          "Workout",
          style: TextStyle(
            fontSize: screenWidth / 18,
            fontWeight: FontWeight.bold,
            color: Colors.deepOrange,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // 🎯 Plan Selector Chips
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: SizedBox(
              height: 50,
              child: ListView(
                // shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: [
                  _buildPlanChip('Weekly', Icons.calendar_today, appColors),
                  const SizedBox(width: 12),
                  _buildPlanChip('Full Body', Icons.fitness_center, appColors),
                  const SizedBox(width: 12),
                  _buildPlanChip('Cardio', Icons.directions_run, appColors),
                  const SizedBox(width: 12),
                  _buildPlanChip('Core', Icons.accessibility_new, appColors),
                ],
              ),
            ),
          ),

          // 📊 Progress Card
          _buildProgressCard(appColors, screenWidth),

          const SizedBox(height: 16),

          // 📅 Day Tabs
          if (_selectedPlan == 'Weekly')
            _buildWeeklyTabs(appColors, screenWidth, screenHeight),
          if (_selectedPlan == 'Full Body')
            _buildPlanView(
              appColors,
              screenWidth,
              screenHeight,
              fullBodyPlan['exercises']!,
            ),
          if (_selectedPlan == 'Cardio')
            _buildPlanView(
              appColors,
              screenWidth,
              screenHeight,
              _getCardioPlan(),
            ),
          if (_selectedPlan == 'Core')
            _buildPlanView(
              appColors,
              screenWidth,
              screenHeight,
              _getCorePlan(),
            ),
        ],
      ),
    );
  }

  Widget _buildPlanChip(String title, IconData icon, AppColors appColors) {
    final isSelected = _selectedPlan == title;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedPlan = title;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? Colors.deepOrange : appColors.primary,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: isSelected
                ? Colors.deepOrange
                : Colors.deepOrange.withOpacity(0.3),
          ),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 18,
              color: isSelected ? Colors.white : Colors.deepOrange,
            ),
            const SizedBox(width: 6),
            Text(
              title,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.deepOrange,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressCard(AppColors appColors, double screenWidth) {
    final totalExercises = _selectedPlan == 'Weekly'
        ? (exercises[days[_tabController.index]]?.length ?? 0)
        : 0;
    final progress = totalExercises > 0
        ? _completedWorkouts / totalExercises
        : 0.0;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.deepOrange.shade700, Colors.deepOrange.shade400],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _selectedPlan == 'Weekly'
                        ? '${days[_tabController.index]} Progress'
                        : '$_selectedPlan Plan',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    _selectedPlan == 'Weekly'
                        ? '$_completedWorkouts / $totalExercises completed'
                        : 'Ready to crush it! 🔥',
                    style: const TextStyle(color: Colors.white70, fontSize: 12),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: const Icon(
                  Icons.emoji_events,
                  color: Colors.white,
                  size: 28,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: progress,
              backgroundColor: Colors.white.withOpacity(0.3),
              color: Colors.white,
              minHeight: 8,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWeeklyTabs(
    AppColors appColors,
    double screenWidth,
    double screenHeight,
  ) {
    return Expanded(
      child: Column(
        children: [
          Container(
            height: 50,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: TabBar(
              controller: _tabController,
              isScrollable: true,
              labelColor: Colors.deepOrange,
              unselectedLabelColor: appColors.onSecondary.withOpacity(0.6),
              indicator: BoxDecoration(
                color: Colors.deepOrange.withOpacity(0.1),
                borderRadius: BorderRadius.circular(25),
              ),
              labelStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
              unselectedLabelStyle: const TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 13,
              ),
              tabs: days.map((day) => Tab(text: day)).toList(),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: days.map((day) {
                return _buildExerciseList(
                  appColors,
                  screenWidth,
                  screenHeight,
                  exercises[day]!,
                  day,
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlanView(
    AppColors appColors,
    double screenWidth,
    double screenHeight,
    List<Map<String, String>> exercises,
  ) {
    return Expanded(
      child: _buildExerciseList(
        appColors,
        screenWidth,
        screenHeight,
        exercises,
        _selectedPlan,
      ),
    );
  }

  Widget _buildExerciseList(
    AppColors appColors,
    double screenWidth,
    double screenHeight,
    List<Map<String, String>> exercises,
    String dayKey,
  ) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: exercises.length,
      itemBuilder: (context, index) {
        final item = exercises[index];
        final isCompleted =
            _completedExercises[dayKey]?.contains(index) ?? false;

        return GestureDetector(
          onTap: () => _toggleExercise(dayKey, index),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: isCompleted
                  ? Colors.deepOrange.withOpacity(0.1)
                  : appColors.primary,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(
                color: isCompleted
                    ? Colors.deepOrange
                    : Colors.deepOrange.withOpacity(0.2),
                width: isCompleted ? 1.5 : 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              children: [
                // Checkbox / Completion Indicator
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Container(
                    width: 28,
                    height: 28,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isCompleted
                          ? Colors.deepOrange
                          : Colors.transparent,
                      border: Border.all(
                        color: isCompleted
                            ? Colors.deepOrange
                            : Colors.deepOrange.withOpacity(0.5),
                        width: 2,
                      ),
                    ),
                    child: isCompleted
                        ? const Icon(Icons.check, size: 18, color: Colors.white)
                        : null,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item['title']!,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: isCompleted
                                ? Colors.deepOrange
                                : appColors.onSecondary,
                            decoration: isCompleted
                                ? TextDecoration.lineThrough
                                : null,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            _buildInfoChip(
                              Icons.timer_outlined,
                              item['duration']!,
                              Colors.deepOrange,
                            ),
                            const SizedBox(width: 12),
                            _buildInfoChip(
                              Icons.local_fire_department,
                              '${item['calories']} cal',
                              Colors.orange,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(24),
                    bottomRight: Radius.circular(24),
                  ),
                  child: Lottie.asset(
                    item['img']!,
                    width: screenWidth * 0.28,
                    height: screenHeight / 7,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildInfoChip(IconData icon, String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Icon(icon, size: 14, color: color),
          const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w500,
              color: color,
            ),
          ),
        ],
      ),
    );
  }

  List<Map<String, String>> _getCardioPlan() {
    return [
      {
        'title': '❤️ Burpee and Jump',
        'duration': '12 reps',
        'calories': '50',
        'img': 'assets/animations/Burpee and Jump Exercise.json',
      },
      {
        'title': '❤️ Split Jump',
        'duration': '15 reps',
        'calories': '45',
        'img': 'assets/animations/Split Jump Exercise.json',
      },
      {
        'title': '❤️ Jumping Squats',
        'duration': '15 reps',
        'calories': '40',
        'img': 'assets/animations/Jumping_squats.json',
      },
      {
        'title': '❤️ Squat Kicks',
        'duration': '20 reps',
        'calories': '35',
        'img': 'assets/animations/Squat kicks.json',
      },
      {
        'title': '🔥 Jumping Jack',
        'duration': '45 sec',
        'calories': '30',
        'img': 'assets/animations/Jumping Jack.json',
      },
    ];
  }

  List<Map<String, String>> _getCorePlan() {
    return [
      {
        'title': '🧘 Reverse Crunches',
        'duration': '15 reps',
        'calories': '25',
        'img': 'assets/animations/Reverse Crunches.json',
      },
      {
        'title': '🧘 Seated Abs Circle',
        'duration': '30 sec',
        'calories': '20',
        'img': 'assets/animations/Seated abs circles.json',
      },
      {
        'title': '🧘 T Plank',
        'duration': '10 reps each side',
        'calories': '30',
        'img': 'assets/animations/T Plank Excercise.json',
      },
      {
        'title': '💪 Plank',
        'duration': '45 sec',
        'calories': '25',
        'img': 'assets/animations/Wide_arm_push_up.json',
      },
    ];
  }
}

// Helper class (assuming you have this)
// class AppColors extends ChangeNotifier {
//   Color background = Colors.black;
//   Color primary = Color(0xFF1E1E1E);
//   Color onSecondary = Colors.white;
//   Color secondary = Colors.grey;
// }
