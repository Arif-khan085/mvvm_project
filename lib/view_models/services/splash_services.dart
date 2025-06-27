

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_project/res/routes/routes_name.dart';

class SplashServices{

  void isLogin(){


      Timer(Duration(seconds: 2),
              ()=>Get.toNamed(RoutesName.loginView));
    }

}