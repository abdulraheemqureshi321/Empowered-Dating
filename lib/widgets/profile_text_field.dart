import 'package:flutter/material.dart';

class ProfileTextFieldWidget extends StatelessWidget {
   ProfileTextFieldWidget({super.key, this.radius = 32,this.maxLine,required this.text,this.suffixIcon, required this.controller, required this.keyboardType, this.suffixIconColor, this.prefixIcon, this.prefixIconColor});

   String text;
  final IconData? suffixIcon;
   final IconData? prefixIcon;
   final TextEditingController controller;
  final TextInputType keyboardType;
  final Color? suffixIconColor;
   final Color? prefixIconColor;
   int? maxLine;
  double radius;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      controller: controller,
      maxLines: maxLine,
      decoration: InputDecoration(
        hintText: text,
        suffixIcon: suffixIcon != null ? Icon(suffixIcon, color: suffixIconColor,) : null,
        prefixIcon: prefixIcon != null ? Icon(prefixIcon, color: prefixIconColor,) : null,
        hintStyle: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w400,
            color: Color(0xffACACAC)
        ),
        contentPadding: const EdgeInsets.all(20),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: const BorderSide(
                color: Color(0xffACACAC)
            )
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: const BorderSide(
                color: Color(0xffACACAC)
            )
        ),
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: const BorderSide(
                color: Color(0xffACACAC)
            )
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: const BorderSide(
                color: Color(0xffACACAC)
            )
        ),
      ),

    );
  }
}
