import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatCard extends StatelessWidget {
   ChatCard({super.key, required this.imageUri,required this.title,required this.subTitle});
  String title ;
  String subTitle;
  String imageUri;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(right: 7),
      height: 80,
      width: double.maxFinite,
     // padding: EdgeInsets.all(7),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,

      ),
      child: ListTile(
        titleAlignment: ListTileTitleAlignment.center,
        contentPadding: EdgeInsets.zero,
        leading: CircleAvatar(
          radius: 50,
          backgroundImage:  AssetImage(imageUri),
        ),
        title: Text(title,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500),),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text(subTitle,style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400, color: Color(0xff999999)),),
        ),
        trailing: Text('8:00 PM',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400, color: Color(0xff999999)),),

      ),
    );
  }
}
