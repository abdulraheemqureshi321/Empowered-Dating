import 'package:empowered_dating/view/Sign_up_screen.dart';
import 'package:empowered_dating/view/create_profile_screen.dart';
import 'package:empowered_dating/view/forgot_password_screen.dart';
import 'package:flutter/material.dart';
import '../widgets/button_widget.dart';
import '../widgets/simple_text.dart';
import '../widgets/text_field_widget.dart';
import '../widgets/text_widget.dart';

class SignIpScreen extends StatefulWidget {
  const SignIpScreen({super.key});

  @override
  State<SignIpScreen> createState() => _SignIpScreenState();
}

class _SignIpScreenState extends State<SignIpScreen> {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
          const Image(image: AssetImage('assets/logo2.png'),height: 128, width: 155,),

              const SizedBox(height: 70,),

              TextWidget(text: 'Sign in', fontSize: 45,),

              SimpleTextWidget(text: 'Please login to continue using our app'),

              const SizedBox(height: 40,),

              TextFormFieldWidget(text: 'Your Email', keyboardType: TextInputType.emailAddress, controller: _emailController,),

              const SizedBox(height: 20,),

              TextFormFieldWidget(text: 'Password', keyboardType: TextInputType.visiblePassword, controller: _passwordController, suffixIcon: Icons.visibility_off,suffixIconColor: const Color(0xffACB6BE),),

              const SizedBox(height: 5,),
              Align
                (
                alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const ForgotPasswordScreen()));
                    },
                      child: TextWidget(text: 'Forgot Password', fontSize: 12,))
              ),
              const Spacer(),

              ButtonWidget(text: 'Sign in', onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const CreateProfileScreen()));
              },),

              const SizedBox(height: 5,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SimpleTextWidget(text: 'Dont\' have an account', fontSize: 14,),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> const SignUpScreen()));
                    },
                      child: TextWidget(text: ' ? Sign Up', fontSize: 14,))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
