import 'package:amc/constants/teacher_contact_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TeacherContactNumberScreen extends StatefulWidget {
  const TeacherContactNumberScreen({super.key});

  @override
  State<TeacherContactNumberScreen> createState() =>
      _TeacherContactNumberScreenState();
}

class _TeacherContactNumberScreenState
    extends State<TeacherContactNumberScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        padding: const EdgeInsets.all(10.0),
        itemCount: TeacherContactModel.phoneNumber.length,
        itemBuilder: (context, index) {
          final phone = TeacherContactModel.phoneNumber[index];
          return Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            child: ListTile(
              leading: const Icon(Icons.person),
              title: Text(phone['name']),
              subtitle: Text(phone['number']),
              trailing: const Icon(Icons.forward),
              onTap: () {
                launch("tel://${phone['number']}");
              },
            ),
          );
        },
      ),
    );
  }
}
