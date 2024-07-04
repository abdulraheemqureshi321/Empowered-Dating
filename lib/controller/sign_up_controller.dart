
import 'package:empowered_dating/view/home_screen/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'authentication.dart';

class SignUpColtroller extends GetxController{

  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void signUpUser()async{
    String res = await Authentication().signUpUser(email: emailController.text, password: passwordController.text, name: nameController.text);

    if(res == "success"){

      // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen()));
    }
  }
}