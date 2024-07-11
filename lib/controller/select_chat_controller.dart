import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../models/user_model.dart';

class SelectChatScreenController extends GetxController {

  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;


  User? getCurrentUser() {
    return _auth.currentUser;
  }

   Future<UserModel?> getUserModelById(String uid) async {
    UserModel? userModel;

    DocumentSnapshot docSnap = await FirebaseFirestore.instance.collection("profiles").doc(uid).get();

    if(docSnap.data() != null){
      userModel = UserModel.fromJson(docSnap.data() as Map<String , dynamic>);
    }

    return userModel;
  }

   Rx<UserModel> currentUser = UserModel(
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

   void fetchCurrentUser()async{
     User? user = _auth.currentUser;
     try{
       DocumentSnapshot doc = await _firestore.collection('profiles').doc(user!.uid).get();
       currentUser.value = UserModel.fromJson(doc.data() as Map<String , dynamic>);
     }
     catch(e){
       print(e);
     }
   }


}