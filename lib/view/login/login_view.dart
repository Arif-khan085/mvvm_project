import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_project/res/components/round_button.dart';
import 'package:getx_mvvm_project/utils/utils.dart';

import '../../view_models/controller/login_view_models.dart';
class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {

    final loginVM = Get.put(LoginViewModels());
    final _formkey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
            'login'.tr,style: TextStyle(color: Colors.white,fontSize: 30),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Form(
              key: _formkey,
              child: Column(
                children: [
                  TextFormField(
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
                  ),
                  SizedBox(height: 20,),
                  TextFormField(
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
                  ),
                ],
              ),
            ),

            SizedBox(height: 10,),
            Obx(()=>RoundButton(title: 'Login'.tr,
                loading: loginVM.loading.value,
                onPress: (){
                  if(_formkey.currentState!.validate()){

                  };
                }),)
          ],
        ),
      ),
    );
  }
}
