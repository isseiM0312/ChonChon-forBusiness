import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';

import '../Common/Widgets/Cards.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return (DefaultTabController(
        initialIndex: 0,
        length: 3,
        child: Scaffold(
            backgroundColor: Color(0xffb94630),
            appBar: PreferredSize(
                preferredSize: const Size.fromHeight(135),
                child: AppBar(
                    backgroundColor: Colors.black,
                    title: const Text(
                      '"Chon Chon"',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    flexibleSpace: Container(
                        margin: EdgeInsets.only(top: 12),
                        color: Colors.black,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [searchBox(), profileBar()],
                        )))),
            body: 
            SingleChildScrollView(child:Container(
              color: Colors.black,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    color: Color(0xffb94630),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        linkInPage(
                            Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                            "プロフィール詳細"),
                        linkInPage(Icon(Icons.lock_clock, color: Colors.white),
                            "閲覧履歴"),
                        linkInPage(
                            Icon(Icons.hourglass_bottom, color: Colors.white),
                            "過去のイベント")
                      ],
                    ),
                  ),
                  currentEvent(context),
                  profileBox(Icon(Icons.person,color: Colors.white,), "  プロフィール詳細", profileDetail()),
                  profileBox(Icon(Icons.lock_clock,color: Colors.white), "  閲覧利益", eventList(context)),
                  profileBox(Icon(Icons.hourglass_bottom,color: Colors.white), "  過去のイベント", eventList(context)),
                  profileBox(Icon(Icons.bubble_chart,color: Colors.white),"  おすすめのイベント",eventList(context))
                ],
              ),
            ))
            )));
  }

  
}

Widget profileBar() {
  return (Container(
    color: Color(0xffb94630),
    child: Row(children: [
      ownerImage(""),
      Text("鎌田"),
      Text("経済学部/１年/女"),
      IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
      eventOverView(12, 12, 12)
    ]),
  ));
}

Widget eventOverView(int attendnum, int hostnum, int seenum) {
  return (Container(
      child: Row(children: [
    Container(
        margin: EdgeInsets.only(right: 10),
        child: Column(children: [
          whitetext("参加", 10),
          whitetext(attendnum.toString(), 10)
        ])),
    Container(
        margin: EdgeInsets.only(right: 10),
        color: Colors.white,
        width: 2,
        height: 20),
    Container(
        margin: EdgeInsets.only(right: 10),
        child: Column(children: [
          whitetext("主催", 10),
          whitetext(hostnum.toString(), 10)
        ])),
    Container(
        margin: EdgeInsets.only(right: 10),
        color: Colors.white,
        width: 2,
        height: 20),
    Container(
        margin: EdgeInsets.only(right: 10),
        child: Column(
            children: [whitetext("閲覧", 10), whitetext(seenum.toString(), 10)]))
  ])));
}

Widget searchBox() {
  return (Container(
      margin: const EdgeInsets.only(left: 30, top: 45, right: 30),
      child: TextField(
        cursorColor: Color(0xffb94630),
        decoration: InputDecoration(
          hintText: "検索",
          fillColor: Colors.white,
          filled: true,
          isDense: true,
          prefixIcon: const Icon(
            CupertinoIcons.search,
          ),
          contentPadding: const EdgeInsets.all(0),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(32),
          ),
        ),
      )));
}

Widget whitetext(String text, double? size) {
  return (Text(
    text,
    style: TextStyle(color: Colors.white, fontSize: size),
  ));
}

Widget linkInPage(Widget icon, String text) {
  return (Container(
    margin: EdgeInsets.all(10),
    child: InkWell(
      child: ClipRRect(
        child: Container(
          width: 100,
          height: 80,
          color: Colors.black87,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon,
              Container(margin: EdgeInsets.all(5), child: whitetext(text, 10))
            ],
          ),
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      onTap: () {},
    ),
  ));
}

Widget currentEvent(
    BuildContext context,
  ) {
    return (Container(
      margin: EdgeInsets.only(top: 10),
        color: Color(0xffb94630),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(right: 20, left: 20),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    whitetext("参加中のイベント", 15),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        child: Text("カレンダーに登録→",
                            style: TextStyle(
                                color: Color(0xffb94630), fontSize: 10)),
                        color: Colors.white60,
                      ),
                    )
                  ]),
            ),
            Container(
                child: eventCard(context, "ビブリオバトル", ["ビブリオバトル", "定期開催"],
                    DateTime(2022, 7, 30, 16, 00), "読書", 2, ""))
          ],
        )));
  }

Widget profileBox(Widget titleicon, String title, Widget content) {
  return (Container(
    margin: EdgeInsets.only(top: 10),
    padding: EdgeInsets.all(7),
    color: Color(0xffb94630),
    child: Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Row(
              children: [
                titleicon,
                whitetext(title, 10)
              ],
            ),
          ),
          Text(
            "もっと見る",
            style: TextStyle(color: Colors.white60, fontSize: 10),
          )
        ],
      ),
      content
    ]),
  ));
}

Widget profileDetail() {
  return (Column(children: [
    profileDetailChild("キャンパス", "日吉"),
    profileDetailChild("大学", "慶應義塾大学"),
    profileDetailChild("誕生日", "2000年1月1日"),
    profileDetailChild("出身高校", "慶應普通部"),
    profileDetailChild("出身", "東京"),
  ]));
}

Widget profileDetailChild(String title, String value) {
  return (Container(
    margin: EdgeInsets.only(top: 5, right: 20, left: 20, bottom: 5),
    child: Column(children: [
      Row(
        children: [
          whitetext(title, 10),
          Container(
            width: 20,
          ),
          Text(value)
        ],
      ),
      Container(
        color: Colors.white,
        height: 2,
      )
    ]),
  ));
}

Widget eventList(BuildContext context) {
  return (Container(
    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
        child: Row(
      children: [eventCard(context, "ビブリオバトル", ["ビブリオバトル", "定期開催"],
                    DateTime(2022, 7, 30, 16, 00), "読書", 2, ""),
                    eventCard(context, "ビブリオバトル", ["ビブリオバトル", "定期開催"],
                    DateTime(2022, 7, 30, 16, 00), "読書", 2, ""),
                    eventCard(context, "ビブリオバトル", ["ビブリオバトル", "定期開催"],
                    DateTime(2022, 7, 30, 16, 00), "読書", 2, "")],
    )),
  ));
}
