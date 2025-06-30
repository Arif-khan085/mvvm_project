
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_project/repository/login_repository/login_repository.dart';
import 'package:getx_mvvm_project/utils/utils.dart';

class LoginViewModels extends GetxController{


  final _api = LoginRepository();


  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;

  RxBool loading =false.obs;

  void loginApi(){

    loading.value=true;

    Map data = {
      'email': emailController.value.text,
          'password':passwordController.value.text
    };
    _api.loginApi(data).then((value){
      loading.value=false;
      if(value['error']=='user not found '){
        Utils.snakBar('login', value['error']);
      }else{
        Utils.snakBar('login', 'Login Successfully');
      }

    }).onError((error,stackTrace){
      print(error.toString());
      loading.value=false;
      Utils.snakBar('!!! Error', error.toString());
    });


  }

}