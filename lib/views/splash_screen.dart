import 'package:flutter/material.dart' ;
import 'package:work_space/route/routes.dart';
import '../style/AppColors.dart';
import 'package:go_router/go_router.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    routeToOnboarding(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.PrimaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                color: AppColors.BackGroundColor,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(
                Icons.checklist_rounded,
                color: AppColors.darkColor,
                size: 36,
              ),
            ),
            SizedBox(height: 16),
             Text(
              'ًWork Space ',
              style: TextStyle(
                color: AppColors.BackGroundColor,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
             SizedBox(height: 8),
             Text(
              'The best to do list application for you',
              style: TextStyle(
                color: AppColors.BackGroundColor,
                fontSize: 14,
                fontWeight: FontWeight.bold
              ),
            ),
             SizedBox(height: 80),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 24,
                  height: 8,
                  decoration: BoxDecoration(
                    color: AppColors.BackGroundColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              SizedBox(width: 6),
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: AppColors.BackGroundColor,
                    shape: BoxShape.circle,
                  ),
                ),
                 SizedBox(width: 6),
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: AppColors.BackGroundColor,
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void routeToOnboarding(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      if (context.mounted) {
        context.pushReplacement(Routes.onboardingView);
      }
    });
  }
}