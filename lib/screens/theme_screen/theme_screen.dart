import 'package:amc/screens/theme_screen/change_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeScreen extends StatefulWidget {
  static const String routeName = "/theme-screen";
  const ThemeScreen({super.key});

  @override
  State<ThemeScreen> createState() => _ThemeScreenState();
}

class _ThemeScreenState extends State<ThemeScreen> {
  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ChangeTheme>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Theme"),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Column(
        children: [
          RadioListTile<ThemeMode>(
            value: ThemeMode.light,
            groupValue: themeChanger.themeMode,
            onChanged: themeChanger.changeTheme,
            title: const Text("Light Theme"),
          ),
          RadioListTile<ThemeMode>(
            value: ThemeMode.dark,
            groupValue: themeChanger.themeMode,
            onChanged: themeChanger.changeTheme,
            title: const Text("Dark Theme"),
          ),
        ],
      )),
    );
  }
}
