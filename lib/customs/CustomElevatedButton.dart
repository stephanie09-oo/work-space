import 'package:flutter/material.dart';
import 'package:work_space/style/AppColors.dart';
import 'package:work_space/style/units.dart';


class Customelevatedbutton extends StatelessWidget {
  final String buttonTitle;
  final double? fontSize;
  final Color? btnColor;
  final VoidCallback onpressed;
  final Widget? customContent;
  final double? width;
  final double? height;
  final Color? textColor;

  const Customelevatedbutton({super.key, required this.buttonTitle,
    this.fontSize, this.btnColor,
    required this.onpressed, this.customContent, this.width, this.height, this.textColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Units.getHeight(context: context, widgetheight:height ?? 54),
      width: Units.getWidth(context: context, widgetwidth:width?? 320),
      child: ElevatedButton(onPressed: onpressed,
          style:ElevatedButton.styleFrom(
            backgroundColor: btnColor??AppColors.PrimaryColor,
            shape: ContinuousRectangleBorder(borderRadius: BorderRadiusGeometry.circular(20)),
          ) , child: customContent ?? Text(buttonTitle,
            style: TextStyle(color: textColor??AppColors.BackGroundColor,
           fontSize: 17 ),)),
    );
  }
}
