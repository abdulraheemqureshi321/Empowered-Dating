import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:empowered_dating/controller/select_chat_controller.dart';
import 'package:empowered_dating/models/chat_room_model.dart';
import 'package:empowered_dating/models/user_model.dart';
import 'package:empowered_dating/utils/constant_images.dart';
import 'package:empowered_dating/view/chat_screens/chat_screen.dart';
import 'package:empowered_dating/view/select_chat_screen/widget/chat_card.dart';
import 'package:empowered_dating/widgets/profile_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../utils/constant_colors.dart';
import '../../widgets/simple_text.dart';

class SelectChatScreen extends StatefulWidget {
  const SelectChatScreen({super.key});

  @override
  State<SelectChatScreen> createState() => _SelectChatScreenState();
}

class _SelectChatScreenState extends State<SelectChatScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    List<String> images = ['assets/1.png','assets/2.png','assets/3.png','assets/4.png','assets/5.png','assets/1.png','assets/2.png','assets/3.png','assets/4.png','assets/5.png'];

    FirebaseAuth auth = FirebaseAuth.instance;
    SelectChatScreenController selectChatScreenController = Get.put(SelectChatScreenController());

    User? currentUser = selectChatScreenController.getCurrentUser();


    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: SimpleTextWidget(
          text: 'Chat',
          fontSize: 16,
        ),
        centerTitle: true,
        actions: const [
          Padding(
              padding: EdgeInsets.only(right: 10, left: 5),
              child: Icon(
                Icons.delete_outline,
                color: AppColor.customIconColor,
              ))
        ],
      ),
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(ConstantImages.customBgImg),
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 20),
                child: Container(
                  color: Colors.white,
                    child: ProfileTextFieldWidget(text: 'Search Messages', controller: _searchController, keyboardType: TextInputType.text, prefixIcon: Icons.search_outlined, prefixIconColor: AppColor.grayAC,radius: 0,)),
              ),
               const Padding(
                padding: EdgeInsets.only(right: 20,left: 20),
                child: Row(
                  children: [
                    Text(
                      'New Matches',
                      style: TextStyle(fontSize: 14, color: AppColor.gray5E),
                    ),
                    Spacer(),
                    Text(
                      'See All',
                      style: TextStyle(fontSize: 12, color: AppColor.primaryColor),
                    ),
                    Icon(
                      Icons.arrow_forward,
                      weight: 2,
                      color: AppColor.primaryColor
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20,),
                SizedBox(
                  width: double.infinity,
                  height: 65,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: images.length,
                      itemBuilder: (context , index){
                    return Padding(
                      padding: const EdgeInsets.only(right: 5,left: 5),
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage(images[index]),
                      ),
                    );
                  }),
                ),

              const SizedBox(height: 20,),
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text('Messages', style: TextStyle(fontSize: 14, color: AppColor.gray5E),),
              ),
              const SizedBox(height: 20,),
              Expanded(
                  child: StreamBuilder(
                    stream: FirebaseFirestore.instance.collection("chatrooms").where("participants.${auth.currentUser!.uid}", isEqualTo: true).snapshots(),
                    builder: (context , snapshot){
                      if(snapshot.connectionState == ConnectionState.active){
                        if(snapshot.hasData){

                          QuerySnapshot chatRoomSnapshot = snapshot.data as QuerySnapshot;
                          return ListView.builder(
                            itemCount: chatRoomSnapshot.docs.length,
                            itemBuilder: (context , index){

                              ChatRoomModel? chatRoomModel = ChatRoomModel.fromMap(chatRoomSnapshot.docs[index].data() as Map<String , dynamic>);
                              Map<String , dynamic> participants = chatRoomModel.participants!;

                              List<String> participantsKey = participants.keys.toList();

                              participantsKey.remove(currentUser!.uid);

                              return FutureBuilder(
                                future: selectChatScreenController.getUserModelById(participantsKey[0]),
                                builder: (context , userData){
                                  if(userData.connectionState == ConnectionState.done){
                                    if(userData.data != null)
                                      {

                                        UserModel targetUser = userData.data as UserModel;
                                        return Padding(
                                          padding:  const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                                          child: InkWell(
                                            onTap: (){
                                              Navigator.push(context, MaterialPageRoute(builder: (context)=> ChatScreen(
                                                  targetUser: targetUser,
                                                  chatroom: chatRoomModel,
                                                  userModel: selectChatScreenController.currentUser.value,
                                                  firebaseUser: FirebaseAuth.instance.currentUser!
                                              )));
                                            },
                                              child: ChatCard(imageUri: targetUser.profileImageUrl, title: targetUser.name, subTitle: chatRoomModel.lastMessage.toString())),
                                        );

                                      }
                                    else
                                    {

                                      return Container();
                                    }
                                    }
                                  else
                                    {
                                      return Container();
                                    }
                                   },
                              );
                            },
                          );

                        }
                        else if(snapshot.hasError){
                          return Center(
                            child: Text(snapshot.error.toString()),
                          );
                        }
                        else{
                          return const Center(
                            child: Text("No Chats "),
                          );
                        }
                      }
                      else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
