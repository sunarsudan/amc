import 'package:amc/constants/global_variable.dart';
import 'package:amc/main.dart';
import 'package:amc/screens/home_screen/bottom_bar.dart';
import 'package:amc/screens/onboarding_screen/widgets/first_onboarding.dart';
import 'package:amc/screens/onboarding_screen/widgets/second_onboarding.dart';
import 'package:amc/screens/onboarding_screen/widgets/third_onboarding.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController pageController = PageController();
  @override
  void dispose() {
    pageController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          padding: const EdgeInsets.only(bottom: 150.0),
          child: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: pageController,
            onPageChanged: (value) {
              isLastPage = value == 2;
              setState(() {});
            },
            children: const [
              FirstOnBoarding(),
              SecondOnBoarding(),
              ThirdOnBoarding(),
            ],
          ),
        ),
        floatingActionButton: isLastPage
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton.icon(
                      onPressed: () async {
                        SharedPreferences sharedPreferences =
                            await SharedPreferences.getInstance();
                        sharedPreferences.setBool(SplashScreen.KEY, true);
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const BottomBar()));
                      },
                      icon: const Icon(Icons.arrow_forward),
                      label: const Text("Let's Welcome"))
                ],
              )
            : FloatingActionButton(
                backgroundColor: GlobalVariable.buttonColor,
                onPressed: () {
                  pageController.nextPage(
                      duration: const Duration(seconds: 1),
                      curve: Curves.easeInOut);
                },
                child: const Center(
                  child: Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ),
                ),
              ));
  }
}
