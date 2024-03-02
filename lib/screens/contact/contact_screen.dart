import 'package:amc/common/custom_button.dart';
import 'package:amc/common/custom_field.dart';
import 'package:amc/main.dart';
import 'package:flutter/material.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  String selected = "No";
  List<String> items = ["Yes", "No"];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipPath(
              clipper: WaveClipper(),
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
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextField(controller: nameController, hintText: "Name"),
                  const SizedBox(
                    height: 10.0,
                  ),
                  CustomTextField(
                      controller: phoneController, hintText: "Phone Number"),
                  const SizedBox(
                    height: 17.0,
                  ),
                  const Text("Are you Students or Family of ACM"),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: SizedBox(
                      width: double.infinity,
                      child: DropdownButton(
                          value: selected,
                          items: items.map((e) {
                            return DropdownMenuItem(
                                value: e, child: Text(e.toString()));
                          }).toList(),
                          onChanged: (String? value) {
                            selected = value!;
                            setState(() {});
                          }),
                    ),
                  ),
                  CustomTextField(
                    controller: phoneController,
                    hintText: "Send what you wants go suggest us ? ",
                    maxLines: 8,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: CustomButton(text: "Send Query", onTap: () {}),
            )
          ],
        ),
      ),
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
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
