import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:work_space/style/AppColors.dart';
import 'package:work_space/style/AssetsManager.dart';
import 'package:work_space/style/units.dart';

void showSuccessDialog({
  required BuildContext context,
  required String successMessage,
}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => Center(
      child: Container(
        padding:  EdgeInsets.all(10),
        margin:  EdgeInsets.symmetric(
          horizontal: 20,
        ),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
             Align(
              alignment: Alignment.topRight,
              child: CloseButton(),),
             SizedBox(height: 5),
            Lottie.asset(
              AssetsManger.successCheck,
              width: Units.getWidth(
                context: context,
                widgetwidth: 160,
              ),
              height: Units.getHeight(
                context: context,
                widgetheight: 160,),),
             SizedBox(height: 10),
            Text(
              successMessage,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black),
            ),
             SizedBox(height: 10),
          ],
        ),
      ),
    ),
  );
}
