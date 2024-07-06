import 'package:empowered_dating/controller/authentication.dart';
import 'package:empowered_dating/controller/create_profile_controller.dart';
import 'package:empowered_dating/utils/constant_images.dart';
import 'package:empowered_dating/view/profile_screen/widget/row_widget.dart';
import 'package:empowered_dating/view/sign_in_screen.dart';
import 'package:empowered_dating/view/update_profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../controller/profile_controller.dart';
import '../../utils/constant_colors.dart';
import '../../widgets/simple_text.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  List<String> images =['assets/1.png','assets/2.png','assets/3.png','assets/4.png','assets/5.png','assets/6.png','assets/1.png','assets/2.png','assets/3.png','assets/4.png','assets/5.png','assets/6.png'];

  final ProfileScreenController profileScreenController = Get.put(ProfileScreenController());

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
          actions:  [

            Padding(
                padding: EdgeInsets.only(right: 10, left: 5),
                child: PopupMenuButton(
                    icon: const Icon(
                      Icons.menu,
                      color: AppColor.customIconColor,
                    ),
                    onSelected: (int value){
                      switch(value){

                        case 1:
                        Get.to(UpdateProfileScreen());
                        break;

                        case 2:
                        Authentication().deleteUser();
                        Get.to(SignInScreen());
                        break;

                        case 3:
                        Authentication().signOut();
                        Get.to(SignInScreen());
                        break;
                      }
                    },
                    itemBuilder: (BuildContext context)=> <PopupMenuEntry<int>>[
                      const PopupMenuItem<int>(
                        value: 1,
                        child: Text('Update Profile'),
                      ),
                      const PopupMenuItem(
                        value: 2,
                        child: Text('Delete account'),
                      ),
                      const PopupMenuItem(
                        value: 3,
                        child: Text('Sign out'),
                      )
                    ]),)
          ],
        ),
        body:Container(
          height: double.maxFinite,
          width: double.maxFinite,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(ConstantImages.customBgImg),
            ),
          ),

          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 28,right: 28),
              child: Column(
                children: [
                  const SizedBox(height: 20,),
                   Obx((){
                     return CircleAvatar(
                       backgroundImage: NetworkImage(profileScreenController.currentUser.value.profileImageUrl),
                       radius: 60,
                     );
                   }),
                  const SizedBox(height: 10,),
                  Obx((){
                   return Text(profileScreenController.currentUser.value.name,style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500,color: AppColor.gray5E),);
                  }),
                  const SizedBox(height: 10,),
                  Container(
                    height: 33,
                    width: 111,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: AppColor.primaryColor,
                        width: 1,
                      )
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(CupertinoIcons.heart, color: AppColor.primaryColor,size: 16,),
                        Text(' 10 k', style: TextStyle(fontSize: 12,color: AppColor.primaryColor),)
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
                      child: Text('About Me', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: AppColor.gray5E),)),
                  const SizedBox(height: 10,),
                  Obx((){
                   return Text(profileScreenController.currentUser.value.aboutMe, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: AppColor.grayAC),);
                  }),
                  const SizedBox(height: 20,),
                  const Row(
                    children: [
                      Text(
                        'Gallery',
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700,color: AppColor.gray5E),
                      ),
                      Spacer(),
                      Text(
                        'See All',
                        style: TextStyle(fontSize: 12, color: AppColor.primaryColor),
                      ),
                      SizedBox(width: 5,),
                      Icon(
                        Icons.arrow_forward,
                        weight: 2,
                        color: AppColor.primaryColor,
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
