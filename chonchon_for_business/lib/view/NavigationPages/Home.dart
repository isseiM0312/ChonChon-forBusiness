import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../Common/Widgets/Cards.dart';

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
                      eventCard(context, "ビブリオバトル", ["ビブリオバトル", "定期開催"],
                          DateTime(2022, 7, 30, 16, 00), "読書", 2, ""),
                      eventCard(context, "ビジネスに役立つ読書", ["経済", "ビジネス", "金融"],
                          DateTime(2022, 7, 30, 16, 50), "読書", 3, ""),
                      eventCard(context, "ひまわり図書館", ["図書館"],
                          DateTime(2022, 7, 30, 15, 50), "読書", 1, ""),
                      eventCard(context, "人文系の本を読もう！", ["初学者歓迎", "メディアセンター"],
                          DateTime(2022, 7, 30, 16, 30), "読書", 5, ""),
                    ],
                  ),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      eventCard(context, "18世紀欧州の哲学", ["哲学", "専門家歓迎"],
                          DateTime(2022, 7, 31, 17, 50), "読書", 3, ""),
                      eventCard(context, "自作PCの会", ["自作PC", "大学生", "実践"],
                          DateTime(2022, 7, 30, 17, 50), "DIY", 2, ""),
                    ],
                  ),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      eventCard(context, "効率の良い家事", ["家事", "主夫"],
                          DateTime(2022, 7, 31, 16, 00), "家事", 1, ""),
                      eventCard(context, "レポートやりましょう！", ["何でもOK", "学生歓迎", "仕事"],
                          DateTime(2022, 7, 30, 16, 50), "勉強", 2, ""),
                      eventCard(context, "ライブの感想会", ["YOASOBI"],
                          DateTime(2022, 8, 1, 16, 50), "音楽", 2, ""),
                    ],
                  ),
                ),
              ],
            )));
  }
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
