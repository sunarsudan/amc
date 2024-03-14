import 'package:amc/screens/teacher/screens/teacher_card.dart';
import 'package:amc/screens/teacher/teacher_model.dart';
import 'package:flutter/material.dart';

class TeacherDetailsScreen extends StatefulWidget {
  final Teachers teachers;
  const TeacherDetailsScreen({super.key, required this.teachers});

  @override
  State<TeacherDetailsScreen> createState() => _TeacherDetailsScreenState();
}

class _TeacherDetailsScreenState extends State<TeacherDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.teachers.name),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Text(widget.teachers.name),
            Text(widget.teachers.email),
            Text(widget.teachers.description)
          ],
        ),
      )),
    );
  }
}
