import 'dart:async';

import 'package:empowered_dating/models/user_model.dart';
import 'package:empowered_dating/view/bottom_navigation.dart';
import 'package:empowered_dating/view/home_screen/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {

  var currentUser = Rx<User?>(FirebaseAuth.instance.currentUser);
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  var pickedImage = Rx<File?>(null);

  void createProfile(String name, String location, String job, String company, String collage, String interest, String aboutMe) async {
    try {
      String? imageUrl;
      if (pickedImage.value != null) {
        var snapshot = await _storage.ref().child('profileImages/${currentUser.value!.uid}').putFile(pickedImage.value!);
        imageUrl = await snapshot.ref.getDownloadURL();
      }

      await _firestore.collection('profiles').doc(currentUser.value!.uid).set({
        'name' : name,
           'location' : location,
           'job' : job,
           'company' : company,
           'collage' : collage,
           'interest' : interest,
           'about_me' : aboutMe,
        'imageUrl': imageUrl ?? '',
        'Uid' : currentUser.value!.uid
      });

      Get.snackbar("Profile Created", "Your profile has been created successfully");
      Get.to(BottomNavigation());
    } catch (e) {
      Get.snackbar("Profile Creation Failed", e.toString());
    }
  }



  Future<void> pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      pickedImage.value = File(pickedFile.path);
    }
  }



}
