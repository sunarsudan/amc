import 'package:flutter/material.dart';

class GlobalVariable {
  static const Color onBoardingTextColor = Colors.blue;
  static const Color buttonColor = Color.fromARGB(255, 3, 51, 90);
  static const Color drawerColor = Color.fromARGB(255, 51, 12, 206);
  static const Color drawerTextColor = Colors.white;
  static const Color backgroundColor = Color(0xffF9F9FB);

  static const List<Map<String, String>> categoryList = [
    {"title": "News", "image": "assets/second.jpg", "color": "0xffff6a00"},
    {"title": "Contact", "image": 'assets/second.jpg', "color": "0xffff6a00"},
    {"title": "Notice", "image": "assets/second.jpg", "color": "0xffff6a00"},
    {
      "title": "Game Routine",
      "image": "assets/second.jpg",
      "color": "0xffff6a00"
    },
  ];

  //this is for the carousel images
  static const List carouselList = [
    "assets/second.jpg",
    "assets/second.jpg",
    "assets/second.jpg"
  ];
}
