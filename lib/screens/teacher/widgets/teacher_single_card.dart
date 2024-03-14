// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class TeacherCustomCard extends StatelessWidget {
  final String image;
  final String name;
  final String position;
  final VoidCallback onPress;
  const TeacherCustomCard({
    Key? key,
    required this.image,
    required this.name,
    required this.position,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: InkWell(
      onTap: onPress,
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(10.0),
                bottomRight: Radius.circular(10.0)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade300,
                blurRadius: 1,
                spreadRadius: 2,
                offset: const Offset(-4, -4),
              ),
              const BoxShadow(
                color: Colors.white,
                blurRadius: 1,
                spreadRadius: 2,
                offset: Offset(4, 4),
              ),
            ]),
        child: Column(
          children: [
            const Spacer(),
            const CircleAvatar(
              radius: 50,
            ),
            Text(
              name.toString(),
              style: Theme.of(context)
                  .textTheme
                  .labelLarge!
                  .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            Text(
              position.toString(),
              style: Theme.of(context)
                  .textTheme
                  .labelSmall!
                  .copyWith(color: Colors.black),
            ),
            const Spacer(),
          ],
        ),
      ),
    ));
  }
}
