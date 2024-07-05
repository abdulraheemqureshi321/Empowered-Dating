

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:empowered_dating/main.dart';
import 'package:empowered_dating/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../models/chat_room_model.dart';

class HomeScreenController extends GetxController{

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;

  var isLoading = true.obs;

  Stream<List<UserModel>> getUsersStream() {
    return _firestore.collection('profiles').snapshots().map((QuerySnapshot snapshot) {
      return snapshot.docs.map((doc) {
        return UserModel.fromJson(doc.data() as Map<String, dynamic>);
      }).toList();
    });
  }

  User? getCurrentUser() {
    return auth.currentUser;
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
    User? user = auth.currentUser;
    try{
      DocumentSnapshot doc = await _firestore.collection('profiles').doc(user!.uid).get();
      currentUser.value = UserModel.fromJson(doc.data() as Map<String , dynamic>);
    }
    catch(e){
      print(e);
    }
  }


  Future<ChatRoomModel?> getChatroomModel(UserModel targetUser)async{
    ChatRoomModel? chatRoom;

   QuerySnapshot snapshot = await FirebaseFirestore.instance.collection("chatrooms").where
      ("participants.${currentUser.value.uid}", isEqualTo: true).where
      ("participants.${targetUser.uid}", isEqualTo: true).get();

   if(snapshot.docs.length > 0){

     // Fetch the existing one
     var docData = snapshot.docs[0].data();

     ChatRoomModel existingChatroom = ChatRoomModel.fromMap(docData as Map<String , dynamic>);

     chatRoom = existingChatroom;
   }
   else
     {
       // Create a new one
       ChatRoomModel newChatroom = ChatRoomModel(
         chatroomid: uuid.v1(),
         lastMessage: "",
         participants: {
           currentUser.value.uid.toString(): true,
           targetUser.uid.toString(): true,
         },
       );

       await FirebaseFirestore.instance.collection("chatrooms").doc(newChatroom.chatroomid).set(newChatroom.toMap());

       chatRoom = newChatroom;
       print("new chat room created");

     }
        return chatRoom;

  }
}