import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../Common/DateToString.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
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
                    flexibleSpace: searchBox(),
                    bottom: tabBar())),
            body: TabBarView(
              children: <Widget>[
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      eventCard("ビブリオバトル", ["ビブリオバトル", "定期開催"],
                          DateTime(2022, 7, 30, 16, 00), "読書", 2, ""),
                      eventCard("ビジネスに役立つ読書", ["経済", "ビジネス", "金融"],
                          DateTime(2022, 7, 30, 16, 50), "読書", 3, ""),
                      eventCard("ひまわり図書館", ["図書館"],
                          DateTime(2022, 7, 30, 15, 50), "読書", 1, ""),
                      eventCard("人文系の本を読もう！", ["初学者歓迎", "メディアセンター"],
                          DateTime(2022, 7, 30, 16, 30), "読書", 5, ""),
                    ],
                  ),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      eventCard("18世紀欧州の哲学", ["哲学", "専門家歓迎"],
                          DateTime(2022, 7, 31, 17, 50), "読書", 3, ""),
                      eventCard("自作PCの会", ["自作PC", "大学生", "実践"],
                          DateTime(2022, 7, 30, 17, 50), "DIY", 2, ""),
                    ],
                  ),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      eventCard("効率の良い家事", ["家事", "主夫"],
                          DateTime(2022, 7, 31, 16, 00), "家事", 1, ""),
                      eventCard("レポートやりましょう！", ["何でもOK", "学生歓迎", "仕事"],
                          DateTime(2022, 7, 30, 16, 50), "勉強", 2, ""),
                      eventCard("ライブの感想会", ["YOASOBI"],
                          DateTime(2022, 8, 1, 16, 50), "音楽", 2, ""),
                    ],
                  ),
                ),
              ],
            )));
  }
}

PreferredSizeWidget tabBar() {
  return (const TabBar(
    labelStyle: TextStyle(),
    unselectedLabelStyle: TextStyle(),
    labelColor: Color(0xffb94630),
    unselectedLabelColor: Colors.white,
    indicatorPadding: EdgeInsets.only(
      left: 10,
      right: 10,
    ),
    tabs: <Widget>[
      Tab(
        text: "フォロー",
      ),
      Tab(
        text: "おすすめ",
      ),
      Tab(
        text: "新着",
      ),
    ],
  ));
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

Widget eventCard(
  String eventTitle,
  List<String> tags,
  DateTime eventDate,
  String category,
  int currentParticipantsNum,
  String ownerImagePass,
) {
  return (Container(
    margin: const EdgeInsets.all(6),
    height: 85,
    width: 500,
    decoration: BoxDecoration(
      color: Colors.white.withOpacity(0.55),
      borderRadius: BorderRadius.circular(20),
    ),
    child: InkWell(
      onTap: () => {},
      borderRadius: BorderRadius.circular(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          staticEventInfo(
            eventTitle,
            tags,
            eventDate,
            category,
            ownerImagePass,
          ),
          dynamicEventInfo(
            eventDate,
            currentParticipantsNum,
          ),
        ],
      ),
    ),
  ));
}

Widget staticEventInfo(
  String eventTitle,
  List<String> tags,
  DateTime eventDate,
  String category,
  String ownerImagePass,
) {
  return (Container(
      padding: const EdgeInsets.only(left: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ownerImage(ownerImagePass),
          const SizedBox(width: 5),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    eventTitle,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children:
                        tags.map((String e) => tagContainer("#" + e)).toList(),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    DateToString.monthToString(eventDate) +
                        "/" +
                        DateToString.dayToString(eventDate) +
                        "（" +
                        DateToString.weekdayToString(eventDate) +
                        "）",
                    style: const TextStyle(color: Colors.black, fontSize: 14),
                  ),
                ],
              ),
              categoryContainer(category),
            ],
          ),
        ],
      )));
}

Widget ownerImage(String ownerImagePass) {
  return (InkWell(
    onTap: () => {},
    borderRadius: BorderRadius.circular(25),
    child: Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.7),
        shape: BoxShape.circle,
      ),
    ),
  ));
}

Widget tagContainer(String tag) {
  return (Container(
    margin: const EdgeInsets.only(right: 5),
    padding: const EdgeInsets.only(left: 5, right: 5),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        color: Colors.white.withOpacity(0.8)),
    child: InkWell(
      onTap: () => {},
      child: Text(
        tag,
        style: const TextStyle(fontSize: 10),
      ),
    ),
  ));
}

Widget categoryContainer(String category) {
  return (Container(
    margin: const EdgeInsets.only(bottom: 2),
    padding: const EdgeInsets.only(left: 5, right: 5),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7), color: Color(0xffb94630)),
    child: InkWell(
      onTap: () => {},
      child: Row(
        children: [
          const Icon(
            CupertinoIcons.scope,
            color: Colors.black,
            size: 10,
          ),
          Text(
            category,
            style: const TextStyle(color: Colors.white, fontSize: 12),
          ),
        ],
      ),
    ),
  ));
}

Widget dynamicEventInfo(DateTime eventDate, int currentParticipantsNum) {
  return (Container(
    padding: const EdgeInsets.only(right: 15),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        timeLeft(eventDate),
        Row(
          children: [
            Text("現在のメンバー: " + currentParticipantsNum.toString() + "人")
          ],
        ),
      ],
    ),
  ));
}

Text timeLeft(DateTime eventDate) {
  Duration timeLeft = eventDate.difference(DateTime.now());

  if (timeLeft.inMinutes < 60 && timeLeft.inMinutes > 0) {
    return Text(
      "あと" + timeLeft.inMinutes.toString() + "分で募集終了！",
      style: TextStyle(color: Color(0xffb94630)),
    );
  } else if (timeLeft.inMinutes < 1 && eventDate.isAfter(DateTime.now())) {
    return const Text(
      "まもなく募集終了！",
      style: TextStyle(color: Color(0xffb94630)),
    );
  } else {
    return const Text("");
  }
}
