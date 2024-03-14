import 'package:amc/admin/screens/post_screen/screens/post_screen.dart';
import 'package:amc/admin/screens/post_screen_view/screens/post_view_screen.dart';
import 'package:flutter/material.dart';

class AdminBottomBar extends StatefulWidget {
  static const String routeName = "/bottom-bar";
  const AdminBottomBar({super.key});

  @override
  State<AdminBottomBar> createState() => _AdminBottomBarState();
}

class _AdminBottomBarState extends State<AdminBottomBar> {
  int currentPage = 0;
  List<Widget> itemList = [
    const AdminPostViewScreen(),
    const AdminPostScreen(),
  ];
  void changePage(int page) {
    setState(() {
      currentPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: itemList[currentPage]),
      bottomNavigationBar: BottomNavigationBar(
          onTap: changePage,
          currentIndex: currentPage,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.account_tree), label: ''),
          ]),
    );
  }
}
