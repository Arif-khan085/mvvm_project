

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_project/res/colors/app_colors.dart';
class generalExceptionWidget extends StatefulWidget {
  final VoidCallback onPress;
  const generalExceptionWidget({super.key , required this.onPress});

  @override
  State<generalExceptionWidget> createState() => _generalExceptionWidgetState();
}

class _generalExceptionWidgetState extends State<generalExceptionWidget> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Icon(Icons.cloud_off,color: AppColors.redColor,size: 50,),
          Center(child: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Text('internet_exception'.tr),
          )),
          SizedBox(height: height * .15,),
          InkWell(
            onTap: widget.onPress,
            child: Container(
              height: 44,
              width: 160,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(child: Text('Retry')),
            ),
          )
        ],
      ),
    );
  }
}
