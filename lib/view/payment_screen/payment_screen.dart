import 'package:empowered_dating/utils/constant_images.dart';
import 'package:empowered_dating/view/payment_screen/widget/payment_card.dart';
import 'package:empowered_dating/widgets/button_widget.dart';
import 'package:empowered_dating/widgets/simple_text.dart';
import 'package:empowered_dating/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/payment_controller.dart';
import '../bottom_navigation.dart';


class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {

  final PaymentController _controller = Get.put(PaymentController());

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(left: 30,right: 30),
        height: double.maxFinite,
        width: double.maxFinite,
        decoration:  BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(ConstantImages.customBgImg),
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height:100 ,),
            TextWidget(text: 'Premium\nAccess',fontSize: 40,),
            const SizedBox(height: 5,),
            SimpleTextWidget(text: 'Lorem lpsum is simply dummy text of the printing and\nttpesetting industry. Lorem lpsum is simply dummy\ntext of the printing and typesetting industry.'),
            const SizedBox(height: 20,),
             Obx(()=>PaymentCard(
               value: _controller.selectedContainerIndex.value == 0,
               onChanged: (value) {
                 _controller.toggleContainer(0);
               },
             ),),
             const SizedBox(height: 13,),

            Obx(()=>PaymentCard(
              value: _controller.selectedContainerIndex.value == 1,
              onChanged: (value) {
                _controller.toggleContainer(1);
              },
            ),),
            const SizedBox(height: 13,),
            Obx(()=>PaymentCard(
              value: _controller.selectedContainerIndex.value == 2,
              onChanged: (value) {
                _controller.toggleContainer(2);
              },
            ),),
               const SizedBox(height: 100,),

               ButtonWidget(text: 'Subscribe', onPressed: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context)=> const BottomNavigation()));
               }),
          ],
        ),
      ),
    );
  }
}
