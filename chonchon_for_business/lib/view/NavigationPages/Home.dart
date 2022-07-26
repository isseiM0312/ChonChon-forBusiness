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
      backgroundColor: Color(0xffb94630),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                
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
            Container(
              child: Icon(
                Icons.search,
                color: Colors.blueAccent,
              ),
              padding: EdgeInsets.all(7),
            ),
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

Widget EdgeRoundContainer(String text,double height,double witdh, Color color) {
  return (Container(
      height: height,
      width: witdh,
      padding: EdgeInsets.all(2),
      margin: EdgeInsets.all(3),
      child: Text(
        text,
        style: TextStyle(color: color),
      ),
      decoration: BoxDecoration(
          color: Colors.black.withAlpha(70),
          borderRadius: BorderRadius.circular(100))));
}

Widget UserCard(
  String title,
  List<Widget> tags,
  String date,
  Widget catecory,
  List<String> userimagepass
) {
  return (Container(
      margin: EdgeInsets.all(10),
      height: 50,
      width: 500,
      decoration: BoxDecoration(
        color: Color(0xffb94630),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child:Row(children: [
        Column(children: [
          Container(child: Text(title),),
          Container(child: Row(children: tags),),
          Container(child: Text(date),),
          Container(child: catecory)
        ],),
        Column(children: [
          Container(child: Text("あと13分で募集終了!"),),
          Container(height: 25,),
          Container(child: Row(children: [Text("メンバー:2人"),],),)
        ],)
      ],)));
}
