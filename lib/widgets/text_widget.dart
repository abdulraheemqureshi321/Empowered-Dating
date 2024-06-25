import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
   TextWidget({super.key , required this.text, this.fontSize});

  String text;
  double? fontSize;

  @override
  Widget build(BuildContext context) {
    return   Text(text,
      textAlign: TextAlign.center,
      style:  TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: fontSize,
        color: const Color( 0xff934C93),
      ),);
  }
}
