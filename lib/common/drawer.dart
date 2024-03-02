import 'package:amc/common/widgets/about_developer.dart';
import 'package:amc/constants/global_variable.dart';
import 'package:amc/screens/theme_screen/theme_screen.dart';
import 'package:flutter/material.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({super.key});

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  bool isChanged = false;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black,
      child: Container(
        decoration: const BoxDecoration(),
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              accountName: const Text("AMC College"),
              accountEmail: const Text("amc2069@gmail.com"),
              currentAccountPicture: Image.asset("assets/third.jpg"),
            ),
            listItem("Events", Icons.event, () {}),
            listItem("Theme ", Icons.dark_mode, () {
              Navigator.pushNamed(context, ThemeScreen.routeName);
            }),
            listItem("About Dev", Icons.abc_outlined, () {
              Navigator.pushNamed(context, AboutDeveloper.routeName);
            }),
            listItem("About School ", Icons.abc_outlined, () {
              Navigator.pushNamed(context, AboutDeveloper.routeName);
            }),
            listItem("Share", Icons.share, () {}),
          ],
        ),
      ),
    );
  }

  Widget listItem(String textName, IconData icons, VoidCallback onPress) {
    return ListTile(
      leading: Icon(
        icons,
        color: GlobalVariable.drawerTextColor,
      ),
      title: Text(
        textName.toString(),
        style: const TextStyle(color: GlobalVariable.drawerTextColor),
      ),
      onTap: onPress,
    );
  }
}
