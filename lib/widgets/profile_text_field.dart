import 'package:flutter/material.dart';

import '../utils/constant_colors.dart';

class ProfileTextFieldWidget extends StatelessWidget {
   ProfileTextFieldWidget({super.key, this.filledColor,this.radius = 32,this.maxLine,required this.text,this.suffixIcon, required this.controller, required this.keyboardType, this.suffixIconColor, this.prefixIcon, this.prefixIconColor});

   String text;
  final IconData? suffixIcon;
   final IconData? prefixIcon;
   final TextEditingController controller;
  final TextInputType keyboardType;
  final Color? suffixIconColor;
   final Color? prefixIconColor;
   final Color? filledColor;

   int? maxLine;
  double radius;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      controller: controller,
      maxLines: maxLine,
      decoration: InputDecoration(
        filled: filledColor != null ? true : false,
        fillColor: filledColor,
        hintText: text,
        suffixIcon: suffixIcon != null ? Icon(suffixIcon, color: suffixIconColor,) : null,
        prefixIcon: prefixIcon != null ? Icon(prefixIcon, color: prefixIconColor,) : null,
        hintStyle: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w400,
            color: AppColor.grayAC
        ),
        contentPadding: const EdgeInsets.all(20),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: const BorderSide(
                color: AppColor.grayAC
            )
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: const BorderSide(
                color: AppColor.grayAC
            )
        ),
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: const BorderSide(
                color: AppColor.grayAC
            )
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: const BorderSide(
                color: AppColor.grayAC
            )
        ),
      ),

    );
  }
}
