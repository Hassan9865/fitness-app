import 'package:fitness_tracker/components/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class Hello extends StatelessWidget {
  const Hello({super.key});

  @override
  Widget build(BuildContext context) {
    final appColors = Provider.of<AppColors>(context);
    return Container(
      height: MediaQuery.of(context).size.height / 10,
      width: MediaQuery.of(context).size.width / 1,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: appColors.primary,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              GoRouter.of(context).push('/profileview');
            },
            child: Row(
              children: [
                SizedBox(width: MediaQuery.of(context).size.width / 16),
                CircleAvatar(
                  radius: MediaQuery.of(context).size.width / 15,
                  backgroundImage: AssetImage("assets/pic1.jpg"),
                ),
                SizedBox(width: MediaQuery.of(context).size.width / 25),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hello Hassan",
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width / 25,
                        color: appColors.onSecondary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(
                          Icons.favorite,
                          color: Colors.deepOrange,
                          size: 16,
                        ),
                        SizedBox(width: 4),
                        Text.rich(
                          TextSpan(
                            children: [
                              WidgetSpan(
                                child: Text(
                                  "88%",
                                  style: TextStyle(
                                    color: appColors.onPrimary,
                                    fontSize:
                                        MediaQuery.of(context).size.width / 30,
                                  ),
                                ),
                              ),
                              WidgetSpan(
                                child: Text(
                                  " Healthy",
                                  style: TextStyle(
                                    color: appColors.onSecondary,
                                    fontSize:
                                        MediaQuery.of(context).size.width / 30,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 4),
                        // Container(
                        //   padding: EdgeInsets.symmetric(
                        //     horizontal: 6,
                        //     vertical: 2,
                        //   ),
                        //   decoration: BoxDecoration(
                        //     color: Colors.deepOrange,
                        //     borderRadius: BorderRadius.circular(10),
                        //   ),
                        //   child: Text(
                        //     "Pro",
                        //     style: TextStyle(
                        //       color: appColors.onSecondary,
                        //       fontSize: MediaQuery.of(context).size.width / 35,
                        //       fontWeight: FontWeight.bold,
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Padding(
          //   padding: EdgeInsets.only(right: 10),
          //   child: IconButton(
          //     onPressed: () {
          //       GoRouter.of(context).push('/notifiview');
          //     },
          //     icon: Icon(
          //       Icons.notifications_outlined,
          //       color: appColors.onSecondary,
          //       size: MediaQuery.of(context).size.width / 15,
          //     ),
          //   ),
          // ),

          // Padding(
          //   padding: const EdgeInsets.only(right: 15.0),
          //   child: IconButton(
          //     onPressed: () {
          //       GoRouter.of(context).push('/settingsview');
          //     },
          //     icon: Icon(
          //       Icons.settings_outlined,
          //       color: appColors.onSecondary,
          //       size: MediaQuery.of(context).size.width / 15,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}

class HelloUser extends StatelessWidget {
  const HelloUser({super.key});

  @override
  Widget build(BuildContext context) {
    final appColors = Provider.of<AppColors>(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
      child: GestureDetector(
        onTap: () {
          GoRouter.of(context).push('/profileview');
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hello, 👋",
                  style: TextStyle(
                    color: appColors.onSecondary.withOpacity(0.7),
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Hassan',
                  style: TextStyle(
                    color: appColors.onSecondary,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.deepOrange.shade400,
                    Colors.deepOrange.shade700,
                  ],
                ),
                shape: BoxShape.circle,
              ),
              child: CircleAvatar(
                radius: 25,
                backgroundColor: Colors.transparent,
                child: const Icon(Icons.person, color: Colors.white, size: 28),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
