import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:cupertino_icons/cupertino_icons.dart';

class SearchEvent extends StatelessWidget {
  const SearchEvent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home',
      home: const SearchEventPage(title: "Home"),
    );
  }
}

class SearchEventPage extends StatefulWidget {
  const SearchEventPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<SearchEventPage> createState() => _SearchEventPageState();
}

class _SearchEventPageState extends State<SearchEventPage> {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //SearchBar(),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                UserCard(
                    "ダンスの振り付け一緒に考えませんか？",
                    "users/account1.jpg",
                    [EdgeRoundContainer("6/27"), EdgeRoundContainer("6/28")],
                    EventCard("ダンス好き集まれ！", "users/account1.jpg"),
                    ProfileContainer("たく", "経済", "1年")),
                UserCard(
                    "ダンスミュージックについて語りたい！",
                    "users/account2.jpg",
                    [EdgeRoundContainer("6/27"), EdgeRoundContainer("6/28")],
                    EventCard("ダンスミュージック", "users/account2.jpg"),
                    ProfileContainer("やまだ", "理工", "2年")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget SearchTags() {
  return (Container(
      child: Row(
    children: [EdgeRoundContainer("6/27"), EdgeRoundContainer("6/27")],
  )));
}

Widget EdgeRoundContainer(String text) {
  return (Container(
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.all(3),
      child: Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
      decoration: BoxDecoration(
          color: Colors.black.withAlpha(70),
          borderRadius: BorderRadius.circular(100))));
}

Widget EventCard(String eventname, String eventimagepass) {
  return (Container(
    child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Container(
            child: Row(
          children: [
            Container(
              child: Image.asset(eventimagepass),
              width: 50,
              height: 50,
            ),
            Container(
              padding: EdgeInsets.all(4),
              child: Center(
                  child:
                      Text(eventname, style: TextStyle(color: Colors.white))),
              height: 50,
              color: Colors.black.withAlpha(70),
            )
          ],
        ))),
  ));
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

Widget UserCard(String message, String userimagepass, List<Widget> datewigets,
    Widget eventcard, Widget profilecontainer) {
  return (Container(
      margin: EdgeInsets.all(10),
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
        child: Container(
            child: Row(
          children: [
            Stack(
              children: [
                SizedBox(
                    child: Image.asset(userimagepass), height: 200, width: 200),
                profilecontainer,
              ],
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Column(
                children: [
                  Container(margin: EdgeInsets.all(3), child: eventcard),
                  Container(
                      margin: EdgeInsets.all(3),
                      child: Row(
                        children: datewigets,
                      )),
                  Container(
                    child: Text(message),
                    width: 150,
                  ),
                  Container(
                    margin: EdgeInsets.all(5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          child: const Text('参加する！'),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blue,
                            shape: const StadiumBorder(),
                          ),
                          onPressed: () {},
                        ),
                        IconButton(
                            onPressed: () {}, icon: Icon(CupertinoIcons.heart)),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        )),
      )));
}
