import 'package:flutter/material.dart';

import '../utils/constant_colors.dart';

class TextFormFieldWidget extends StatelessWidget {
   TextFormFieldWidget({super.key,this.maxLine = 1, required this.text, this.suffixIconColor,this.suffixIcon,required this.controller, required this.keyboardType, this.validator});

  String text;
   final IconData? suffixIcon;
   final TextEditingController controller;
   final TextInputType keyboardType;
   final Color? suffixIconColor;
   int maxLine;
   final String? Function(String?)? validator;


   @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      controller: controller,
      maxLines: maxLine,
      validator: validator,
      decoration: InputDecoration(
        hintText: text,
        suffixIcon: suffixIcon != null ? Icon(suffixIcon, color: suffixIconColor,) : null,
        hintStyle: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w400,
            color: AppColor.grayA4
        ),
        contentPadding: const EdgeInsets.all(20),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32),
            borderSide: const BorderSide(
                color: AppColor.primaryColor
            )
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32),
            borderSide: const BorderSide(
                color: AppColor.primaryColor
            )
        ),
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32),
            borderSide: const BorderSide(
                color: AppColor.primaryColor
            )
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32),
            borderSide: const BorderSide(
                color: AppColor.primaryColor
            )
        ),
      ),
      onChanged: (value){

      },
    );
  }
}
