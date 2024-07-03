import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:empowered_dating/utils/custom_toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
class Authentication {

  // for storing data in cloud firestore
  final FirebaseFirestore _firestor = FirebaseFirestore.instance;

  // for authentication
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // for sign up
  Future<String> signUpUser(
      {required String email, required String password, required String name}) async {
    String res = " Some error occurred ";
    try {

      // for register user in firebase auth with email and password
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      // for adding user to our cloud firestore
      await _firestor.collection("users").doc(credential.user!.uid).set({
        'name': name,
        'email': email,
        'uid': credential.user!.uid,
      });
      res = "success";
    }
    catch (e) {
      print(e.toString());
    }
    return res;
  }


  // for sign in
  Future<String> signInUser(
      {required String email, required String password}) async {
    String res = " Some error occurred ";
    try {

      // for register user in firebase auth with email and password
     await _auth.signInWithEmailAndPassword(email: email, password: password);
     CustomToast().toastMessage('Login Successful');
      res = "success";
    }
    catch (e) {
      CustomToast().toastMessage('$e');
    }
    return res;
  }

  //for forgot password


}

