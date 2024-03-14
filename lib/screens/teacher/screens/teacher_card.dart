import 'package:amc/screens/teacher/screens/teacher_details.dart';
import 'package:amc/screens/teacher/teacher_model.dart';
import 'package:amc/screens/teacher/widgets/teacher_single_card.dart';
import 'package:flutter/material.dart';

class TeacherCardScreen extends StatefulWidget {
  const TeacherCardScreen({super.key});

  @override
  State<TeacherCardScreen> createState() => _TeacherCardScreenState();
}

class _TeacherCardScreenState extends State<TeacherCardScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          ClipPath(
            clipper: TeacherClipper(),
            child: Container(
              height: size.height * 0.4,
              width: double.infinity,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/third.jpg'),
                      fit: BoxFit.cover)),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Expanded(
              child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
            itemCount: teacherDetails.length,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10.0),
            itemBuilder: (context, index) {
              final teacherInformation = teacherDetails[index];
              return TeacherCustomCard(
                  onPress: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TeacherDetailsScreen(
                                teachers: teacherInformation)));
                  },
                  image: teacherInformation.image,
                  name: teacherInformation.name,
                  position: teacherInformation.position);
            },
          ))
        ],
      )),
    );
  }
}

class TeacherClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);
    var firstStart = Offset(size.width / 5, size.height);
    var firstEnd = Offset(size.width / 2.25, size.height - 50);
    path.quadraticBezierTo(
        firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);
    var secondStart =
        Offset(size.width - (size.width / 3.24), size.height - 105);
    var secondEnd = Offset(size.width, size.height - 10);
    path.quadraticBezierTo(
        secondStart.dx, secondStart.dy, secondEnd.dx, secondEnd.dy);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
