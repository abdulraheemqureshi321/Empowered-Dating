import 'package:empowered_dating/utils/constant_colors.dart';
import 'package:empowered_dating/view/chat_screens/chat_screen.dart';
import 'package:empowered_dating/widgets/text_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controller/home_controller.dart';
import '../models/chat_room_model.dart';
import '../models/user_model.dart';
import '../utils/constant_images.dart';
import '../widgets/simple_text.dart';

class DetailsScreen extends StatefulWidget {
  final UserModel targetUser;
  final UserModel userModel;
  final User? firebaseUser;

  const DetailsScreen({
    super.key,
    required this.targetUser,
    required this.userModel,
    required this.firebaseUser
  });

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {

  final HomeScreenController homeController = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: SimpleTextWidget(
          text: 'Home',
          fontSize: 16,
        ),
        centerTitle: true,
      ),

      body: Container(
        padding: const EdgeInsets.only(top: 20),
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(ConstantImages.customBgImg),
          ),
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SafeArea(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 70,
                  backgroundImage: NetworkImage(widget.targetUser.profileImageUrl),
                ),
                const SizedBox(height: 10,),
                TextWidget(text: widget.targetUser.name, fontSize: 25,),
                const SizedBox(height: 10,),
                SimpleTextWidget(text: widget.targetUser.job, fontSize: 17,),
                const SizedBox(height: 10,),
                SimpleTextWidget(text: widget.targetUser.location, fontSize: 17,),
                const SizedBox(height: 10,),
                SimpleTextWidget(text: widget.targetUser.aboutMe, fontSize: 17,),
                const SizedBox(height: 10,),
                SimpleTextWidget(text: widget.targetUser.interest, fontSize: 17,),
                const SizedBox(height: 10,),
                Container(
                  height: 50,
                  width: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      width: 1,
                      color: AppColor.primaryColor
                    )
                  ),
                  child: CupertinoButton(
                    child:const Center(child: Text("Chat")),
                    onPressed: ()async{
                      ChatRoomModel? chatroomModel =  await homeController.getChatroomModel(widget.targetUser);
                      if(chatroomModel != null){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> ChatScreen(
                            targetUser: widget.targetUser,
                            chatroom: chatroomModel,
                            userModel: widget.userModel,
                            firebaseUser: widget.firebaseUser
                        )));
                      }
                    },

                  ),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}
