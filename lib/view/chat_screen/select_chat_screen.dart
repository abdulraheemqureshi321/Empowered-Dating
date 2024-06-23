import 'package:empowered_dating/view/chat_screen/widget/chat_card.dart';
import 'package:empowered_dating/widgets/profile_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
    List<String> titles = ['Patrica','Lyana','Merry','Merry','Merry','Patrica','Lyana','Merry','Merry','Merry'];
    List<String> subTitle = ['Lorem lpsum is simply','Lorem lpsum is simply','Lorem lpsum is simply','Lorem lpsum is simply','Lorem lpsum is simply','Lorem lpsum is simply','Lorem lpsum is simply','Lorem lpsum is simply','Lorem lpsum is simply','Lorem lpsum is simply'];

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: SimpleTextWidget(
          text: 'Matches',
          fontSize: 16,
        ),
        centerTitle: true,
        actions: [
          const Icon(
            CupertinoIcons.bell,
            color: Color(0xffFDB813),
          ),
          const Padding(
              padding: EdgeInsets.only(right: 10, left: 5),
              child: Icon(
                Icons.menu,
                color: Color(0xffFDB813),
              ))
        ],
      ),
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage('assets/background.png'),
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 20),
                  child: Container(
                    color: Colors.white,
                      child: ProfileTextFieldWidget(text: 'Search Messages', controller: _searchController, keyboardType: TextInputType.text, prefixIcon: Icons.search_outlined, prefixIconColor: Color(0xffACACAC),radius: 0,)),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20,left: 20),
                  child: const Row(
                    children: [
                      Text(
                        'New Matches',
                        style: TextStyle(fontSize: 14, color: Color(0xff5E5E5E)),
                      ),
                      Spacer(),
                      Text(
                        'See All',
                        style: TextStyle(fontSize: 12, color: Color(0xff934C93)),
                      ),
                      Icon(
                        Icons.arrow_forward,
                        weight: 2,
                        color: Color(0xff934C93),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      for (int i = 0; i < images.length; i++)
                        Padding(
                          padding: EdgeInsets.only(right: 5),
                          child: CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage(images[i]),
                          ),
                        ),
                    ],
                  ),
                ),

                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text('Messages', style: TextStyle(fontSize: 14, color: Color(0xff5E5E5E)),),
                ),
                SizedBox(height: 20,),
                for(int i = 0; i < images.length; i++)
                Padding(
                  padding: EdgeInsets.only( bottom: 10),
                    child: ChatCard(imageUri: images[i], title: titles[i], subTitle: subTitle[i]))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
