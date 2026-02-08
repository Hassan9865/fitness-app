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

  // final Map<String, List<String>> exercises = const {
  //   'Mon': [
  //     'Push-ups: 3 sets of 12',
  //     'Bench Press: 4 sets of 8',
  //     'Tricep Dips: 3 sets of 10',
  //   ],
  //   'Tues': [
  //     'Pull-ups: 3 sets max reps',
  //     'Deadlifts: 4 sets of 6',
  //     'Bicep Curls: 3 sets of 12',
  //   ],
  //   'Wed': [
  //     'Squats: 4 sets of 10',
  //     'Lunges: 3 sets of 12 each leg',
  //     'Calf Raises: 3 sets of 15',
  //   ],
  //   'Thurs': [
  //     'Shoulder Press: 4 sets of 8',
  //     'Lateral Raises: 3 sets of 12',
  //     'Front Raises: 3 sets of 10',
  //   ],
  //   'Fri': [
  //     'Plank: 3 sets of 1 min',
  //     'Leg Raises: 3 sets of 15',
  //     'Russian Twists: 3 sets of 20',
  //   ],
  //   'Sat': ['Swimming: 30 mins', 'Cycling: 45 mins', 'Stretching: 20 mins'],
  //   'Sun': ['Rest Day', 'Light Yoga', 'Meditation'],
  // };
  final Map<String, List<Map<String, String>>> exercises = const {
    'Mon': [
      {
        'title': 'Push-ups: 3 sets of 12',
        'img':
            'https://media.istockphoto.com/id/498315681/photo/feeling-good-looking-great-from-working-out-regularly.jpg?s=612x612&w=0&k=20&c=duQJAouxh66t4bmpiEWuYuQFyWRnHi53G1EusiZzYd0=',
      },
      {
        'title': 'Bench Press: 4 sets of 8',
        'img':
            'https://images.unsplash.com/photo-1652363722833-509b3aac287b?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8YmVuY2glMjBwcmVzc3xlbnwwfHwwfHx8MA%3D%3D',
      },
      {
        'title': 'Tricep Dips: 3 sets of 10',
        'img':
            'https://cdn.pixabay.com/photo/2017/08/07/14/02/people-2604149_1280.jpg',
      },
    ],
    'Tues': [
      {
        'title': 'Pull-ups: 3 sets max reps',
        'img':
            'https://images.unsplash.com/photo-1583454155184-870a1f63aebc?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8cHVsbCUyMHVwc3xlbnwwfHwwfHx8MA%3D%3D',
      },
      {
        'title': 'Deadlifts: 4 sets of 6',
        'img':
            'https://images.unsplash.com/photo-1534368270820-9de3d8053204?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8ZGVhZGxpZnR8ZW58MHx8MHx8fDA%3D',
      },
      {
        'title': 'Bicep Curls: 3 sets of 12',
        'img':
            'https://plus.unsplash.com/premium_photo-1682435533755-273aec988f08?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8YmljZXAlMjBjdXJsc3xlbnwwfHwwfHx8MA%3D%3D',
      },
    ],
    'Wed': [
      {
        'title': 'Squats: 4 sets of 10',
        'img':
            'https://cdn.pixabay.com/photo/2017/08/07/14/02/people-2604149_1280.jpg',
      },
      {
        'title': 'Lunges: 3 sets of 12 each leg',
        'img':
            'https://cdn.pixabay.com/photo/2016/11/18/15/06/fitness-1838004_1280.jpg',
      },
      {
        'title': 'Calf Raises: 3 sets of 15',
        'img':
            'https://cdn.pixabay.com/photo/2016/11/19/12/54/feet-1839751_1280.jpg',
      },
    ],
    'Thurs': [
      {
        'title': 'Shoulder Press: 4 sets of 8',
        'img':
            'https://cdn.pixabay.com/photo/2016/11/21/15/46/bodybuilder-1846854_1280.jpg',
      },
      {
        'title': 'Lateral Raises: 3 sets of 12',
        'img':
            'https://cdn.pixabay.com/photo/2016/11/19/12/54/bodybuilder-1839753_1280.jpg',
      },
      {
        'title': 'Front Raises: 3 sets of 10',
        'img':
            'https://cdn.pixabay.com/photo/2017/08/07/14/02/people-2604149_1280.jpg',
      },
    ],
    'Fri': [
      {
        'title': 'Plank: 3 sets of 1 min',
        'img':
            'https://cdn.pixabay.com/photo/2017/08/07/14/02/people-2604149_1280.jpg',
      },
      {
        'title': 'Leg Raises: 3 sets of 15',
        'img':
            'https://cdn.pixabay.com/photo/2016/11/18/15/05/push-ups-1837992_1280.jpg',
      },
      {
        'title': 'Russian Twists: 3 sets of 20',
        'img':
            'https://cdn.pixabay.com/photo/2016/11/21/15/39/barbell-1846800_1280.jpg',
      },
    ],
    'Sat': [
      {
        'title': 'Swimming: 30 mins',
        'img':
            'https://cdn.pixabay.com/photo/2017/01/20/00/30/swimmer-1990929_1280.jpg',
      },
      {
        'title': 'Cycling: 45 mins',
        'img':
            'https://cdn.pixabay.com/photo/2015/07/02/10/22/training-828726_1280.jpg',
      },
      {
        'title': 'Stretching: 20 mins',
        'img':
            'https://cdn.pixabay.com/photo/2017/08/07/14/02/people-2604149_1280.jpg',
      },
    ],
    'Sun': [
      {
        'title': 'Rest Day',
        'img':
            'https://cdn.pixabay.com/photo/2016/11/22/23/38/woman-1853939_1280.jpg',
      },
      {
        'title': 'Light Yoga',
        'img':
            'https://cdn.pixabay.com/photo/2016/11/29/09/32/adult-1868750_1280.jpg',
      },
      {
        'title': 'Meditation',
        'img':
            'https://cdn.pixabay.com/photo/2017/01/20/00/30/yoga-1990920_1280.jpg',
      },
    ],
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
                        final item = exercises[day]![index];

                        return Padding(
                          padding: const EdgeInsets.only(
                            bottom: 16,
                            left: 10,
                            right: 10,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: appColors.primary,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: const [
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
                                          item['title']!,
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: appColors.onSecondary,
                                          ),
                                        ),
                                        const SizedBox(height: 10),

                                        // Time
                                        Row(
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.all(6),
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.deepOrange
                                                    .withOpacity(0.1),
                                              ),
                                              child: const Icon(
                                                Icons.timelapse_outlined,
                                                size: 18,
                                                color: Colors.deepOrange,
                                              ),
                                            ),
                                            const SizedBox(width: 8),
                                            const Text(
                                              "20 mins",
                                              style: TextStyle(
                                                color: Colors.deepOrange,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),

                                        const SizedBox(height: 6),

                                        // Calories
                                        Row(
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.all(6),
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.deepOrange
                                                    .withOpacity(0.1),
                                              ),
                                              child: const Icon(
                                                Icons.calculate_outlined,
                                                size: 18,
                                                color: Colors.deepOrange,
                                              ),
                                            ),
                                            const SizedBox(width: 8),
                                            const Text(
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

                                // 🔥 Network Image
                                ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                  ),
                                  child: Image.network(
                                    item['img']!,
                                    width:
                                        MediaQuery.of(context).size.width *
                                        0.35,
                                    height:
                                        MediaQuery.of(context).size.height / 6,
                                    fit: BoxFit.cover,
                                    loadingBuilder:
                                        (context, child, loadingProgress) {
                                          if (loadingProgress == null)
                                            return child;
                                          return SizedBox(
                                            width:
                                                MediaQuery.of(
                                                  context,
                                                ).size.width *
                                                0.35,
                                            height:
                                                MediaQuery.of(
                                                  context,
                                                ).size.height /
                                                6,
                                            child: const Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            ),
                                          );
                                        },
                                    errorBuilder: (context, error, stackTrace) {
                                      return Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                            0.35,
                                        height:
                                            MediaQuery.of(context).size.height /
                                            6,
                                        color: Colors.grey.shade300,
                                        child: const Icon(
                                          Icons.image_not_supported,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    // child: ListView.builder(
                    //   itemCount: exercises[day]?.length ?? 0,
                    //   itemBuilder: (context, index) {
                    //     return Padding(
                    //       padding: const EdgeInsets.only(
                    //         bottom: 16.0,
                    //         left: 10,
                    //         right: 10,
                    //       ),
                    //       child: Container(
                    //         decoration: BoxDecoration(
                    //           color: appColors.primary,
                    //           borderRadius: BorderRadius.circular(20),
                    //           boxShadow: [
                    //             BoxShadow(
                    //               color: Colors.black12,
                    //               blurRadius: 8,
                    //               offset: Offset(0, 4),
                    //             ),
                    //           ],
                    //         ),
                    //         child: Row(
                    //           children: [
                    //             Expanded(
                    //               child: Padding(
                    //                 padding: const EdgeInsets.all(16),
                    //                 child: Column(
                    //                   crossAxisAlignment:
                    //                       CrossAxisAlignment.start,
                    //                   mainAxisAlignment:
                    //                       MainAxisAlignment.center,
                    //                   children: [
                    //                     Text(
                    //                       exercises[day]![index],
                    //                       style: TextStyle(
                    //                         fontSize: 16,
                    //                         fontWeight: FontWeight.bold,
                    //                         color: appColors.onSecondary,
                    //                       ),
                    //                     ),
                    //                     const SizedBox(height: 10),
                    //                     Row(
                    //                       children: [
                    //                         Container(
                    //                           padding: EdgeInsets.all(6),
                    //                           decoration: BoxDecoration(
                    //                             shape: BoxShape.circle,
                    //                             color: Colors.deepOrange
                    //                                 .withOpacity(0.1),
                    //                           ),
                    //                           child: Icon(
                    //                             Icons.timelapse_outlined,
                    //                             size: 18,
                    //                             color: Colors.deepOrange,
                    //                           ),
                    //                         ),
                    //                         const SizedBox(width: 8),
                    //                         Text(
                    //                           "20 mins",
                    //                           style: TextStyle(
                    //                             color: Colors.deepOrange,
                    //                             fontWeight: FontWeight.w500,
                    //                           ),
                    //                         ),
                    //                       ],
                    //                     ),
                    //                     const SizedBox(height: 6),
                    //                     Row(
                    //                       children: [
                    //                         Container(
                    //                           padding: EdgeInsets.all(6),
                    //                           decoration: BoxDecoration(
                    //                             shape: BoxShape.circle,
                    //                             color: Colors.deepOrange
                    //                                 .withOpacity(0.1),
                    //                           ),
                    //                           child: Icon(
                    //                             Icons.calculate_outlined,
                    //                             size: 18,
                    //                             color: Colors.deepOrange,
                    //                           ),
                    //                         ),
                    //                         const SizedBox(width: 8),
                    //                         Text(
                    //                           "320 calories",
                    //                           style: TextStyle(
                    //                             color: Colors.deepOrange,
                    //                             fontWeight: FontWeight.w500,
                    //                           ),
                    //                         ),
                    //                       ],
                    //                     ),
                    //                   ],
                    //                 ),
                    //               ),
                    //             ),
                    //             ClipRRect(
                    //               borderRadius: BorderRadius.only(
                    //                 topRight: Radius.circular(20),
                    //                 bottomRight: Radius.circular(20),
                    //               ),
                    //               child: Image.asset(
                    //                 "assets/pushup.jpg",
                    //                 width:
                    //                     MediaQuery.of(context).size.width *
                    //                     0.35,
                    //                 height:
                    //                     MediaQuery.of(context).size.height / 6,
                    //                 fit: BoxFit.cover,
                    //               ),
                    //             ),
                    //           ],
                    //         ),
                    //       ),
                    //     );
                    //   },
                    // ),
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
