import 'package:empowered_dating/utils/constant_images.dart';
import 'package:empowered_dating/view/payment_screen/payment_screen.dart';
import 'package:empowered_dating/widgets/button_widget.dart';
import 'package:empowered_dating/widgets/simple_text.dart';
import 'package:flutter/material.dart';
import '../utils/constant_colors.dart';
import '../widgets/profile_text_field.dart';


class CreateProfileScreen extends StatefulWidget {
  const CreateProfileScreen({super.key});

  @override
  State<CreateProfileScreen> createState() => _CreateProfileScreenState();
}

class _CreateProfileScreenState extends State<CreateProfileScreen> {

  final TextEditingController nameController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController jobController = TextEditingController();
  final TextEditingController companyController = TextEditingController();
  final TextEditingController collegeController = TextEditingController();
  final TextEditingController interestController = TextEditingController();
  final TextEditingController aboutMeController = TextEditingController();


  @override
  Widget build(BuildContext context) {

    double screenHight = MediaQuery.of(context).size.height;

    return  Scaffold(
      body: Container(
        height: double.maxFinite,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(ConstantImages.customBgImg),
          ),
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                height: screenHight / 3,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/create_profile.png'),

                  ),
                ),
                child: const Center(
                    child: Icon(
                        Icons.camera_alt_outlined,
                      size: 45,
                      color: Color(0xffBBBBBB),
                    )
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 35,right: 35,top: 20, bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(left: 20,bottom: 5,top: 10),
                        child: SimpleTextWidget(text: 'Name',fontSize: 14,)),
                    ProfileTextFieldWidget(text: 'Enter Your Name', controller: nameController, keyboardType:TextInputType.text,suffixIconColor: AppColor.customIconColor,suffixIcon: Icons.person,),


                    Padding(
                        padding: const EdgeInsets.only(left: 20,bottom: 5, top: 10),
                        child: SimpleTextWidget(text: 'Location',fontSize: 14,)),
                    ProfileTextFieldWidget(text: 'Enter Your Location', controller: locationController, keyboardType:TextInputType.text,suffixIconColor: AppColor.customIconColor,suffixIcon: Icons.location_on_outlined,),

                    Padding(
                        padding: const EdgeInsets.only(left: 20,bottom: 5, top: 10),
                        child: SimpleTextWidget(text: 'Job',fontSize: 14,)),
                    ProfileTextFieldWidget(text: 'Enter Your Job Name', controller: jobController, keyboardType:TextInputType.text,suffixIconColor: AppColor.customIconColor,suffixIcon: Icons.shopping_bag_outlined,),

                    Padding(
                        padding: const EdgeInsets.only(left: 20,bottom: 5,top: 10),
                        child: SimpleTextWidget(text: 'Company',fontSize: 14,)),
                    ProfileTextFieldWidget(text: 'Enter Your Company Name', controller: companyController, keyboardType:TextInputType.text,suffixIconColor: AppColor.customIconColor,suffixIcon: Icons.home_outlined,),

                    Padding(
                        padding: const EdgeInsets.only(left: 20,bottom: 5, top: 10),
                        child: SimpleTextWidget(text: 'College',fontSize: 14,)),
                    ProfileTextFieldWidget(text: 'Enter Your College Name', controller: collegeController, keyboardType:TextInputType.text,suffixIconColor: AppColor.customIconColor,suffixIcon: Icons.school_outlined,),

                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Align(
                        alignment: Alignment.center,
                          child: SimpleTextWidget(text: 'Interest',fontSize: 14,)),
                    ),
                    ProfileTextFieldWidget(text: 'Interest', controller: interestController, keyboardType:TextInputType.text,suffixIconColor: AppColor.primaryColor,suffixIcon: Icons.add_circle,),

                    Padding(
                        padding: const EdgeInsets.only(left: 20,bottom: 5, top: 20),
                        child: SimpleTextWidget(text: 'About Me',fontSize: 14,)),
                    ProfileTextFieldWidget(text: 'Enter Text', radius: 8, controller: aboutMeController, keyboardType:TextInputType.text,maxLine: 6,),

                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                        child: ButtonWidget(text: 'Continue', onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> const PaymentScreen()));
                        }))

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
