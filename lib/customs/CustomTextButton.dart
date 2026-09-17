 import 'package:flutter/material.dart';
import 'package:work_space/style/AppColors.dart';

class Customtextbutton extends StatelessWidget {
  final String buttonTitle;
  final double? fontSize;
  final Color? btnColor;
  final VoidCallback onpressed;
  const Customtextbutton({super.key, required this.buttonTitle, this.fontSize, this.btnColor, required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: onpressed, child: Text(buttonTitle,
      style:TextStyle(color: btnColor??AppColors.darkColor,
          fontSize:fontSize,fontWeight: FontWeight.bold),));
  }
}
