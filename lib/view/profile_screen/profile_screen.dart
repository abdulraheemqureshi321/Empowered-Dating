import 'package:empowered_dating/view/profile_screen/widget/row_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../widgets/simple_text.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  List<String> images =['assets/1.png','assets/2.png','assets/3.png','assets/4.png','assets/5.png','assets/6.png','assets/1.png','assets/2.png','assets/3.png','assets/4.png','assets/5.png','assets/6.png'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: SimpleTextWidget(
            text: 'Profile',
            fontSize: 16,
          ),
          centerTitle: true,
          actions: const [
            Padding(
                padding: EdgeInsets.only(right: 10, left: 5),
                child: Icon(
                  Icons.menu,
                  color: Color(0xffFDB813),
                ))
          ],
        ),
        body:Container(
          height: double.maxFinite,
          width: double.maxFinite,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('assets/background.png'),
            ),
          ),

          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 28,right: 28),
              child: Column(
                children: [
                  const SizedBox(height: 20,),
                  const CircleAvatar(
                    backgroundImage: AssetImage('assets/2.png'),
                    radius: 60,
                  ),
                  const SizedBox(height: 10,),
                  const Text('Brian Immanual, 24',style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500,color: Color(0xff5E5E5E)),),
                  const SizedBox(height: 10,),
                  Container(
                    height: 33,
                    width: 111,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: const Color(0xff934C93),
                        width: 1,
                      )
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(CupertinoIcons.heart, color: Color(0xff934C93),size: 16,),
                        Text(' 10 k', style: TextStyle(fontSize: 12,color: Color(0xff934C93)),)
                      ],
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RowWidget(text: 'Graphic Designer', icon: CupertinoIcons.bag,),
                      RowWidget(text: 'Designer Center', icon: CupertinoIcons.home,),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RowWidget(text: 'Jakarta Indonesia',icon: CupertinoIcons.location_solid,),
                      RowWidget(text: 'Designer School',icon: CupertinoIcons.capslock,)
                    ],
                  ),
                  const SizedBox(height: 20,),
                  const Align(
                    alignment: Alignment.topLeft,
                      child: Text('About Me', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Color(0xff5E5E5E)),)),
                  const SizedBox(height: 10,),
                  const Text('I\'m here when you need a sunny day,something good.We can sing together on the beach and burn bonfires atnight with the moonlight. See you under the night sky !', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Color(0xffACACAC)),),
                  const SizedBox(height: 20,),
                  const Row(
                    children: [
                      Text(
                        'Gallery',
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700,color: Color(0xff5E5E5E)),
                      ),
                      Spacer(),
                      Text(
                        'See All',
                        style: TextStyle(fontSize: 12, color: Color(0xff934C93)),
                      ),
                      SizedBox(width: 5,),
                      Icon(
                        Icons.arrow_forward,
                        weight: 2,
                        color: Color(0xff934C93),
                      )
                    ],
                  ),
                  const SizedBox(height: 20,),


                 Expanded(
                   child: GridView.count(
                     crossAxisCount: 3,
                   crossAxisSpacing: 10,
                   mainAxisSpacing: 10,
                   children: List.generate(
                       images.length, (index) => Container(
                     height: 111,
                     width: 111,
                     decoration:  BoxDecoration(
                       borderRadius: BorderRadius.circular(10),
                       image: DecorationImage(
                         fit: BoxFit.fitWidth,
                         image: AssetImage(images[index]),
                       ),
                     ),
                   )
                   ),
                   ),
                 )
                ],
              ),
            ),
          ),
        )
    );
  }
}
