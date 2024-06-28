import 'package:empowered_dating/view/home_screen/home_screen.dart';
import 'package:empowered_dating/view/notification_screens/matches_screen.dart';
import 'package:empowered_dating/view/profile_screen/profile_screen.dart';
import 'package:empowered_dating/view/select_chat_screen/select_chat_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/bottom_navigation_controller.dart';
import '../utils/constant_colors.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  final BottomNavigationController controller = Get.put(BottomNavigationController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavigationController>(builder: (controller){
      return Scaffold(

        body: SafeArea(
          child: IndexedStack(
            index: controller.tabIndex.value,
            children: const [
              HomeScreen(),
              SelectChatScreen(),
              MatchesScreen(),
              ProfileScreen()
            ],
          ),
        ),

        bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: AppColor.grayAC,
          selectedItemColor: AppColor.primaryColor,
          onTap: controller.changeTabIndex,
          currentIndex: controller.tabIndex.value,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), label: 'home'),
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.chat_bubble), label: 'chat'),
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.heart), label: 'heart'),
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.person_alt_circle), label: 'profile'),

          ],
        ),
      );
    });
  }
}
