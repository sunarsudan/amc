import 'package:flutter/material.dart';

class AdminPostViewScreen extends StatefulWidget {
  const AdminPostViewScreen({super.key});

  @override
  State<AdminPostViewScreen> createState() => _AdminPostViewScreenState();
}

class _AdminPostViewScreenState extends State<AdminPostViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("View Post Result"),
      ),
      body: GridView.builder(
        itemCount: 10,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisSpacing: 10.0, crossAxisSpacing: 10.0),
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: const [
                  BoxShadow(
                      offset: Offset(-3, -3),
                      blurRadius: 2,
                      spreadRadius: 2,
                      color: Colors.grey),
                  BoxShadow(
                      offset: Offset(3, 3), blurRadius: 2, spreadRadius: 2),
                ]),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 50,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/third.jpg'))),
                  ),
                  const Text(
                    "AMC bsccsit is nepali topper",
                    maxLines: 2,
                    style: TextStyle(overflow: TextOverflow.ellipsis),
                  ),
                  const Text(
                      "in this day our amc has publisedh the best result"),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: IconButton(
                        onPressed: () {}, icon: const Icon(Icons.delete)),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
