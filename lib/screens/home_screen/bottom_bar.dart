import 'package:amc/common/drawer.dart';
import 'package:amc/screens/contact/contact_screen.dart';
import 'package:amc/screens/home_screen/index_screen/index.dart';
import 'package:amc/screens/settings/school_contact_collection.dart';
import 'package:amc/screens/settings/settings.dart';
import 'package:amc/screens/teacher/screens/teacher_card.dart';
import 'package:amc/screens/teacher_phone/screens/teacher_contact_number.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  static const String routeName = "/bottom-bar";
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int currentPage = 0;
  List<Widget> itemList = [
    const HomeScreen(),
    const SchoolCollection(),
    const TeacherCardScreen()
  ];
  void changePage(int page) {
    setState(() {
      currentPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: const DrawerScreen(),
      body: SafeArea(child: itemList[currentPage]),
      bottomNavigationBar: BottomNavigationBar(
          onTap: changePage,
          currentIndex: currentPage,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.account_tree), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: ''),
          ]),
    );
  }
}
