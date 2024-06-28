import 'package:empowered_dating/controller/sign_up_controller.dart';
import 'package:empowered_dating/utils/constant_images.dart';
import 'package:empowered_dating/view/sign_in_screen.dart';
import 'package:empowered_dating/widgets/button_widget.dart';
import 'package:empowered_dating/widgets/simple_text.dart';
import 'package:empowered_dating/widgets/text_field_widget.dart';
import 'package:empowered_dating/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/constant_colors.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {


  final SignUpColtroller signUpColtroller = Get.put(SignUpColtroller());



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

              TextWidget(text: 'Sign Up', fontSize: 45,),

              SimpleTextWidget(text: 'Please fill the details and create account'),

              const SizedBox(height: 40,),
              Form(
                key: signUpColtroller.formKey,
                  child: Column(
                children: [
                  TextFormFieldWidget(text: 'Your Name', keyboardType: TextInputType.emailAddress, controller: signUpColtroller.nameController,validator: (value){
                    if(value!.isEmpty){
                      return 'Enter Name';
                    }
                    return null;
                  },),

                  const SizedBox(height: 20,),

                  TextFormFieldWidget(text: 'Your Email', keyboardType: TextInputType.emailAddress, controller: signUpColtroller.emailController,validator: (value){
                    if(value!.isEmpty){
                      return 'Enter Email';
                    }
                    return null;
                  }),

                  const SizedBox(height: 20,),

                  TextFormFieldWidget(text: 'Password', keyboardType: TextInputType.visiblePassword, controller: signUpColtroller.passwordController,suffixIcon: Icons.visibility_off,suffixIconColor: AppColor.grayBE,validator: (value){
                    if(value!.isEmpty){
                      return 'Enter Password';
                    }
                    return null;
                  }),

                ],
              )),

              const Spacer(),

              ButtonWidget(text: 'Sign up', onPressed: ()async{
                if(signUpColtroller.formKey.currentState!.validate()){
                  signUpColtroller.signUpUser();
                }
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
