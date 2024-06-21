import 'package:flutter/material.dart';

class PaymentCard extends StatefulWidget {


  PaymentCard({super.key,

   });


  @override
  State<PaymentCard> createState() => _PaymentCardState();
}

class _PaymentCardState extends State<PaymentCard> {

  @override
  Widget build(BuildContext context) {
    bool isChecked = false;

    return Material(
      elevation: 8.0,
      borderRadius: BorderRadius.circular(27),
      //shadowColor: Color(),
      child: Container(
        height: 120,
        width: double.maxFinite,
        decoration: BoxDecoration(
            color: isChecked ? Color(0xff934C93) : Color(0xffF0F0F0),
            borderRadius: BorderRadius.circular(27)
        ),
        child: Padding(
          padding:  EdgeInsets.only(left: 30,top: 5,),
          child: ListTile(
            title:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Weekly', style: TextStyle( fontSize: 24, fontWeight: FontWeight.w400),),
                Text('Standard Offer',style: TextStyle( fontSize: 14, fontWeight: FontWeight.w400)),
                Text('\$100.00 per week',style: TextStyle( fontSize: 18, fontWeight: FontWeight.w500, color: Color(0xffFDB813)))
              ],
            ),


          ),
        ),
      ),
    );
  }
}
