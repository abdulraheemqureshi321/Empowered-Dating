import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:empowered_dating/controller/profile_controller.dart';
import 'package:empowered_dating/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UpdateProfileController extends GetxController{

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;


  var currentUser = UserModel(
      uid: '',
      name: '',
      location: '',
      profileImageUrl: '',
      job: '',
      aboutMe: '',
      interest: '',
      collage: '',
      company: ''
  ).obs;

   late TextEditingController nameController ;
   late TextEditingController locationController ;
   late TextEditingController jobController ;
   late TextEditingController companyController ;
   late TextEditingController collageController ;
   late TextEditingController interestController;
   late TextEditingController aboutMeController ;




  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController();
    locationController = TextEditingController();
    jobController = TextEditingController();
    collageController = TextEditingController();
    companyController = TextEditingController();
    interestController = TextEditingController();
    aboutMeController = TextEditingController();
    loadUserProfile();
  }

  void loadUserProfile()async{
    User? user = _auth.currentUser;
    if(user != null)
      {
       DocumentSnapshot userDoc = await _firestore.collection("profiles").doc(user.uid).get();

       if(userDoc.exists)
         {
           currentUser.value = UserModel.fromJson(userDoc.data() as Map<String , dynamic>);

           nameController.text = currentUser.value.name;
           locationController.text = currentUser.value.location;
           jobController.text = currentUser.value.job;
           collageController.text = currentUser.value.collage;
           companyController.text = currentUser.value.company;
           interestController.text = currentUser.value.interest;
           aboutMeController.text = currentUser.value.aboutMe;
         }
      }
  }

  Future<void> updateUserProfile(String name, String location, String job, String company, String collage , String interest,String aboutMe, String imageUrl)async{
    User? user =_auth.currentUser;

    UserModel updateUser = UserModel(
        uid: user!.uid,
        name: name,
        location: location,
        profileImageUrl: imageUrl,
        job: job,
        aboutMe: aboutMe,
        interest: interest,
      company: company,
      collage: collage
    );
    await _firestore.collection("profiles").doc(user.uid).update(updateUser.toJson());
    currentUser.value = updateUser;

    ProfileScreenController profileScreenController = Get.put(ProfileScreenController());
    profileScreenController.updateProfile(updateUser);

  }


  Future<void> updateProfileImage()async{
    User? user = _auth.currentUser;

    if(user != null)
      {
        final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

        if(pickedFile != null)
          {
            File file = File(pickedFile.path);

            TaskSnapshot snapshot = await _storage.ref('profileimages/${user.uid}').putFile(file);
            String downloadUrl = await snapshot.ref.getDownloadURL();
            await _firestore.collection('profiles').doc(user.uid).update({'imageUrl': downloadUrl});
            currentUser.value = currentUser.value.copyWith(profileImageUrl: downloadUrl);

          }
      }
  }
}