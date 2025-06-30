import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../res/components/round_button.dart';
import '../../../view_models/controller/login_view_models.dart';
class LoginButton extends StatelessWidget {
  final formkey;
  LoginButton({super.key,required this.formkey});

  final loginVM = Get.put(LoginViewModels());

  @override
  Widget build(BuildContext context) {
    return Obx(()=>RoundButton(title: 'Login'.tr,
        loading: loginVM.loading.value,
        onPress: (){
          if(formkey.currentState!.validate()){

          };
        }),);
  }
}
