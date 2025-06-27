

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../colors/app_colors.dart';

class RoundButton extends StatelessWidget {

  const RoundButton({
    Key?key,
    this.buttonColor = AppColors.primaryButtonColor,
    this.textColor = AppColors.primaryTextColor,
    required this.title,
    required this.onPress,
    this.width = 100,
    this.height = 50,
    this.loading = false,
}):super(key: key);

  final bool loading;
  final String title;
  final double height,width;
  final VoidCallback onPress;
  final Color textColor,buttonColor;
  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.only(left: 10,right: 10),
      child: InkWell(
        onTap: onPress,
        child: Container(
          height: height,
          decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(50),
          ),

          child: loading?
          Center(child: CircularProgressIndicator()):
          Center(child: Text(title)),
        ),
      ),
    );
  }
}
