import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:empowered_dating/models/user_model.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController{

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;



  Stream<List<UserModel>> getUsersStream() {
    return _firestore.collection('profiles').snapshots().map((QuerySnapshot snapshot) {
      return snapshot.docs.map((doc) {
        return UserModel.fromJson(doc.data() as Map<String, dynamic>);
      }).toList();
    });
  }

}