import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:empowered_dating/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController{

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  var isLoading = true.obs;

  Stream<List<UserModel>> getUsersStream() {
    return _firestore.collection('profiles').snapshots().map((QuerySnapshot snapshot) {
      return snapshot.docs.map((doc) {
        return UserModel.fromJson(doc.data() as Map<String, dynamic>);
      }).toList();
    });
  }



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