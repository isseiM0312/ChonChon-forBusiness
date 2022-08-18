import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../Common/Modals.dart';
import '../CategoryHome.dart';

class EventCreatePage extends StatefulWidget {
  const EventCreatePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<EventCreatePage> createState() => _EventCreatePageState();
}

class _EventCreatePageState extends State<EventCreatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffb94630),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          '"Chon Chon"',
          style: TextStyle(color: Colors.white, fontSize: 15),
        ),
      ),
      body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 13),
          child: ListView(
            padding: const EdgeInsets.only(top: 7, bottom: 10),
            children: [
              const Text(
                'カテゴリ一覧',
                style: TextStyle(color: Colors.white, fontSize: 23),
              ),
              const SizedBox(height: 5),
              GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 12,
                childAspectRatio: 1.5,
                shrinkWrap: true,
                children: [
                  categoryCard(context),
                  categoryCard(context),
                  categoryCard(context),
                  categoryCard(context),
                  categoryCard(context),
                  categoryCard(context),
                  categoryCard(context),
                  categoryCard(context),
                  categoryCard(context),
                  categoryCard(context),
                ],
              ),
            ],
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {eventCreateModal(context)},
        child: const Icon(
          CupertinoIcons.add,
          color: Color(0xffb94630),
          size: 35,
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}

Widget categoryCard(BuildContext context) {
  return Container(
    margin: const EdgeInsets.all(0),
    decoration: BoxDecoration(
      color: Colors.white.withOpacity(0.55),
      borderRadius: BorderRadius.circular(20),
    ),
    child: InkWell(
      onTap: () => pushNewScreen(
        context,
        screen: const CategoryHomePage(),
        withNavBar: true,
      ),
      borderRadius: BorderRadius.circular(20),
    ),
  );
}
