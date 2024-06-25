import 'package:empowered_dating/view/chat_screens/chat_screen.dart';
import 'package:empowered_dating/view/select_chat_screen/widget/chat_card.dart';
import 'package:empowered_dating/widgets/profile_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
          text: 'Chat',
          fontSize: 16,
        ),
        centerTitle: true,
        actions: const [
          Padding(
              padding: EdgeInsets.only(right: 10, left: 5),
              child: Icon(
                Icons.delete_outline,
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 20),
                child: Container(
                  color: Colors.white,
                    child: ProfileTextFieldWidget(text: 'Search Messages', controller: _searchController, keyboardType: TextInputType.text, prefixIcon: Icons.search_outlined, prefixIconColor: const Color(0xffACACAC),radius: 0,)),
              ),
              const Padding(
                padding: EdgeInsets.only(right: 20,left: 20),
                child: Row(
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
                child: Text('Messages', style: TextStyle(fontSize: 14, color: Color(0xff5E5E5E)),),
              ),
              const SizedBox(height: 20,),
              Expanded(
                  child: ListView.builder(
                    itemCount: titles.length,
                      itemBuilder: (context , index){
                    return InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> ChatScreen()));
                      },
                      child: Padding(
                          padding: const EdgeInsets.only( bottom: 10),
                          child: ChatCard(imageUri: images[index], title: titles[index], subTitle: subTitle[index])),
                    );
                  }),
              )

            ],
          ),
        ),
      ),
    );
  }
}
