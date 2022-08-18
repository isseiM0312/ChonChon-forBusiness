import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'Common/Widgets/Cards.dart';
import 'Common/Modals.dart';
import './NavigationPages/EventCreate.dart';

class CategoryHomePage extends StatefulWidget {
  const CategoryHomePage({Key? key}) : super(key: key);

  @override
  State<CategoryHomePage> createState() => _CategoryHomePageState();
}

class _CategoryHomePageState extends State<CategoryHomePage> {
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
          '"読書"カテゴリのイベント',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView(
        children: [
          eventCard(context, '本読む', ['太宰治', '文学賞'],
              DateTime(2022, 08, 18, 18, 00), '読書', 2, ''),
          eventCard(context, '本読む', ['太宰治', '文学賞'],
              DateTime(2022, 08, 18, 18, 00), '読書', 2, ''),
          eventCard(context, '本読む', ['太宰治', '文学賞'],
              DateTime(2022, 08, 18, 18, 00), '読書', 2, ''),
          eventCard(context, '本読む', ['太宰治', '文学賞'],
              DateTime(2022, 08, 18, 18, 00), '読書', 2, ''),
          eventCard(context, '本読む', ['太宰治', '文学賞'],
              DateTime(2022, 08, 18, 18, 00), '読書', 2, ''),
          eventCard(context, '本読む', ['太宰治', '文学賞'],
              DateTime(2022, 08, 18, 18, 00), '読書', 2, ''),
        ],
      ),
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
