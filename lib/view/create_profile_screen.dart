import 'dart:io';

import 'package:empowered_dating/controller/create_profile_controller.dart';
import 'package:empowered_dating/utils/constant_images.dart';
import 'package:empowered_dating/utils/custom_toast.dart';
import 'package:empowered_dating/view/payment_screen/payment_screen.dart';
import 'package:empowered_dating/widgets/button_widget.dart';
import 'package:empowered_dating/widgets/simple_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
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
  final TextEditingController collageController = TextEditingController();
  final TextEditingController interestController = TextEditingController();
  final TextEditingController aboutMeController = TextEditingController();
  final ProfileController _profileController = Get.put(ProfileController());

  final _formKey = GlobalKey<FormState>();

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
              const SizedBox(height: 30,),
                GestureDetector(
                  onTap:(){
                    _profileController.pickImage();
                    //getImageGallery();
                    },
                    child: Obx((){
                      return CircleAvatar(
                        radius: 67,
                        backgroundImage: _profileController.pickedImage.value != null? FileImage(_profileController.pickedImage.value!) : const AssetImage('assets/create_profile.png') as ImageProvider,
                      );
                    }),
                    ),
              Container(
                padding: const EdgeInsets.only(left: 35,right: 35,top: 20, bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Form(
                    key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(left: 20,bottom: 5,top: 10),
                          child: SimpleTextWidget(text: 'Name',fontSize: 14,)),
                      ProfileTextFieldWidget(text: 'Enter Your Name', controller: nameController, keyboardType:TextInputType.text,suffixIconColor: AppColor.customIconColor,suffixIcon: Icons.person,validator: (value){
                        if(value!.isEmpty){
                          return 'Enter Name';
                        }
                        return null;
                      },),


                      Padding(
                          padding: const EdgeInsets.only(left: 20,bottom: 5, top: 10),
                          child: SimpleTextWidget(text: 'Location',fontSize: 14,)),
                      ProfileTextFieldWidget(text: 'Enter Your Location', controller: locationController, keyboardType:TextInputType.text,suffixIconColor: AppColor.customIconColor,suffixIcon: Icons.location_on_outlined,validator: (value){
                        if(value!.isEmpty){
                          return 'Enter Location';
                        }
                        return null;
                      }),

                      Padding(
                          padding: const EdgeInsets.only(left: 20,bottom: 5, top: 10),
                          child: SimpleTextWidget(text: 'Job',fontSize: 14,)),
                      ProfileTextFieldWidget(text: 'Enter Your Job Name', controller: jobController, keyboardType:TextInputType.text,suffixIconColor: AppColor.customIconColor,suffixIcon: Icons.shopping_bag_outlined,validator: (value){
                        if(value!.isEmpty){
                          return 'Enter you job';
                        }
                        return null;
                      }),

                      Padding(
                          padding: const EdgeInsets.only(left: 20,bottom: 5,top: 10),
                          child: SimpleTextWidget(text: 'Company',fontSize: 14,)),
                      ProfileTextFieldWidget(text: 'Enter Your Company Name', controller: companyController, keyboardType:TextInputType.text,suffixIconColor: AppColor.customIconColor,suffixIcon: Icons.home_outlined,validator: (value){
                        if(value!.isEmpty){
                          return 'Enter Company name';
                        }
                        return null;
                      }),

                      Padding(
                          padding: const EdgeInsets.only(left: 20,bottom: 5, top: 10),
                          child: SimpleTextWidget(text: 'College',fontSize: 14,)),
                      ProfileTextFieldWidget(text: 'Enter Your College Name', controller: collageController, keyboardType:TextInputType.text,suffixIconColor: AppColor.customIconColor,suffixIcon: Icons.school_outlined,validator: (value){
                        if(value!.isEmpty){
                          return 'Enter Collage Name';
                        }
                        return null;
                      }),

                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Align(
                            alignment: Alignment.center,
                            child: SimpleTextWidget(text: 'Interest',fontSize: 14,)),
                      ),
                      ProfileTextFieldWidget(text: 'Interest', controller: interestController, keyboardType:TextInputType.text,suffixIconColor: AppColor.primaryColor,suffixIcon: Icons.add_circle,validator: (value){
                        if(value!.isEmpty){
                          return 'Enter Interest';
                        }
                        return null;
                      }),

                      Padding(
                          padding: const EdgeInsets.only(left: 20,bottom: 5, top: 20),
                          child: SimpleTextWidget(text: 'About Me',fontSize: 14,)),
                      ProfileTextFieldWidget(text: 'Enter Text', radius: 8, controller: aboutMeController, keyboardType:TextInputType.text,maxLine: 6,validator: (value){
                        if(value!.isEmpty){
                          return 'Enter About me';
                        }
                        return null;
                      }),

                    ],
                  )),
                    Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: ButtonWidget(text: 'Continue', onPressed: (){
                          if(_formKey.currentState!.validate() && _profileController.pickedImage.value != null){
                            _profileController.createProfile(
                                nameController.text,
                                locationController.text,
                                jobController.text,
                                companyController.text,
                                collageController.text,
                                interestController.text,
                                aboutMeController.text);
                          }
                         }
                        ))

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding customfield(String title) {
    return Padding(
                      padding: const EdgeInsets.only(left: 20,bottom: 5,top: 10),
                      child: SimpleTextWidget(text: title,fontSize: 14,));
  }
}
