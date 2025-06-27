

import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:getx_mvvm_project/res/colors/app_colors.dart';

class Utils{

  static void fieldFocusChange(BuildContext context ,FocusNode current , FocusNode nextFocus){

    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static toastMessage(String message){
    Fluttertoast.showToast(
        msg: message,
      backgroundColor: AppColors.blackColor,
      gravity: ToastGravity.BOTTOM,
    );
  }

  static toastMessageCenter(String message){
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: AppColors.blackColor,
      gravity: ToastGravity.CENTER,
    );
  }

  static snakBar(String title,String message){
    Get.snackbar(
      title,
      message,
    );
  }

}