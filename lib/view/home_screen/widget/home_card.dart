import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {
  HomeCard({super.key, required this.title,required this.subTitle, required this.imageUri});

  String title ;
  String subTitle;
  String imageUri;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.maxFinite,
      padding: EdgeInsets.all(7),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,

      ),
      child: ListTile(
        leading: Container(
          height: 80,
          width: 61,
          decoration:  BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(imageUri),
            ),
          ),
        ),
        title: Text(title,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500),),
        subtitle: Row(
          children: [
            Icon(Icons.location_on_outlined, color: Color(0xffC4C4C4),),
            Text(subTitle,style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400, color: Color(0xff999999)),)
          ],
        ),
        trailing: Icon(CupertinoIcons.heart_fill, color: Colors.grey,),
    ),
    );
  }
}
