import 'package:amc/screens/contact/contact_screen.dart';
import 'package:amc/screens/teacher_phone/screens/teacher_contact_number.dart';
import 'package:flutter/material.dart';

class SchoolCollection extends StatefulWidget {
  const SchoolCollection({super.key});

  @override
  State<SchoolCollection> createState() => _SchoolCollectionState();
}

class _SchoolCollectionState extends State<SchoolCollection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ContactScreen()));
                },
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10.0)),
                  child: const Center(
                    child: Text("Send your query"),
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const TeacherContactNumberScreen()));
                },
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10.0)),
                  child: const Center(
                    child: Text("Contact with teachers"),
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
