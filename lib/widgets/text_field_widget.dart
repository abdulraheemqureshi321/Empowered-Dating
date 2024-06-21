import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
   TextFormFieldWidget({super.key, required this.text, this.symbol,required this.controller, required this.keyboardType});

  String text;
  Icon?  symbol;
   final TextEditingController controller;
   final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      controller: controller,
      decoration: InputDecoration(
        hintText: text,
        suffixIcon: symbol,
        hintStyle: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w400,
            color: Color(0xffA4A4A4)
        ),
        contentPadding: EdgeInsets.all(20),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32),
            borderSide: BorderSide(
                color: Color(0xff934C93)
            )
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32),
            borderSide: BorderSide(
                color: Color(0xff934C93)
            )
        ),
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32),
            borderSide: BorderSide(
                color: Color(0xff934C93)
            )
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32),
            borderSide: BorderSide(
                color: Color(0xff934C93)
            )
        ),
      ),
      onChanged: (value){

      },
    );
  }
}
