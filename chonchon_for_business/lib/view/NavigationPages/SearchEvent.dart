import 'dart:html';

import 'package:flutter/material.dart';

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
          UserCard(
              "ダンスの振り付け一緒に考えませんか？",
              "users/account1.jpg",
              [EdgeRoundContainer("6/27"), EdgeRoundContainer("6/28")],
              Eventcard("ダンス好き集まれ！", "users/account1.jpg")),
          UserCard(
              "ダンスミュージックについて語りたい！",
              "users/account2.jpg",
              [EdgeRoundContainer("6/27"), EdgeRoundContainer("6/28")],
              Eventcard("ダンス好き集まれ！", "users/account2.jpg"))
        ],
      )),
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

Widget Eventcard(String eventname, String eventimagepass) {
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

Widget UserCard(String message, String userimagepass, List<Widget> datewigets,
    Widget eventcard) {
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
            SizedBox(
                child: Image.asset(userimagepass), height: 200, width: 200),
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
                    child: ElevatedButton(
                      child: const Text('参加する！'),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        shape: const StadiumBorder(),
                      ),
                      onPressed: () {},
                    ),
                  )
                ],
              ),
            )
          ],
        )),
      )));
}
