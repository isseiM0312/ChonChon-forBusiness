import 'package:flutter/material.dart';

Widget eventNameInputter() {
  return (Container(
      margin: const EdgeInsets.only(left: 30, top: 10, right: 30),
      child: TextField(
        cursorColor: Color(0xffb94630),
        decoration: InputDecoration(
          hintText: 'イベント名',
          fillColor: Colors.white,
          filled: true,
          isDense: true,
          contentPadding: const EdgeInsets.all(20),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(32),
          ),
        ),
      )));
}