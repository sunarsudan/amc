import 'package:amc/constants/global_variable.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider(
                items: GlobalVariable.carouselList.map((e) {
                  return Builder(
                    builder: (context) {
                      return Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                  e.toString(),
                                ),
                                fit: BoxFit.cover)),
                      );
                    },
                  );
                }).toList(),
                options: CarouselOptions(
                    autoPlay: true,
                    height: 300,
                    autoPlayInterval: const Duration(seconds: 3))),
            SizedBox(
              height: size.height * 0.01,
            ),
            Text(
              'Personal Board',
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Expanded(
                child: GridView.builder(
              physics: const ScrollPhysics(),
              itemCount: GlobalVariable.categoryList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 2,
                  childAspectRatio: 1),
              itemBuilder: (context, index) {
                final list = GlobalVariable.categoryList[index];
                return Container(
                  decoration: const BoxDecoration(boxShadow: [
                    BoxShadow(
                      offset: Offset(5, 5),
                      color: Colors.grey,
                      spreadRadius: 2,
                      blurRadius: 2,
                    ),
                    BoxShadow(
                      offset: Offset(-5, -5),
                      spreadRadius: 2,
                      color: Colors.white,
                      blurRadius: 2,
                    )
                  ]),
                  child: Column(
                    children: [
                      Image.asset(list['image'].toString()),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Text(list['title'].toString())
                    ],
                  ),
                );
              },
            ))
          ],
        ));
  }
}
