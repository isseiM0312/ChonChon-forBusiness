import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
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
          HomeHeader(),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              UserCard(
                  "ダンスの振り付け一緒に考えませんか？",
                  "images/users/account1.jpg",
                  [EdgeRoundContainer("6/27"), EdgeRoundContainer("6/28")],
                  EventCard("ダンス好き集まれ！", "images/users/account1.jpg"),
                  ProfileContainer("たく", "経済", "1年")),
              UserCard(
                  "ダンスミュージックについて語りたい！",
                  "images/users/account2.jpg",
                  [EdgeRoundContainer("6/27"), EdgeRoundContainer("6/28")],
                  EventCard("ダンスミュージック", "images/users/account2.jpg"),
                  ProfileContainer("やまだ", "理工", "2年")),
            ],
          ),
        ],
      )),
    );
  }
}

Widget HomeHeader() {
  return (AppBar(
    title: Image.asset("images/system/logo_home.png"),
    backgroundColor: Colors.white,
    centerTitle: false,
    elevation: 0,
    actions: <Widget>[
      IconButton(
        onPressed: () {},
        icon: Icon(CupertinoIcons.bell),
        color: Colors.blue,
        iconSize: 30,
      ),
      IconButton(
        onPressed: () {},
        icon: Icon(CupertinoIcons.heart),
        color: Colors.blue,
        iconSize: 30,
      ),
      Container(
        width: 20,
      )
    ],
  ));
}