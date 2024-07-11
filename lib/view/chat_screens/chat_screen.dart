import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:empowered_dating/models/chat_room_model.dart';
import 'package:empowered_dating/models/message_model.dart';
import 'package:empowered_dating/models/user_model.dart';
import 'package:empowered_dating/utils/constant_images.dart';
import 'package:empowered_dating/view/chat_screens/video_call_screen.dart';
import 'package:empowered_dating/widgets/profile_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../main.dart';
import '../../utils/constant_colors.dart';
import 'call_screen.dart';

class ChatScreen extends StatefulWidget {
  final UserModel targetUser;
  final ChatRoomModel chatroom;
  final UserModel userModel;
  final User? firebaseUser;
  const ChatScreen({
    super.key,
    required this.targetUser,
    required this.chatroom,
    required this.userModel,
    required this.firebaseUser
  });
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController messageController = TextEditingController();

  void sendMessage()async{
    String msg = messageController.text.trim();
    messageController.clear();
    if(msg != ""){
      //send message

      MessageModel newMessageb= MessageModel(
        messageid: uuid.v1(),
        sender: widget.userModel.uid,
        createdon: DateTime.now(),
        text: msg,
        seen: false,
      );

      FirebaseFirestore.instance.collection("chatrooms").doc(
          widget.chatroom.chatroomid).collection("messages").doc(
          newMessageb.messageid).set(newMessageb.toMap());

      widget.chatroom.lastMessage = msg;
      FirebaseFirestore.instance.collection("chatrooms").doc(widget.chatroom.chatroomid).set(widget.chatroom.toMap());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fitWidth,
            image: AssetImage(ConstantImages.customBgImg),
          ),
        ),
        child: Column(
          children: [
            Container(
              height: 161,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40)),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child:  const Icon(
                          Icons.arrow_back_ios_new,
                          color: AppColor.grayAC,
                        )),
                    const SizedBox(
                      width: 10,
                    ),
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(widget.targetUser.profileImageUrl),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                     SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(widget.targetUser.name.toString(),
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: AppColor.gray5E)),
                            const SizedBox(
                              height: 14,
                            ),
                            const Text(
                              'Online',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.gray5E),
                            )
                          ],
                        ),
                      ),
                    ),
                    const Spacer(),
                    InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const CallScreen()));
                        },
                        child: const Icon(
                          CupertinoIcons.phone,
                          color: AppColor.customIconColor,
                          size: 28,
                        )),
                    const SizedBox(
                      width: 5,
                    ),
                    InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const VideoCallScreen()));
                        },
                        child: const Icon(
                          CupertinoIcons.video_camera,
                          color: AppColor.customIconColor,
                          size: 32,
                        ))
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10
                ),
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance.collection("chatrooms").doc(widget.chatroom.chatroomid).collection("messages").orderBy("createdon", descending: true).snapshots(),
                  builder: (context, snapshot) {
                    if(snapshot.connectionState == ConnectionState.active) {
                      if(snapshot.hasData) {
                        QuerySnapshot dataSnapshot = snapshot.data as QuerySnapshot;

                        return ListView.builder(
                          reverse: true,
                          itemCount: dataSnapshot.docs.length,
                          itemBuilder: (context, index) {
                            MessageModel currentMessage = MessageModel.fromMap(dataSnapshot.docs[index].data() as Map<String, dynamic>);

                            return Row(
                              mainAxisAlignment: (currentMessage.sender == widget.userModel.uid) ? MainAxisAlignment.end : MainAxisAlignment.start,
                              children: [
                                Container(
                                    margin: const EdgeInsets.symmetric(
                                      vertical: 2,
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 10,
                                      horizontal: 10,
                                    ),
                                    decoration: BoxDecoration(
                                      color: (currentMessage.sender == widget.userModel.uid) ? Colors.grey : Theme.of(context).colorScheme.secondary,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Text(
                                      currentMessage.text.toString(),
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                    )
                                ),
                              ],
                            );
                          },
                        );
                      }
                      else if(snapshot.hasError) {
                        return const Center(
                          child: Text("An error occured! Please check your internet connection."),
                        );
                      }
                      else {
                        return const Center(
                          child: Text("Say hi to your new friend"),
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
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10,right: 10,bottom: 10),
              child: Row(
                children: [
                  Expanded(
                    child: ProfileTextFieldWidget(
                      text: 'write a message',
                      controller: messageController,
                      keyboardType: TextInputType.text,
                      prefixIcon: CupertinoIcons.smiley,
                      suffixIcon: CupertinoIcons.camera,
                      filledColor: Colors.white,
                      prefixIconColor: AppColor.grayAC,
                      suffixIconColor: AppColor.grayAC,
                      maxLine: null,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: InkWell(
                      onTap: () {
                        sendMessage();
                      },
                      child: Container(
                        height: 63,
                        width: 63,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: AppColor.primaryColor),
                        child: const Icon(
                          Icons.send,
                          color: Colors.white,
                          size: 28,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
