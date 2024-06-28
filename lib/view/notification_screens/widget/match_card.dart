import 'package:empowered_dating/utils/constant_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MatchCard extends StatelessWidget {
  MatchCard({super.key, required this.title,required this.subTitle,required this.imageUri});

  String title ;
  String subTitle;
  String imageUri;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.maxFinite,
      padding: const EdgeInsets.all(7),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.transparent,

      ),
      child: ListTile(
        leading: CircleAvatar(
          radius: 50,
          backgroundImage: AssetImage(imageUri),
        ),
        title: Text(title,style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w500, color: AppColor.gray5E),),
        subtitle: Text(subTitle,style: const TextStyle(fontSize: 12,fontWeight: FontWeight.w400, color:AppColor.grayAC),),
        trailing: Container(
          height: 30,
            width: 30,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColor.primaryColor
            ),
            child: const Icon(CupertinoIcons.heart, color: Colors.white,size: 17,)),
      ),
    );
  }
}
