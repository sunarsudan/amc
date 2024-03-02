import 'package:flutter/material.dart';

class AboutDeveloper extends StatefulWidget {
  static const String routeName = "/about-developer";
  const AboutDeveloper({super.key});

  @override
  State<AboutDeveloper> createState() => _AboutDeveloperState();
}

class _AboutDeveloperState extends State<AboutDeveloper>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> animation;
  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    animation = Tween<Offset>(begin: const Offset(-1, 1), end: Offset.zero)
        .animate(
            CurvedAnimation(parent: animationController, curve: Curves.easeIn));
    animationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About Developer"),
      ),
      body: Center(
        child: SlideTransition(
          position: animation,
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(
                  'assets/third.jpg',
                ),
              ),
              Column(
                children: [
                  Text(
                    "Sudan Sunar",
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Web/App-developer",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                    '"Sudan Sunar is a tech guy who aims to teach students programming. He has good knowledge of writing structured code and holds three years of experience in teaching IT students. Sudan has a strong command of MEN (Mongoose Express Node), Flutter, and languages such as HTML, CSS, JS, MERN, PHP, MySQL, Git, Docker, Redis, Tailwind CSS, Bootstrap, C, C++, Flutter, and Dart."'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
