import 'package:empowered_dating/controller/home_controller.dart';
import 'package:empowered_dating/models/chat_room_model.dart';
import 'package:empowered_dating/models/user_model.dart';
import 'package:empowered_dating/utils/constant_images.dart';
import 'package:empowered_dating/view/chat_screens/chat_screen.dart';
import 'package:empowered_dating/view/details_screen.dart';
import 'package:empowered_dating/view/home_screen/widget/home_card.dart';
import 'package:empowered_dating/view/home_screen/widget/near_you_card.dart';
import 'package:empowered_dating/widgets/simple_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constant_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  final HomeScreenController homeController = Get.put(HomeScreenController());



  @override
  Widget build(BuildContext context) {

    User? currentUser = homeController.getCurrentUser();

    return Scaffold(

      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: SimpleTextWidget(
          text: 'Home',
          fontSize: 16,
        ),
        centerTitle: true,
        actions: const [
          Icon(
            CupertinoIcons.bell,
            color: AppColor.customIconColor,
          ),
          Padding(
              padding: EdgeInsets.only(right: 10, left: 5),
              child: Icon(
                Icons.menu,
                color: AppColor.customIconColor,
              ))
        ],
      ),
      body: Container(
        //padding: const EdgeInsets.only(left: 30),
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(ConstantImages.customBgImg),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: Get.height / 6,
            ),
            const Padding(
              padding: EdgeInsets.only(right: 20,left: 20),
              child: Row(
                children: [
                  Text(
                    'New Matches',
                    style: TextStyle(fontSize: 14, color:AppColor.gray5E),
                  ),
                  Spacer(),
                  Text(
                    'See All',
                    style: TextStyle(fontSize: 12, color: AppColor.primaryColor),
                  ),
                  Icon(
                    Icons.arrow_forward,
                    weight: 2,
                    color: AppColor.primaryColor,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 100,
              width: double.infinity,
              child: StreamBuilder<List <UserModel>>(
                stream: homeController.getUsersStream(),
                builder: (context , snapshot){
                  if(snapshot.connectionState == ConnectionState.active){
                    if(snapshot.hasData){
                      List<UserModel> users = snapshot.data!;
                      users.removeWhere((user) => user.uid == currentUser?.uid);
                      return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: users.length,
                          itemBuilder: (context , index){
                            UserModel user = users[index];
                            return Padding(
                              padding: const EdgeInsets.only(right: 5,left: 5),
                              child: CircleAvatar(
                                radius: 40,
                                backgroundImage: NetworkImage(user.profileImageUrl),
                              ),
                            );
                          });
                    }
                    else if(snapshot.hasError){
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    }
                    else
                      {
                        return const Center(
                          child: Text("No Chats "),
                        );
                      }
                  }
                  else{
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                },
              ),
            ),

            const Padding(
              padding: EdgeInsets.only(top: 20, bottom: 20,left: 20),
              child: Text(
                'Near You',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff421421)),
              ),
            ),
            SizedBox(
              height: 210,
              width: double.infinity,
              child: StreamBuilder<List <UserModel>>(
                stream: homeController.getUsersStream(),
                builder: (context , snapshot){
                  if(snapshot.connectionState == ConnectionState.active){
                  if(snapshot.hasData){
                    List<UserModel> users = snapshot.data!;
                    users.removeWhere((user) => user.uid == currentUser?.uid);
                    return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: users.length,
                        itemBuilder: (context ,index){
                          UserModel user = users[index];
                          return NearYouCard(imageUri: user.profileImageUrl, distance: '0.5 km', title: user.name, subTitle: user.job);
                        });
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
                  else{
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 20, bottom: 20,left: 20,right: 20),
              child: Row(
                children: [
                  Text(
                    'Recent Partner',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff421421)),
                  ),
                  Spacer(),
                  Text(
                    'See All',
                    style: TextStyle(
                        fontSize: 12,
                        color: Color(0xffC4C4C4),
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
            Expanded(
              child: StreamBuilder<List <UserModel>>(
                stream: homeController.getUsersStream(),
                builder: (context , snapshot){
                  if(snapshot.connectionState == ConnectionState.active)
                    {
                      if(snapshot.hasData){
                        List<UserModel> users = snapshot.data!;
                        users.removeWhere((user) => user.uid == currentUser?.uid);
                        return ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: users.length,
                            itemBuilder: (context , index){
                              UserModel user = users[index];
                              return Padding(
                                padding:  const EdgeInsets.only(bottom: 10,right: 30,left: 20),
                                child: InkWell(
                                  onTap: ()async{

                                      Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailsScreen(
                                        targetUser: users[index],
                                        userModel: homeController.currentUser.value,
                                        firebaseUser: currentUser,
                                      )
                                      )
                                      );


                                  },
                                  child: HomeCard(title: user.name, subTitle: user.location, imageUri: user.profileImageUrl),
                                ),
                              );

                            });
                      }
                      else if(snapshot.hasError){
                        return Center(
                          child: Text(snapshot.error.toString()),
                        );
                      }
                      else
                        {
                          return const Center(
                            child: Text("No Chats "),
                          );
                        }
                    }
                  else
                    {
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
    );
  }
}
