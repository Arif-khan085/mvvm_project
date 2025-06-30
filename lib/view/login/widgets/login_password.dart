

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/utils.dart';
import '../../../view_models/controller/login_view_models.dart';

class LoginPassword extends StatelessWidget {
  LoginPassword({super.key});

  final loginVM = Get.put(LoginViewModels());



  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.text,
      controller: loginVM.passwordController.value,
      focusNode: loginVM.passwordFocusNode.value,
      obscureText: true,
      obscuringCharacter: '*',

      validator: (value){
        if(value!.isEmpty){
          Utils.snakBar('!!! Password', 'Please Enter Password');
        }
      },
      onFieldSubmitted: (value){
      },

      decoration: InputDecoration(
          suffixIcon: Icon(Icons.remove_red_eye),
          hintText: 'password_hint'.tr,
          border: OutlineInputBorder()
      ),
    );
  }
}
