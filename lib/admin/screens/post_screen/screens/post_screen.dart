import 'dart:io';

import 'package:amc/admin/screens/post_screen/screens/utils.dart';
import 'package:amc/common/custom_button.dart';
import 'package:amc/common/custom_field.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class AdminPostScreen extends StatefulWidget {
  const AdminPostScreen({super.key});

  @override
  State<AdminPostScreen> createState() => _AdminPostScreenState();
}

class _AdminPostScreenState extends State<AdminPostScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  String selected = "Bca";
  List facultyItem = ["Bim", "Bca", "Bsc-csit"];
  List<File> photo = [];
  void uploadImage() async {
    photo = await pickImages();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Post Result"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 10.0,
              ),
              photo.isNotEmpty
                  ? CarouselSlider(
                      items: photo.map((e) {
                        return Builder(
                          builder: (context) {
                            return Image.file(File(e.toString()));
                          },
                        );
                      }).toList(),
                      options: CarouselOptions(height: 400))
                  : SizedBox(
                      height: size.height * 0.02,
                    ),
              GestureDetector(
                onTap: uploadImage,
                child: Container(
                  height: 80,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(10.0)),
                  child: const Center(
                    child: Text('Upload List of Photo'),
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              CustomTextField(controller: titleController, hintText: "Heading"),
              SizedBox(
                height: size.height * 0.02,
              ),
              CustomTextField(
                controller: descriptionController,
                hintText: "Description",
                maxLines: 10,
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              SizedBox(
                height: 70,
                width: double.infinity,
                child: DropdownButton(
                    value: selected,
                    items: facultyItem.map((e) {
                      return DropdownMenuItem(
                        value: e.toString(),
                        child: Text(e.toString()),
                      );
                    }).toList(),
                    onChanged: (String? values) {
                      setState(() {
                        selected = values!;
                      });
                    }),
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
              CustomButton(text: "Post", onTap: () {})
            ],
          ),
        ),
      ),
    );
  }
}
