import 'package:flutter/material.dart';
import 'package:chonchon_for_business/view/BottomNavigationBar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chon Chon',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => const MyBottomNavigationBarPage(),
      },
    );
  }
}
