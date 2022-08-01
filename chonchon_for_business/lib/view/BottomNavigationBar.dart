import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chonchon_for_business/view/NavigationPages/Home.dart';

class MyBottomNavigationBarPage extends StatefulWidget {
  const MyBottomNavigationBarPage({Key? key}) : super(key: key);

  @override
  State<MyBottomNavigationBarPage> createState() =>
      _MyBottomNavigationBarPageState();
}

class _MyBottomNavigationBarPageState
    extends State<MyBottomNavigationBarPage> {
  static const _screens = [
    HomePage(title: 'Home',),
    HomePage(title: 'Home',),
    HomePage(title: 'Home',),
    HomePage(title: 'Home',),
  ];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _screens[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.home,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.plus_square,
              ),
              label: "Create Events",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.chat_bubble_text,
              ),
              label: "Talk",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.person,
              ),
              label: 'Profile',
            )
          ],
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.black,
          selectedItemColor: const Color(0xffb94630),
          unselectedItemColor: Colors.white,
          currentIndex: _selectedIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedFontSize: 0.0,
          unselectedFontSize: 0.0,
          onTap: _onItemTapped,
        ));
  }
}
