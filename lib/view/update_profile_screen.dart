
import 'package:empowered_dating/utils/constant_images.dart';
import 'package:empowered_dating/widgets/button_widget.dart';
import 'package:empowered_dating/widgets/simple_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/update_profile_controller.dart';
import '../utils/constant_colors.dart';
import '../widgets/profile_text_field.dart';


class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {


  final UpdateProfileController _updateProfileController = Get.put(UpdateProfileController());

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {


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
                    _updateProfileController.updateProfileImage();
                    //getImageGallery();
                    },
                    child: Obx((){
                      return CircleAvatar(
                        radius: 67,
                        backgroundImage: _updateProfileController.currentUser.value.profileImageUrl.isNotEmpty ?
                        NetworkImage(_updateProfileController.currentUser.value.profileImageUrl)
                            : const AssetImage('assets/create_profile.png') as ImageProvider,);
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

                        ProfileTextFieldWidget(text: 'Enter Your Name', controller: _updateProfileController.nameController, keyboardType:TextInputType.text,suffixIconColor: AppColor.customIconColor,suffixIcon: Icons.person,validator: (value){
                          if(value!.isEmpty){
                            return 'Enter Name';
                          }
                          return null;
                        },),

                      Padding(
                          padding: const EdgeInsets.only(left: 20,bottom: 5, top: 10),
                          child: SimpleTextWidget(text: 'Location',fontSize: 14,)),
                      ProfileTextFieldWidget(text: 'Enter Your Location', controller: _updateProfileController.locationController, keyboardType:TextInputType.text,suffixIconColor: AppColor.customIconColor,suffixIcon: Icons.location_on_outlined,validator: (value){
                        if(value!.isEmpty){
                          return 'Enter Location';
                        }
                        return null;
                      }),

                      Padding(
                          padding: const EdgeInsets.only(left: 20,bottom: 5, top: 10),
                          child: SimpleTextWidget(text: 'Job',fontSize: 14,)),
                      ProfileTextFieldWidget(text: 'Enter Your Job Name', controller: _updateProfileController.jobController, keyboardType:TextInputType.text,suffixIconColor: AppColor.customIconColor,suffixIcon: Icons.shopping_bag_outlined,validator: (value){
                        if(value!.isEmpty){
                          return 'Enter you job';
                        }
                        return null;
                      }),

                      Padding(
                          padding: const EdgeInsets.only(left: 20,bottom: 5,top: 10),
                          child: SimpleTextWidget(text: 'Company',fontSize: 14,)),
                      ProfileTextFieldWidget(text: 'Enter Your Company Name', controller: _updateProfileController.companyController, keyboardType:TextInputType.text,suffixIconColor: AppColor.customIconColor,suffixIcon: Icons.home_outlined,validator: (value){
                        if(value!.isEmpty){
                          return 'Enter Company name';
                        }
                        return null;
                      }),

                      Padding(
                          padding: const EdgeInsets.only(left: 20,bottom: 5, top: 10),
                          child: SimpleTextWidget(text: 'College',fontSize: 14,)),
                      ProfileTextFieldWidget(text: 'Enter Your College Name', controller: _updateProfileController.collageController, keyboardType:TextInputType.text,suffixIconColor: AppColor.customIconColor,suffixIcon: Icons.school_outlined,validator: (value){
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
                        ProfileTextFieldWidget(text: 'Interest', controller: _updateProfileController.interestController, keyboardType:TextInputType.text,suffixIconColor: AppColor.primaryColor,suffixIcon: Icons.add_circle,validator: (value){
                          if(value!.isEmpty){
                            return 'Enter Interest';
                          }
                          return null;
                        }),


                      Padding(
                          padding: const EdgeInsets.only(left: 20,bottom: 5, top: 20),
                          child: SimpleTextWidget(text: 'About Me',fontSize: 14,)),
                        ProfileTextFieldWidget(text: 'About me', controller: _updateProfileController.aboutMeController, keyboardType:TextInputType.text,suffixIconColor: AppColor.primaryColor,suffixIcon: Icons.add_circle,validator: (value){
          if(value!.isEmpty){
            return 'Enter Interest';
          }
          return null;
        }),


        ],
                  )),
                    Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: ButtonWidget(text: 'Continue', onPressed: (){
                          if(_formKey.currentState!.validate()){
                            _updateProfileController.updateUserProfile(
                                _updateProfileController.nameController.text,
                                _updateProfileController.locationController.text,
                                _updateProfileController.jobController.text,
                                _updateProfileController.companyController.text,
                                _updateProfileController.collageController.text,
                                _updateProfileController.interestController.text,
                                _updateProfileController.aboutMeController.text,
                                _updateProfileController.currentUser.value.profileImageUrl
                            );
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Profile updated successfully')),
                            );
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
}
