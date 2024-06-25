import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RowWidget extends StatelessWidget {
  RowWidget({super.key, required this.text, this.icon});
  String text;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: const Color(0xff934C93),size: 16,),
        SizedBox(width: 5,),
        Text(text, style: const TextStyle(fontSize: 12,fontWeight: FontWeight.w400,color: Color(0xffACACAC)),)
      ],
    );
  }
}
