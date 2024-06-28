import 'package:empowered_dating/utils/constant_images.dart';
import 'package:empowered_dating/view/home_screen/widget/home_card.dart';
import 'package:empowered_dating/view/home_screen/widget/near_you_card.dart';
import 'package:empowered_dating/widgets/simple_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constant_colors.dart';

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

  List<String> name = ['Natasya Valentina','Natasya Valentina'];
  List<String> location = ['Sekarwangi, Cibadak','Sekarwangi, Cibadak'];
  List<String> profile = ['assets/boy.png','assets/girl.png'];



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
        actions: const [
          Icon(
            CupertinoIcons.bell,
            color: AppColor.customIconColor,
          ),
          Padding(
              padding: EdgeInsets.only(right: 10, left: 5),
              child: Icon(
                Icons.menu,
                color: AppColor.customIconColor,
              ))
        ],
      ),
      body: Container(
        //padding: const EdgeInsets.only(left: 30),
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(ConstantImages.customBgImg),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: Get.height / 6,
            ),
            const Padding(
              padding: EdgeInsets.only(right: 20,left: 20),
              child: Row(
                children: [
                  Text(
                    'New Matches',
                    style: TextStyle(fontSize: 14, color:AppColor.gray5E),
                  ),
                  Spacer(),
                  Text(
                    'See All',
                    style: TextStyle(fontSize: 12, color: AppColor.primaryColor),
                  ),
                  Icon(
                    Icons.arrow_forward,
                    weight: 2,
                    color: AppColor.primaryColor,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 100,
              width: double.infinity,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: images.length,
                  itemBuilder: (context , index){
                return Padding(
                  padding: const EdgeInsets.only(right: 5,left: 5),
                  child: CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage(images[index]),
                  ),
                );
              }),
            ),

            const Padding(
              padding: EdgeInsets.only(top: 20, bottom: 20,left: 20),
              child: Text(
                'Near You',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff421421)),
              ),
            ),
            SizedBox(
              height: 210,
              width: double.infinity,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: titles.length,
                  itemBuilder: (context ,index){
                return NearYouCard(imageUri: images2[index], distance: distance[index], title: titles[index], subTitle: subTitles[index]);
              }),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 20, bottom: 20,left: 20,right: 20),
              child: Row(
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
            Expanded(
              child: ListView.builder(
                itemCount: name.length,
                  itemBuilder: (context , index){
               return Padding(
                  padding: const EdgeInsets.only(bottom: 10,right: 30,left: 20),
                  child: HomeCard(title: name[index], subTitle: location[index], imageUri: profile[index]),
                );

              }),
            )
          ],
        ),
      ),
    );
  }
}
