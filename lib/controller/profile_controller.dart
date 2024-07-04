import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../models/user_model.dart';

class ProfileScreenController extends GetxController{

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void onInit() {
    super.onInit();
    fetchCurrentUser();
  }

  Rx<UserModel> currentUser = UserModel(
      uid: '',
      name: '',
      location: '',
      profileImageUrl: '',
      job: '',
      aboutMe: '',
    interest: ''
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