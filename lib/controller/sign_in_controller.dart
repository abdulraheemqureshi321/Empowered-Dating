
import 'package:empowered_dating/view/bottom_navigation.dart';
import 'package:empowered_dating/view/create_profile_screen.dart';
import 'package:empowered_dating/view/home_screen/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../view/profile_screen/profile_screen.dart';
import 'authentication.dart';

class SignInController extends GetxController{

  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void signInUser()async{
    String res = await Authentication().signInUser(email: emailController.text, password: passwordController.text);

    if(res == "success"){
      Get.to(const BottomNavigation());
      emailController.clear();
      passwordController.clear();
    }
  }
}