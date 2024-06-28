import 'package:empowered_dating/utils/constant_images.dart';
import 'package:empowered_dating/view/sign_in_screen.dart';
import 'package:empowered_dating/view/verify_screen.dart';
import 'package:flutter/material.dart';

import '../utils/constant_colors.dart';
import '../widgets/button_widget.dart';
import '../widgets/simple_text.dart';
import '../widgets/text_field_widget.dart';
import '../widgets/text_widget.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({super.key});

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {


  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmController = TextEditingController();

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

              TextWidget(text: 'Create\nNew Password', fontSize: 45,),

              SimpleTextWidget(text: 'Please create a new password for your account\nYour password must be different from your\nPrevious one ',fontSize: 14,),

              const SizedBox(height: 20,),

              TextFormFieldWidget(text: 'New Password', keyboardType: TextInputType.emailAddress, controller: _passwordController,suffixIcon: Icons.visibility_off,suffixIconColor: AppColor.grayBE,),

              const SizedBox(height: 20,),

              TextFormFieldWidget(text: 'Confirm Your Password', keyboardType: TextInputType.emailAddress, controller: _confirmController,suffixIcon: Icons.visibility_off,suffixIconColor: AppColor.grayBE,),

              const SizedBox(height: 5,),

              Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> const SignIpScreen()));
                    },
                    child: TextWidget(text: 'Forgot Password', fontSize: 12,)),
              ),

              const Spacer(),

              ButtonWidget(text: 'Change Password', onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const VerifyScreen()));
              },),




            ],
          ),
        ),
      ),
    );
  }
}
