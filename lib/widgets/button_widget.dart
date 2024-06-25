import 'package:flutter/material.dart';

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
            backgroundColor: const Color(0xff934C93),
            side: const BorderSide(
                color: Colors.black,
                width: 1
            )
        ),
        child: Text(text,
          style: const TextStyle(
            fontSize: 22,
            color: Color(0xffFFFFFF),
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
