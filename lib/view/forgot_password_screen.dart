import 'package:empowered_dating/utils/constant_images.dart';
import 'package:empowered_dating/view/sign_in_screen.dart';
import 'package:empowered_dating/view/verify_screen.dart';
import 'package:flutter/material.dart';

import '../widgets/button_widget.dart';
import '../widgets/simple_text.dart';
import '../widgets/text_field_widget.dart';
import '../widgets/text_widget.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {

  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fitWidth,
            image: AssetImage(ConstantImages.customBgImg),

          ),
        ),
        child:  Padding(
          padding: const EdgeInsets.only(top: 100, left: 40,right: 40, bottom: 20),
          child: Column(
            children: [
              const Image(image: AssetImage(ConstantImages.customLogo),height: 128, width: 155,),

              const SizedBox(height: 50,),

              TextWidget(text: 'Forgot\nPassword', fontSize: 45,),

              SimpleTextWidget(text: 'if you\'ve forgotten your password, dont\'t worry,\nEnter your email address below and we\'ll help\nYou reset '),

              const SizedBox(height: 40,),

              TextFormFieldWidget(text: 'youremail@gmail.com', keyboardType: TextInputType.emailAddress, controller: _emailController,),

              const SizedBox(height: 5,),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SimpleTextWidget(text: 'Back to', fontSize: 14,),
                  InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> const SignIpScreen()));
                      },
                      child: TextWidget(text: ' Sign in', fontSize: 14,))
                ],
              ),
              const Spacer(),

              ButtonWidget(text: 'Reset', onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const VerifyScreen()));
              },),




            ],
          ),
        ),
      ),
    );
  }
}
