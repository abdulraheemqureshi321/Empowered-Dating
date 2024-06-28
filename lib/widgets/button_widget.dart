import 'package:flutter/material.dart';

import '../utils/constant_colors.dart';

class ButtonWidget extends StatelessWidget {
   ButtonWidget({super.key, required this.text, required this.onPressed});

  String text;
   final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 61,
      width: double.maxFinite,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: AppColor.primaryColor,
            side: const BorderSide(
                color: Colors.black,
                width: 1
            )
        ),
        child: Text(text,
          style:  const TextStyle(
            fontSize: 22,
            color: AppColor.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
