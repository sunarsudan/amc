import 'package:amc/constants/global_variable.dart';
import 'package:flutter/material.dart';

class FirstOnBoarding extends StatelessWidget {
  const FirstOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            const Spacer(),
            const CircleAvatar(
              radius: 90,
              backgroundImage: AssetImage(
                'assets/third.jpg',
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Text(
              'Welcme To AMC College',
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  color: GlobalVariable.onBoardingTextColor,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                  "cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat nonproident, sunt in culpa qui officia eserunt mollit anim id est laborum."),
            ),
            const Spacer(),
          ],
        ),
      )),
    );
  }
}
