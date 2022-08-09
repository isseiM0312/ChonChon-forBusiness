import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import 'package:chonchon_for_business/view/EventInfo.dart';

import '../DateToString.dart';

Widget eventCard(
  BuildContext context,
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
      onTap: () => pushNewScreen(
        context,
        screen: const MyEventInfoPage(),
        withNavBar: true,
      ),
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
