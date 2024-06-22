import 'package:empowered_dating/widgets/simple_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> images = [
    'assets/1.png',
    'assets/2.png',
    'assets/3.png',
    'assets/4.png',
    'assets/5.png',
    'assets/6.png'
  ];
  List<String> images2 = ['assets/container1.png', 'assets/container2.png'];
  List<String> titles = ['Sahara Ardia Fadia', 'Nathalia Angeline'];
  List<String> subTitles = ['Nurse', 'Dancer, Friendly'];
  List<String> distance = ['0.5 km', '0.5 km'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: SimpleTextWidget(
          text: 'Home',
          fontSize: 16,
        ),
        centerTitle: true,
        actions: [
          const Icon(
            CupertinoIcons.bell,
            color: Color(0xffFDB813),
          ),
          const Padding(
              padding: EdgeInsets.only(right: 10, left: 5),
              child: Icon(
                Icons.menu,
                color: Color(0xffFDB813),
              ))
        ],
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 30, right: 30),
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage('assets/background.png'),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: Get.height / 6,
            ),
            const Row(
              children: [
                Text(
                  'New Matches',
                  style: TextStyle(fontSize: 14, color: Color(0xff5E5E5E)),
                ),
                Spacer(),
                Text(
                  'See All',
                  style: TextStyle(fontSize: 12, color: Color(0xff934C93)),
                ),
                Icon(
                  Icons.arrow_forward,
                  weight: 2,
                  color: Color(0xff934C93),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (int i = 0; i < images.length; i++)
                    Padding(
                      padding: EdgeInsets.only(right: 5),
                      child: CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage(images[i]),
                      ),
                    ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: Text(
                'Near You',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff421421)),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (int i = 0; i < images2.length; i++)
                    Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Container(
                        height: 210,
                        width: 280,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.fitWidth,
                              image: AssetImage(images2[i]),
                            ),
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 20, bottom: 20),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    titles[i],
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    subTitles[i],
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white.withOpacity(0.8)),
                                  )
                                ],
                              ),
                            ),
                            Spacer(),
                            Align(
                              alignment: Alignment.topRight,
                              child: Padding(
                                padding: EdgeInsets.only(top: 15,right: 15),
                                child: Container(
                                  height: 35,
                                  width: 77,
                                  decoration: BoxDecoration(
                                      color: Color(0xffFFFFFF),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Center(
                                    child: Text(
                                      distance[i],
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xffC4C4C4)),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20, bottom: 20),
              child: const Row(
                children: [
                  Text(
                    'Recent Partner',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff421421)),
                  ),
                  Spacer(),
                  Text(
                    'See All',
                    style: TextStyle(
                        fontSize: 12,
                        color: Color(0xffC4C4C4),
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
