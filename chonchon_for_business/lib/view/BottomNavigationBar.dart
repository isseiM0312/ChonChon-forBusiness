import 'package:flutter/material.dart';
import 'package:chonchon_for_business/view/NavigationPages/SearchEvent.dart';


class MyBottomNavigationBar extends StatelessWidget {
  const MyBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyBotttomNavigationBarPage(),
    );
  }
}

class MyBotttomNavigationBarPage extends StatefulWidget {
  const MyBotttomNavigationBarPage({Key? key}) : super(key: key);

  @override
  State<MyBotttomNavigationBarPage> createState() => _MyBotttomNavigationBarPageState();
}

class _MyBotttomNavigationBarPageState extends State<MyBotttomNavigationBarPage> {
  static const _screens = [
    SearchEvent(),
    SearchEvent(),
    SearchEvent(),
    SearchEvent(),
    SearchEvent(),
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
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items:  <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'ホーム'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'イベント検索'),
            BottomNavigationBarItem(
                icon: Icon(Icons.add_circle_outline), label: '新規イベント'),
            BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'チャット'),
            BottomNavigationBarItem(icon: SizedBox(height: 40,width: 40,child:Image.asset('users/people.png')),label: 'プロフィール')
          ],
          type: BottomNavigationBarType.fixed,
        ));
  }
}