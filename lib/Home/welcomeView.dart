import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:work_space/customs/CustomElevatedButton.dart';
import 'package:work_space/style/AppColors.dart';
import 'package:work_space/style/AssetsManager.dart';
import 'package:go_router/go_router.dart';
import 'package:work_space/route/routes.dart';
import 'package:work_space/style/units.dart';


class Welcomeview extends StatelessWidget {
  const Welcomeview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Padding(
        padding:  EdgeInsets.only(top: Units.getHeight(context: context, widgetheight: 80),
            bottom: Units.getHeight(context: context, widgetheight: 55),),
        child: Column(
          children: [
            Text('Welcome to WorkSpace',style: TextStyle(fontWeight: FontWeight.bold
            ,fontSize: 30,color: AppColors.PrimaryColor),),
            SizedBox(
              height: Units.getHeight(context: context, widgetheight: 55),),
            Center(child: Image.asset(AssetsManger.welcomeviewImage)),
            SizedBox(
              height: Units.getHeight(context: context, widgetheight: 55),),
            Customelevatedbutton(buttonTitle: 'Continue with email', onpressed: (){
              context.push(Routes.signupView);
            },
              customContent: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    AssetsManger.emailIcon,
                    width: 18,
                    height: 18,
                  ),
                   SizedBox(width: 8),
                   Text(
                    'Continue with email',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
          ),
             SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Customelevatedbutton(
                  buttonTitle: 'Facebook',
                  width: 150,
                  height: 48,
                  btnColor:  Color(0xffF5F6F8),
                  onpressed: () {
                  },
                  customContent: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        AssetsManger.facebookIcon,
                        width: 18,
                        height: 18,
                      ),
                     SizedBox(width: 8),
                       Text(
                        'Facebook',
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                 SizedBox(width: 12),
                Customelevatedbutton(
                  buttonTitle: 'Google',
                  width: 150,
                  height: 48,
                  btnColor:  Color(0xffF5F6F8),
                  onpressed: () {
                  },
                  customContent: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        AssetsManger.googleIcon,
                        width: 18,
                        height: 18,
                      ),
                      SizedBox(width: 8),
                       Text(
                        'Google',
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),

    );
  }

}
