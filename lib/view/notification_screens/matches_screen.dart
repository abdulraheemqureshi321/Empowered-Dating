import 'package:empowered_dating/utils/constant_images.dart';
import 'package:empowered_dating/view/notification_screens/widget/match_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/constant_colors.dart';
import '../../widgets/profile_text_field.dart';
import '../../widgets/simple_text.dart';

class MatchesScreen extends StatefulWidget {
  const MatchesScreen({super.key});

  @override
  State<MatchesScreen> createState() => _MatchesScreenState();
}

class _MatchesScreenState extends State<MatchesScreen> {

  List<String> images = ['assets/1.png','assets/2.png','assets/3.png','assets/4.png','assets/5.png','assets/6.png','assets/1.png','assets/2.png','assets/3.png','assets/4.png','assets/5.png','assets/6.png'];
  List<String> title = ['indira, 23','Ranni, 21','Mauren, 22','indira, 23','Ranni, 21','Mauren, 22','indira, 23','Ranni, 21','Mauren, 22','indira, 23','Ranni, 21','Mauren, 22'];
  List<String> subtitle = ['Fashion Designer','Nurse','Cashier','Teller','Fashion Designer','Nurse','Cashier','Teller','Fashion Designer','Nurse','Cashier','Teller',];

  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: SimpleTextWidget(
            text: 'Matches',
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
        body:Container(
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
             children: [
               Padding(
                 padding: const EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 20),
                 child: Container(
                     color: Colors.white,
                     child: ProfileTextFieldWidget(text: 'Search Messages', controller: _searchController, keyboardType: TextInputType.text, prefixIcon: Icons.search_outlined,prefixIconColor: AppColor.grayAC,radius: 10,)),
               ),
                Expanded(
                    child: ListView.builder(
                      itemCount: title.length,
                        itemBuilder: (context ,index){
                  return MatchCard(title: title[index],subTitle: subtitle[index],imageUri: images[index],);

                }))
             ],
            ),
          ),
        )
    );
  }
}
