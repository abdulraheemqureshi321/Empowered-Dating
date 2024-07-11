import 'package:empowered_dating/utils/constant_colors.dart';
import 'package:flutter/material.dart';

class PaymentCard extends StatelessWidget {
  const PaymentCard({super.key,required this.value,
    required this.onChanged,
    this.size = 24.0,});

  final bool value;
  final ValueChanged<bool> onChanged;
  final double size;

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap:(){
        onChanged(!value);
      },
      child :Material(
        elevation: 8.0,
        borderRadius: BorderRadius.circular(27),
        //shadowColor: Color(),
        child: Container(
          height: 120,
          width: double.maxFinite,
          decoration: BoxDecoration(
              color: value ? AppColor.primaryColor : const Color(0xffF0F0F0),
              borderRadius: BorderRadius.circular(27)
          ),
          child:  Padding(
            padding:  EdgeInsets.only(left: 30,top: 5,),
            child: ListTile(
              title:  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Weekly', style: TextStyle( fontSize: 24, fontWeight: FontWeight.w400,color: value ? Colors.white : AppColor.primaryColor,),),
                  Text('Standard Offer',style: TextStyle( fontSize: 14, fontWeight: FontWeight.w400,color:value ? Colors.white :AppColor.primaryColor ,)),
                  Text('\$100.00 per week',style: TextStyle( fontSize: 18, fontWeight: FontWeight.w500, color: AppColor.customIconColor))
                ],
              ),

              trailing: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.white
                ),
                child: value ? Icon(Icons.check, size: 35,color: AppColor.primaryColor,) : null,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
