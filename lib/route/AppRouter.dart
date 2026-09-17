import 'package:go_router/go_router.dart';
import 'package:work_space/Home/HomeContent.dart';
import 'package:work_space/Home/welcomeView.dart';
import 'package:work_space/customs/TaskItem.dart';
import 'package:work_space/logins/login.dart';
import 'package:work_space/logins/signup.dart';
import 'package:work_space/navigators/CalendarPage.dart';
import 'package:work_space/navigators/ProfilePage.dart';
import 'package:work_space/navigators/HistoryPage.dart';
import 'package:work_space/route/routes.dart';
import 'package:work_space/views/onboardingTwo.dart';
import 'package:work_space/views/splash_screen.dart';
import 'package:work_space/views/onboardingView.dart';
class AppRouter{
  static final GoRouter router=GoRouter(
    routes: route,);
  static final List<GoRoute> route=[
    GoRoute(path: Routes.splashScreen,
      builder: ((context,state)=>  SplashScreen()),
    ),
    GoRoute(path: Routes.onboardingView,
    builder: ((context,state)=>  Onboardingview()),),
    GoRoute(
      path: Routes.onboardingTwo,
      builder: (context, state) =>  OnboardingTwo(),
    ),
    GoRoute(
      path: Routes.welcomeView,
      builder: (context, state) =>  Welcomeview(),
    ),
    GoRoute(
      path: Routes.signupView,
      builder: (context, state) =>  Signupview(),
    ),
    GoRoute(
      path: Routes.loginView,
      builder: (context, state) =>  Loginview(),
    ),
    GoRoute(
      path: Routes.homeContent,
      builder: (context, state) =>  HomeContent(),
    ),

    GoRoute(
      path: Routes.calendar,
      builder: (context, state) =>  CalendarPage(),
    ),

    GoRoute(
      path: Routes.profile,
      builder: (context, state) =>  Profilepage(),
    ),

    GoRoute(
      path: Routes.history,
      builder: (context, state) =>  Historypage(),
    ),

  ];

}
