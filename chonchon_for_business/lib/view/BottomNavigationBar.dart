import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import 'package:chonchon_for_business/view/NavigationPages/Home.dart';
import 'package:chonchon_for_business/view/NavigationPages/EventCreate.dart';
import 'package:chonchon_for_business/view/NavigationPages/Profile.dart';

PersistentTabController _controller = PersistentTabController(initialIndex: 0);

class BottomNavigationBarPage extends StatelessWidget {
  const BottomNavigationBarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      navBarStyle: NavBarStyle.style12,
    );
  }
}

List<Widget> _buildScreens() {
  return const [
    HomePage(title: 'Home'),
    EventCreatePage(title: 'Event Create'),
    HomePage(title: 'Home'),
    ProfilePage(title: 'Profile'),
  ];
}

List<PersistentBottomNavBarItem> _navBarsItems() {
  return [
    PersistentBottomNavBarItem(
      icon: const Icon(CupertinoIcons.home),
      title: 'Home',
      activeColorPrimary: Color(0xffb94630),
      inactiveColorPrimary: Colors.white,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(CupertinoIcons.plus_square),
      title: 'Create Events',
      activeColorPrimary: Color(0xffb94630),
      inactiveColorPrimary: Colors.white,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(CupertinoIcons.chat_bubble_text),
      title: 'Talk',
      activeColorPrimary: Color(0xffb94630),
      inactiveColorPrimary: Colors.white,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(CupertinoIcons.person),
      title: 'Profile',
      activeColorPrimary: Color(0xffb94630),
      inactiveColorPrimary: Colors.white,
    ),
  ];
}
