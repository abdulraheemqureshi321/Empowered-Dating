import 'package:flutter/material.dart';

import '../utils/constant_colors.dart';

class SimpleTextWidget extends StatelessWidget {
   SimpleTextWidget({super.key, required this.text, this.fontSize});

  String text;
  double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(text,
      textAlign: TextAlign.center,
      style: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.w500,
          color: AppColor.grayA4,
      ),
    );
  }
}
