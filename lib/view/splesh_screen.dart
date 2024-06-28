import 'dart:async';

import 'package:empowered_dating/view/sign_in_screen.dart';
import 'package:flutter/material.dart';

import '../utils/constant_images.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const SignIpScreen()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        decoration:  const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fitWidth,
            image: AssetImage(ConstantImages.customSpBgImg),

          ),
        ),
        child: const Center(
          child: Image(image: AssetImage(ConstantImages.customSpLogo), height: 232, width: 279,),
        ),
      ),
    );
  }
}
