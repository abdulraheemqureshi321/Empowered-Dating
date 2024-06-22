import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class BottomNavigationController extends GetxController{
  var tabIndex = 0.obs;

  void changeTabIndex(int index){
    tabIndex.value = index;
    update();
  }
}