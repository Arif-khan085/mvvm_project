
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../utils/utils.dart';
import '../../../view_models/controller/login_view_models.dart';

class InputEmail extends StatelessWidget {
  InputEmail({super.key});
  final loginVM = Get.put(LoginViewModels());

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      controller: loginVM.emailController.value,
      focusNode: loginVM.emailFocusNode.value,
      validator: (value){
        if(value!.isEmpty){
          Utils.snakBar('!!! Email', 'Please Enter Email');
        }
      },
      onFieldSubmitted: (value){
        Utils.fieldFocusChange(context, loginVM.emailFocusNode.value, loginVM.emailFocusNode.value);
      },

      decoration: InputDecoration(
          hintText: 'login'.tr,
          border: OutlineInputBorder()
      ),
    );
  }
}
