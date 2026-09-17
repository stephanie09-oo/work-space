import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:work_space/customs/CustomElevatedButton.dart';
import 'package:work_space/customs/CustomTextButton.dart';
import 'package:work_space/route/routes.dart';
import 'package:work_space/style/AppColors.dart';
import 'package:work_space/style/AssetsManager.dart';
import 'package:work_space/style/units.dart';



class Onboardingview extends StatefulWidget {
  const Onboardingview({super.key});

  @override
  State<Onboardingview> createState() => _OnboardingviewState();
}

class _OnboardingviewState extends State<Onboardingview> {
  late PageController _controller;

  @override
  void initState(){
    _controller=PageController();
    super.initState();
  }

  void dispose(){
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Padding(
        padding:  EdgeInsets.only(top:Units.getHeight(context: context, widgetheight: 70)),
        child: Column(
          children: [
            Container(
              alignment: AlignmentDirectional.topEnd,
              child: Customtextbutton(buttonTitle: 'Skip',fontSize: 18, onpressed:(){})
            ),
            SizedBox(height: Units.getHeight(context: context, widgetheight: 55),),
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Image.asset(AssetsManger.OnboardingviewImage),
                Container(
                  height: Units.getHeight(context: context, widgetheight: 200),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                      AppColors.whiteColor,
                      AppColors.whiteColor,
                      AppColors.whiteColor.withAlpha(0),
                    ])
                  ),
                ),
                Center(
                  child: Text('Your convenience in\n making a todo list',
                    style:TextStyle(color: Colors.black,
                    fontSize: 24,fontWeight: FontWeight.bold) ,),
                ),
              ],
            ),
            SizedBox(height: 20,),
            Center(child: Text('Heres a mobile platform that helps you create'
             ' task  \n       or to list so that '
                '  it can help you in every \n                   '
                '      job easier and faster.',
              style: TextStyle(fontSize: 17,color: Colors.black26),)),
             SizedBox(height:  Units.getHeight(context: context, widgetheight: 30),),
             SmoothPageIndicator(controller: _controller, count: 4,
               effect: WormEffect(
               activeDotColor: AppColors.PrimaryColor,
               dotColor: AppColors.LineColor,
               dotHeight:10,
               dotWidth: 10,
               spacing: 6,
             ),),
            SizedBox(height:  Units.getHeight(context: context, widgetheight: 30),),
            Customelevatedbutton(buttonTitle: 'Continue', onpressed: (){
              GoToNextPage();
            },),
          ],
        ),
      ),
    );
  }
  void GoToNextPage(){
    context.push(Routes.onboardingTwo);
  }
}
