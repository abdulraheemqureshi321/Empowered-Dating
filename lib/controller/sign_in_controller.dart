
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'authentication.dart';

class SignInController extends GetxController{

  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool login = false;
  void signInUser()async{
    String res = await Authentication().signInUser(email: emailController.text, password: passwordController.text);

    if(res == "success"){
      login = true;
    }
  }
}