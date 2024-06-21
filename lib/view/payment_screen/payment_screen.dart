import 'package:empowered_dating/view/payment_screen/widget/payment_card.dart';
import 'package:empowered_dating/widgets/button_widget.dart';
import 'package:empowered_dating/widgets/simple_text.dart';
import 'package:empowered_dating/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(left: 30,right: 30),
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage('assets/create_profile_background.png'),
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height:100 ,),
            TextWidget(text: 'Premium\nAccess',fontSize: 40,),
            const SizedBox(height: 5,),
            SimpleTextWidget(text: 'Lorem lpsum is simply dummy text of the printing and\nttpesetting industry. Lorem lpsum is simply dummy\ntext of the printing and typesetting industry.'),
            const SizedBox(height: 20,),
             PaymentCard(),
            const SizedBox(height: 13,),
             PaymentCard(),
            const SizedBox(height: 13,),
             PaymentCard(),
               SizedBox(height: 100,),

               ButtonWidget(text: 'Subscribe', onPressed: (){

                             }),


          ],
        ),
      ),
    );
  }
}
