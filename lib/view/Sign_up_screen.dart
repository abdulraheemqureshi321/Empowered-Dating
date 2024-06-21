import 'package:empowered_dating/view/sign_in_screen.dart';
import 'package:empowered_dating/widgets/button_widget.dart';
import 'package:empowered_dating/widgets/simple_text.dart';
import 'package:empowered_dating/widgets/text_field_widget.dart';
import 'package:empowered_dating/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final TextEditingController _nameController = TextEditingController();
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

              const SizedBox(height: 50,),

              TextWidget(text: 'Sign Up', fontSize: 45,),

              SimpleTextWidget(text: 'Please fill the details and create account'),

              const SizedBox(height: 40,),

              TextFormFieldWidget(text: 'Your Name', keyboardType: TextInputType.emailAddress, controller: _nameController,),

              const SizedBox(height: 20,),

              TextFormFieldWidget(text: 'Your Email', keyboardType: TextInputType.emailAddress, controller: _emailController,),

              const SizedBox(height: 20,),

              TextFormFieldWidget(text: 'Password', keyboardType: TextInputType.visiblePassword, controller: _passwordController,suffixIcon: Icons.visibility_off,suffixIconColor: Color(0xffACB6BE),),


              const Spacer(),

              ButtonWidget(text: 'Sign up', onPressed: (){

              },),

              const SizedBox(height: 5,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SimpleTextWidget(text: 'Already have an account', fontSize: 14,),
                  InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> const SignIpScreen()));
                      },
                      child: TextWidget(text: ' ? Sign In', fontSize: 14,))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
