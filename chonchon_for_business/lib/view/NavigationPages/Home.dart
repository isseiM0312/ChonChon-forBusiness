import 'dart:html';

import 'package:flutter/material.dart';

import 'package:chonchon_for_business/view/NavigationPages/SearchEvent.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home',
      home: const HomePage(title: "Home"),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          UserCard(
              "ダンスの振り付け一緒に考えませんか？",
              "users/account1.jpg",
              [EdgeRoundContainer("6/27"), EdgeRoundContainer("6/28")],
              Eventcard("ダンス好き集まれ！", "users/account1.jpg"),
              ProfileContainer("たく", "経済", "1年")),
          UserCard(
              "ダンスミュージックについて語りたい！",
              "users/account2.jpg",
              [EdgeRoundContainer("6/27"), EdgeRoundContainer("6/28")],
              Eventcard("ダンスミュージック", "users/account2.jpg"),
              ProfileContainer("やまだ", "理工", "2年")),
        ],
      )),
    );
  }
}
