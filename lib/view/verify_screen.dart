import 'package:empowered_dating/view/new_password_screen.dart';
import 'package:empowered_dating/widgets/button_widget.dart';
import 'package:empowered_dating/widgets/simple_text.dart';
import 'package:empowered_dating/widgets/text_field_widget.dart';
import 'package:empowered_dating/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyScreen extends StatefulWidget {
  const VerifyScreen({super.key});

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {

  final TextEditingController _otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fitWidth,
            image: AssetImage('assets/background.png'),

          ),
        ),
        child:  Padding(
          padding: const EdgeInsets.only(top: 100, left: 40,right: 40, bottom: 20),
          child: Column(
            children: [


              const SizedBox(height: 170,),

              TextWidget(text: 'Verify Your\nEmail', fontSize: 45,),

              SimpleTextWidget(text: 'Enter Verification Code'),

              const SizedBox(height: 40,),
              
              Padding(
                padding: const EdgeInsets.only(left: 35,right: 35),
                child: PinCodeTextField(
                  appContext: context,
                  length: 4,
                  controller: _otpController,
                  keyboardType: TextInputType.number,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.circle,
                    fieldHeight: 55,
                    fieldWidth: 55,
                    selectedColor: const Color(0xff934C93),
                    inactiveColor: const Color(0xff934C93),
                  ),
                ),
              ),


              const SizedBox(height: 5,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SimpleTextWidget(text: 'if you didn\' receive a code,', fontSize: 14,),
                  InkWell(
                      onTap: (){
                       // Navigator.push(context, MaterialPageRoute(builder: (context)=> const SignIpScreen()));
                      },
                      child: TextWidget(text: ' Resend', fontSize: 14,))
                ],
              ),
              const Spacer(),

              ButtonWidget(text: 'Verify', onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> NewPasswordScreen()));
              },),




            ],
          ),
        ),
      ),
    );
  }
}
