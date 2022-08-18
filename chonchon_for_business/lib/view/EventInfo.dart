import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EventInfoPage extends StatefulWidget {
  const EventInfoPage({Key? key}) : super(key: key);

  @override
  State<EventInfoPage> createState() => _EventInfoPageState();
}

class _EventInfoPageState extends State<EventInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffb94630),
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(CupertinoIcons.arrow_left),
          color: Colors.white,
        ),
        title: const Text(
          'イベント詳細',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        color: Colors.black.withOpacity(0.3),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 25),
            memberCard(5),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                color: Color(0xffb94630).withOpacity(0.5),
                borderRadius: BorderRadius.circular(20),
              ),
              child: InkWell(
                  onTap: () => {},
                  borderRadius: BorderRadius.circular(20),
                  child: const Center(
                    child: Text(
                      'トークを見る',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  )),
            ),
            eventDetail('ABC',
                'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa\naaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'),
          ],
        ),
      ),
    );
  }
}

Widget memberCard(int number) {
  return (Container(
    height: 120,
    color: Colors.black.withOpacity(0.8),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          'メンバー (' + number.toString() + ')',
          style: const TextStyle(fontSize: 17, color: Colors.white),
        )
      ],
    ),
  ));
}

Widget eventDetail(String eventName, String eventExplain) {
  return (Container(
    padding: const EdgeInsets.only(left: 30, top: 8, right: 30, bottom: 10),
    color: Colors.black.withOpacity(0.8),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text('イベント名',
                style: TextStyle(fontSize: 20, color: Colors.white)),
            const SizedBox(width: 175),
            Text(eventName,
                style: const TextStyle(fontSize: 20, color: Colors.white)),
          ],
        ),
        dividerWithMargin(),
        const Text(
          'イベント紹介',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        SizedBox(
          width: 300,
          child: Text(
            eventExplain,
            style: const TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
        dividerWithMargin(),
        const Text(
          '関連するタグ',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        dividerWithMargin(),
        const Text(
          '関連するカテゴリー',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ],
    ),
  ));
}

Widget dividerWithMargin() {
  return (Column(
    children: const [
      Divider(
        height: 10,
        thickness: 1,
        indent: 0,
        endIndent: 0,
        color: Colors.white,
      ),
      SizedBox(height: 10),
    ],
  ));
}
