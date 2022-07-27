import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chonchon_for_business/view/NavigationPages/Home.dart';

class MyBottomNavigationBar extends StatelessWidget {
  const MyBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      theme: ThemeData(),
      home: const MyBotttomNavigationBarPage(),
    );
  }
}

class MyBotttomNavigationBarPage extends StatefulWidget {
  const MyBotttomNavigationBarPage({Key? key}) : super(key: key);

  @override
  State<MyBotttomNavigationBarPage> createState() =>
      _MyBotttomNavigationBarPageState();
}

class _MyBotttomNavigationBarPageState
    extends State<MyBotttomNavigationBarPage> {
  static const _screens = [
    Home(),
    Home(),
    Home(),
    Home(),
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
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.plus_square,
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.chat_bubble_text,
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.person,
              ),
              label: '',
            )
          ],
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.black,
          selectedItemColor: const Color(0xffb94630),
          unselectedItemColor: Colors.white,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ));
  }
}
