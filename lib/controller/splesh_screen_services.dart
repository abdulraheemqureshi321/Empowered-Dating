
import 'dart:async';

import 'package:empowered_dating/view/bottom_navigation.dart';
import 'package:empowered_dating/view/sign_in_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SpleshServices{

  void isLogin(BuildContext context){

    final auth = FirebaseAuth.instance;

    final user = auth.currentUser;

    // if(user != null)
    //   {
        //Timer(const Duration(seconds: 3),(){
        //  Navigator.push(context , MaterialPageRoute(builder: (context)=> BottomNavigation()));
      //  });
      //}
    //else
    //{
      Timer(const Duration(seconds: 3),(){
        Navigator.push(context , MaterialPageRoute(builder: (context)=> SignInScreen()));
      });
    //}


  }

}