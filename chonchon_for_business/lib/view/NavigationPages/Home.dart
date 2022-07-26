import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:cupertino_icons/cupertino_icons.dart';

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
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color(0xffb94630) ,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                UserCard(
                    "ダンスの振り付け一緒に考えませんか？",
                    ["images/users/account1.jpg"],
                    [EdgeRoundContainer("6/27"), EdgeRoundContainer("6/28")],
                    
                    ProfileContainer("たく", "経済", "1年")),
                UserCard(
                    "ダンスミュージックについて語りたい！",
                    ["images/users/account2.jpg"],
                    [EdgeRoundContainer("6/27"), EdgeRoundContainer("6/28")],
                    
                    ProfileContainer("やまだ", "理工", "2年")),
              ],
            ),
          ],
        ),
      ),

    );
  }
}

Widget SearchBox() {
  return (Container(
      width: 400,
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 1.0),
            blurRadius: 6.0,
          ),
        ],
      ),
    child: ClipRRect(
    borderRadius: BorderRadius.circular(20.0),
    child: Container(
      child: Row(children: [
        Container(child:  Icon(
          Icons.search,
          color: Colors.blueAccent,
        ),
        padding: EdgeInsets.all(7),),
       
        Container(
          margin: EdgeInsets.only(left: 20),
          width: 200,
          child: TextField(
            decoration: InputDecoration(hintText: "Search"),
          ),
        )
      ]),
    ),
  )));
}

Widget SearchTags() {
  return (Container(
      padding: EdgeInsets.all(5),
      child: Row(
    children: [EdgeRoundContainer("6/27(月)"), EdgeRoundContainer("6/28(火)")],
  )));
}

Widget EdgeRoundContainer(String text) {
  return (Container(
      height: 22,
      padding: EdgeInsets.all(2),
      margin: EdgeInsets.all(3),
      child: Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
      decoration: BoxDecoration(
          color: Colors.black.withAlpha(70),
          borderRadius: BorderRadius.circular(100))));
}


Widget ProfileContainer(String name, String faculty, String grade) {
  return (Container(
      padding: EdgeInsets.all(10),
      height: 200,
      width: 200,
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            margin: EdgeInsets.all(5),
            child: Text(
              name,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Container(
              width: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    faculty,
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  Text(
                    grade,
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ],
              )),
        ],
      ))));
}

Widget UserCard(String message, List<String> userimagepass, List<Widget> datewigets,
    Widget profilecontainer) {
  return (Container(
      margin: EdgeInsets.all(10),
      height: 200,
      width: 420,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 1.0),
            blurRadius: 6.0,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Container(),
      )));
}
