import 'package:empowered_dating/utils/constant_colors.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CustomToast{

  void toastMessage(String message){
    Fluttertoast.showToast(
        msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 1,
      backgroundColor: AppColor.primaryColor,
      textColor: AppColor.white,
      fontSize: 16,
    );
  }
}