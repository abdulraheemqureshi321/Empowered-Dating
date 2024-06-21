import 'package:empowered_dating/view/payment_screen/payment_screen.dart';
import 'package:empowered_dating/widgets/button_row.dart';
import 'package:empowered_dating/widgets/button_widget.dart';
import 'package:empowered_dating/widgets/simple_text.dart';
import 'package:empowered_dating/widgets/text_field_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/profile_text_field.dart';


class CreateProfileScreen extends StatefulWidget {
  const CreateProfileScreen({super.key});

  @override
  State<CreateProfileScreen> createState() => _CreateProfileScreenState();
}

class _CreateProfileScreenState extends State<CreateProfileScreen> {



  @override
  Widget build(BuildContext context) {

    double screenHight = MediaQuery.of(context).size.height;
    final TextEditingController _nameController = TextEditingController();
    final TextEditingController _locationController = TextEditingController();
    final TextEditingController _jobController = TextEditingController();
    final TextEditingController _companyController = TextEditingController();
    final TextEditingController _collegeController = TextEditingController();
    final TextEditingController _interestController = TextEditingController();
    final TextEditingController _aboutMeController = TextEditingController();


    return  Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage('assets/create_profile_background.png'),

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
                height: double.maxFinite,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    image: AssetImage('assets/background.png'),
                  ),
              ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(left: 20,bottom: 5,top: 10),
                        child: SimpleTextWidget(text: 'Name',fontSize: 14,)),
                    ProfileTextFieldWidget(text: 'Enter Your Name', controller: _nameController, keyboardType:TextInputType.text,suffixIconColor: const Color(0xffFDB813),suffixIcon: Icons.person,),


                    Padding(
                        padding: const EdgeInsets.only(left: 20,bottom: 5, top: 10),
                        child: SimpleTextWidget(text: 'Location',fontSize: 14,)),
                    ProfileTextFieldWidget(text: 'Enter Your Location', controller: _locationController, keyboardType:TextInputType.text,suffixIconColor: const Color(0xffFDB813),suffixIcon: Icons.location_on_outlined,),

                    Padding(
                        padding: const EdgeInsets.only(left: 20,bottom: 5, top: 10),
                        child: SimpleTextWidget(text: 'Job',fontSize: 14,)),
                    ProfileTextFieldWidget(text: 'Enter Your Job Name', controller: _jobController, keyboardType:TextInputType.text,suffixIconColor: const Color(0xffFDB813),suffixIcon: Icons.shopping_bag_outlined,),

                    Padding(
                        padding: const EdgeInsets.only(left: 20,bottom: 5,top: 10),
                        child: SimpleTextWidget(text: 'Company',fontSize: 14,)),
                    ProfileTextFieldWidget(text: 'Enter Your Company Name', controller: _companyController, keyboardType:TextInputType.text,suffixIconColor: const Color(0xffFDB813),suffixIcon: Icons.home_outlined,),

                    Padding(
                        padding: const EdgeInsets.only(left: 20,bottom: 5, top: 10),
                        child: SimpleTextWidget(text: 'College',fontSize: 14,)),
                    ProfileTextFieldWidget(text: 'Enter Your College Name', controller: _collegeController, keyboardType:TextInputType.text,suffixIconColor: const Color(0xffFDB813),suffixIcon: Icons.school_outlined,),

                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Align(
                        alignment: Alignment.center,
                          child: SimpleTextWidget(text: 'Interest',fontSize: 14,)),
                    ),
                    ProfileTextFieldWidget(text: 'Interest', controller: _interestController, keyboardType:TextInputType.text,suffixIconColor: const Color(0xff934C93),suffixIcon: Icons.add_circle,),

                    Padding(
                        padding: const EdgeInsets.only(left: 20,bottom: 5, top: 20),
                        child: SimpleTextWidget(text: 'About Me',fontSize: 14,)),
                    ProfileTextFieldWidget(text: 'Enter Text', radius: 8, controller: _aboutMeController, keyboardType:TextInputType.text,maxLine: 6,),

                    Padding(
                      padding: EdgeInsets.only(top: 10),
                        child: ButtonWidget(text: 'Continue', onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> PaymentScreen()));
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
