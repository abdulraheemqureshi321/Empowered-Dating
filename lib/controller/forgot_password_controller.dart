import 'package:empowered_dating/utils/custom_toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../view/verify_screen.dart';

class ForgotPasswordController extends GetxController{

  final auth = FirebaseAuth.instance;

  forgotPassword(String email){
    auth.sendPasswordResetEmail(email: email).then((value) {
      CustomToast().toastMessage("we have send you email");
      //Navigator.push(context, MaterialPageRoute(builder: (context)=> const VerifyScreen()));

    }).onError((error, stackTrace) {
      CustomToast().toastMessage(error.toString());
    });
  }

}