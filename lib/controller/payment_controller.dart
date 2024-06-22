import 'package:get/get.dart';

class PaymentController extends GetxController{

  var selectedContainerIndex = (-1).obs;

  void toggleContainer(int index) {
    if (selectedContainerIndex.value == index) {
      selectedContainerIndex.value = -1;
    } else {
      selectedContainerIndex.value = index;
    }
  }
}