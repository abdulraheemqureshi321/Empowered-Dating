import 'package:empowered_dating/utils/constant_images.dart';
import 'package:empowered_dating/view/Sign_up_screen.dart';
import 'package:empowered_dating/view/forgot_password_screen.dart';
import 'package:empowered_dating/view/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../controller/sign_in_controller.dart';
import '../utils/constant_colors.dart';
import '../widgets/button_widget.dart';
import '../widgets/simple_text.dart';
import '../widgets/text_field_widget.dart';
import '../widgets/text_widget.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  final SignInController signInController = Get.put(SignInController());

  @override
  void dispose(){
    super.dispose();
    signInController.emailController.dispose();
    signInController.passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding:const EdgeInsets.only(top: 100, left: 40,right: 40, bottom: 20),
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
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
            const Image(image: AssetImage(ConstantImages.customLogo),height: 128, width: 155,),

                const SizedBox(height: 70,),

                TextWidget(text: 'Sign in', fontSize: 45,),

                SimpleTextWidget(text: 'Please login to continue using our app'),

                const SizedBox(height: 40,),
                Form(
                  key : signInController.formKey,
                  child: Column(
                    children: [
                      TextFormFieldWidget(text: 'Your Email', keyboardType: TextInputType.emailAddress, controller: signInController.emailController,validator: (value){
                        if(value!.isEmpty){
                          return 'Enter email';
                        }
                        return null;
                      }),

                      const SizedBox(height: 20,),

                      TextFormFieldWidget(text: 'Password', keyboardType: TextInputType.visiblePassword, controller: signInController.passwordController, suffixIcon: Icons.visibility_off,suffixIconColor: AppColor.grayBE,validator: (value){
                        if(value!.isEmpty){
                          return 'Enter password';
                        }
                        return null;
                      })
                    ]
                  ),
                ),

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
            SizedBox(height: 70,),

                ButtonWidget(text: 'Sign in', onPressed: ()async{
                  if(signInController.formKey.currentState!.validate()){
                    signInController.signInUser();
                  }
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
      ),
    );
  }
}
