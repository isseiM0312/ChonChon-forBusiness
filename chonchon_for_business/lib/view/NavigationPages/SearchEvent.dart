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
          SearchBox(),
          SearchTags(),
          UserCard(
              "ダンスの振り付け一緒に考えませんか？",
              "users/account1.jpg",
              [EdgeRoundContainer("6/27(月)"), EdgeRoundContainer("6/28(火)")],
              Eventcard("ダンス好き集まれ！", "users/account1.jpg")),
          UserCard(
              "ダンスミュージックについて語りたい！",
              "users/account2.jpg",
              [EdgeRoundContainer("6/27(月)"), EdgeRoundContainer("6/28(火)")],
              Eventcard("ダンス好き集まれ！", "users/account2.jpg"))
        ],
      )),
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
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.all(3),
                              child: ElevatedButton(
                                child: const Text('参加する！'),
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.blue,
                                  shape: const StadiumBorder(),
                                ),
                                onPressed: () {},
                              ),
                            ),
                            Container(
                                child: IconButton(
                              icon: Icon(Icons.favorite),
                              onPressed: () {},
                            )),
                          ],
                        ),
                      ))
                ],
              ),
            )
          ],
        )),
      )));
}
