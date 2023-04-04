import 'package:bumble_bot/presentation/global/colors.dart';
import 'package:bumble_bot/presentation/global/size.dart';
import 'package:bumble_bot/presentation/screens/home_screen.dart';
import 'package:bumble_bot/presentation/screens/post_screen.dart';
import 'package:bumble_bot/presentation/screens/profile_screen.dart';
import 'package:bumble_bot/presentation/screens/screening_screen.dart';
import 'package:bumble_bot/presentation/screens/wallet_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:persistent_bottom_nav_bar_custom/persistent-tab-view.dart';

class Navigation extends StatefulWidget {
  const Navigation({
    Key? key,
  }) : super(key: key);

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  @override
  Widget build(BuildContext context) {
    PersistentTabController controller;

    controller = PersistentTabController(initialIndex: 2);

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: cPremier,
    ));
    return PersistentTabView(
      context,
      navBarHeight: sHeightBarNavigation(context),
      controller: controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: cPremier,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: false,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      decoration: const NavBarDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style15,
    );
  }
}

List<PersistentBottomNavBarItem> _navBarsItems() {
  return [
    PersistentBottomNavBarItem(
      inactiveIcon: const Icon(
        Icons.fit_screen_outlined,
        size: 30,
        color: cWhite,
      ),
      icon: const Icon(
        Icons.fit_screen_rounded,
        size: 35,
        color: cWhite,
      ),
    ),
    PersistentBottomNavBarItem(
      inactiveIcon: const Icon(
        Icons.category_outlined,
        size: 30,
        color: cWhite,
      ),
      icon: const Icon(
        Icons.category_rounded,
        size: 35,
        color: cWhite,
      ),
    ),
    PersistentBottomNavBarItem(
      inactiveIcon: const Icon(
        Icons.home_outlined,
        size: 30,
        color: cPremier,
      ),
      icon: const Icon(
        Icons.home,
        size: 35,
        color: cPremier,
      ),
      activeColorPrimary: cWhite,
    ),
    PersistentBottomNavBarItem(
      inactiveIcon: const Icon(
        Icons.account_balance_wallet_outlined,
        size: 30,
        color: cWhite,
      ),
      icon: const Icon(
        Icons.account_balance_wallet,
        size: 35,
        color: cWhite,
      ),
    ),
    PersistentBottomNavBarItem(
      inactiveIcon: const Icon(
        Icons.account_circle_outlined,
        size: 30,
        color: cWhite,
      ),
      icon: const Icon(
        Icons.account_circle,
        size: 35,
        color: cWhite,
      ),
    ),
  ];
}

List<Widget> _buildScreens() {
  return [
    const ScreeningScreen(),
    const PostScreen(),
    const HomeScreen(),
    const WalletScreen(),
    const ProfileScreen()
  ];
}
