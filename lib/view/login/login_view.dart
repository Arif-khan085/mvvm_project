import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_project/view/login/widgets/input_email.dart';
import 'package:getx_mvvm_project/view/login/widgets/login_button.dart';
import 'package:getx_mvvm_project/view/login/widgets/login_password.dart';

import '../../view_models/controller/login_view_models.dart';

class LoginView extends StatefulWidget {
  LoginView({super.key});
  final loginVM = Get.put(LoginViewModels());

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {

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
                  InputEmail(),
                  SizedBox(height: 20,),
                  LoginPassword(),
                ],
              ),
            ),
            SizedBox(height: 10,),
            LoginButton(formkey: _formkey,),

          ],
        ),
      ),
    );
  }
}
