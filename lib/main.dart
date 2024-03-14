import 'dart:async';
import 'package:amc/admin/screens/common/bottom_bar.dart';
import 'package:amc/admin/screens/post_screen/screens/post_screen.dart';
import 'package:amc/admin/screens/post_screen_view/screens/post_view_screen.dart';
import 'package:amc/routing/routing.dart';
import 'package:amc/screens/home_screen/bottom_bar.dart';
import 'package:amc/screens/theme_screen/change_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:amc/screens/onboarding_screen/onboarding_screen.dart';
// Import the missing screens

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => ChangeTheme())],
      child: Builder(builder: (context) {
        final themeChanger = Provider.of<ChangeTheme>(context);

        return MaterialApp(
          onGenerateRoute: (settings) => generateRoute(settings),
          debugShowCheckedModeBanner: false,
          themeMode: themeChanger.themeMode,
          darkTheme: ThemeData(brightness: Brightness.dark),
          home: const SplashScreen(),
        );
      }),
    );
  }
}

class SplashScreen extends StatefulWidget {
  static const String routeName = "/splash-screen";
  static const String KEY = "login";

  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    whereToGo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  height: size.height * 0.3,
                  width: size.width * 0.6,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(40.0),
                  )),
              const Text(
                "AMC College",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 50.0),
                child: const Divider(
                  height: 10,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              const Text(
                "For Dream on IT",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void whereToGo() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    var isLogin = sp.getBool(SplashScreen.KEY);
    Timer(const Duration(seconds: 2), () {
      if (isLogin != null) {
        if (isLogin) {
          // Replace 'BottomAppBar()' with your actual widget
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const BottomBar()));
        } else {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => const OnBoardingScreen()));
        }
      } else {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const OnBoardingScreen()));
      }
    });
  }
}
