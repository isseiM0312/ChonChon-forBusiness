import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'Widgets/EventInputter.dart';

Future<dynamic> eventCreateModal(
  BuildContext context,
) {
  return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (BuildContext context) {
        return Container(
          margin: const EdgeInsets.only(left: 10, right: 10),
          height: 500,
          child: Column(
            children: [
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    'イベントを作成',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    height: 50,
                    width: 140,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: InkWell(
                      onTap: () => {},
                      borderRadius: BorderRadius.circular(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            CupertinoIcons.wind,
                            color: Colors.white,
                          ),
                          SizedBox(width: 10),
                          Text(
                            '投稿',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              eventNameInputter(),
            ],
          ),
        );
      });
}