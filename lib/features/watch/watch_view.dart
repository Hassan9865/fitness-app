import 'package:fitness_tracker/components/app_colors.dart';
import 'package:fitness_tracker/features/watch/blood_pressure/blood_pressure_view.dart';
import 'package:fitness_tracker/features/watch/steps/steps_view.dart';
import 'package:fitness_tracker/features/watch/watch_home/watch_home_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class WatchView extends StatefulWidget {
  const WatchView({super.key});

  @override
  State<WatchView> createState() => _WatchViewState();
}

class _WatchViewState extends State<WatchView> {
  final PageController _pageController = PageController(initialPage: 1);
  int _currentPage = 1;

  final List<Widget> pages = [
    Center(child: StepsView()),
    Center(child: WatchHomeView()),
    Center(child: BloodPressureView()),
  ];

  void _goToPage(int index) {
    if (index >= 0 && index < pages.length) {
      _pageController.animateToPage(
        index,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final appColors = Provider.of<AppColors>(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(top: 18.0),
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: appColors.onSecondary.withAlpha(50),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              _currentPage != 1
                  ? (_currentPage != 0 ? "Health" : "Sports")
                  : "Watch",
              style: TextStyle(
                color: appColors.onPrimary,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        centerTitle: true,
        leading: Container(
          margin: const EdgeInsets.only(left: 15, top: 15),
          child: FloatingActionButton(
            elevation: 10,
            backgroundColor: appColors.primary.withAlpha(150),
            onPressed: () {
              if (GoRouter.of(context).canPop()) {
                GoRouter.of(context).pop();
              } else {
                GoRouter.of(context).push('/bottomnavbar');
              }
            },
            child: const Icon(Icons.arrow_back_ios_new),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(90),
          child: Row(
            mainAxisAlignment: (_currentPage != 0
                ? (_currentPage != 2
                      ? MainAxisAlignment.spaceBetween
                      : MainAxisAlignment.start)
                : MainAxisAlignment.end),
            children: [
              if (_currentPage != 0) ...[
                InkWell(
                  onTap: () {
                    _goToPage(--_currentPage);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: appColors.onSecondary.withAlpha(50),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      color: appColors.onPrimary,
                    ),
                  ),
                ),
              ],
              if (_currentPage != 2) ...[
                InkWell(
                  onTap: () {
                    _goToPage(++_currentPage);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: appColors.onSecondary.withAlpha(50),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: appColors.onPrimary,
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     IconButton(
          //       icon: Icon(Icons.arrow_back_ios),
          //       onPressed: _currentPage > 0
          //           ? () => _goToPage(_currentPage - 1)
          //           : null,
          //     ),
          //     Text("Swipe View", style: TextStyle(fontSize: 20)),
          //     IconButton(
          //       icon: Icon(Icons.arrow_forward_ios),
          //       onPressed: _currentPage < pages.length - 1
          //           ? () => _goToPage(_currentPage + 1)
          //           : null,
          //     ),
          //   ],
          // ),
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              children: pages,
            ),
          ),
        ],
      ),
    );
  }
}
