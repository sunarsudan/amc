import 'package:amc/common/widgets/about_developer.dart';
import 'package:amc/main.dart';
import 'package:amc/screens/home_screen/bottom_bar.dart';
import 'package:amc/screens/theme_screen/theme_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case SplashScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (context) => const SplashScreen());

    case BottomBar.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (context) => const BottomBar());

    case ThemeScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (context) => const ThemeScreen());

    case AboutDeveloper.routeName:
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (context) => const AboutDeveloper());

    default:
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (BuildContext context) {
            return const Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [Text("No Roues Has Been Found ")],
                ),
              ),
            );
          });
  }
}
