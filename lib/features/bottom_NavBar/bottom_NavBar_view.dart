import 'package:fitness_tracker/components/app_colors.dart';
import 'package:fitness_tracker/components/default_text_style.dart';
import 'package:fitness_tracker/features/bottom_NavBar/cubit/nav_bar_cubit.dart';
import 'package:fitness_tracker/features/home/home_view.dart';
import 'package:fitness_tracker/features/trainer%20chat/Tchats_view.dart';
import 'package:fitness_tracker/features/watch/watch_view.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class BottomNavbarView extends StatelessWidget {
  final PersistentTabController _controller = PersistentTabController();
  @override
  Widget build(BuildContext context) {
    final appColors = Provider.of<AppColors>(context);

    return BlocProvider(
      create: (_) => BottomNavbarCubit(),
      child: BlocBuilder<BottomNavbarCubit, int>(
        builder: (context, currentIndex) {
          return PersistentTabView(
            context,
            controller: _controller,
            screens: _buildScreens(),
            items: _navBarsItems(appColors: appColors),
            handleAndroidBackButtonPress: true,
            resizeToAvoidBottomInset: false,
            stateManagement: false,
            hideNavigationBarWhenKeyboardAppears: true,
            onItemSelected: (index) {
              context.read<BottomNavbarCubit>().setIndex(index);
            },
            backgroundColor: appColors.background,
            hideOnScrollSettings: HideOnScrollSettings(
              hideNavBarOnScroll: false,
            ),
            // hideNavigationBar: model.isNavBarHidden,
          );
          // floatingActionButton: FloatingActionButton(
          //   onPressed: model.toggleNavBarVisibility,
          //   child: Icon(Icons.toggle_on),
          // ),
        },
      ),
    );
  }
}

List<Widget> _buildScreens() => [HomeView(), TchatsView(), WatchView()];

List<PersistentBottomNavBarItem> _navBarsItems({required AppColors appColors}) {
  return [
    PersistentBottomNavBarItem(
      icon: Icon(Icons.home_outlined),
      title: "Home",
      textStyle: defaultTextStyle(appColors: appColors),
      activeColorPrimary: appColors.onPrimary,
      inactiveColorPrimary: appColors.onSecondary,
    ),
    PersistentBottomNavBarItem(
      icon: Icon(Icons.chat),
      title: "Chat",
      textStyle: defaultTextStyle(appColors: appColors),
      activeColorPrimary: appColors.onPrimary,
      inactiveColorPrimary: appColors.onSecondary,
    ),
    PersistentBottomNavBarItem(
      icon: Icon(Icons.watch_outlined),
      title: "Watch",
      textStyle: defaultTextStyle(appColors: appColors),
      activeColorPrimary: appColors.onPrimary,
      inactiveColorPrimary: appColors.onSecondary,
    ),
    // PersistentBottomNavBarItem(
    //   icon: Icon(Icons.account_box_outlined),
    //   title: "My Ads",
    //   activeColorPrimary: Colors.white,
    //   inactiveColorPrimary: Colors.cyanAccent,
    // ),
    // PersistentBottomNavBarItem(
    //   icon: Icon(Icons.settings),
    //   title: "Settings",
    //   activeColorPrimary: Colors.white,
    //   inactiveColorPrimary: Colors.cyanAccent,
    // ),
  ];
}
