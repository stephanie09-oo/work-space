import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:work_space/route/routes.dart';
import 'package:work_space/style/AppColors.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.PrimaryColor,
      unselectedItemColor: Colors.grey,
      onTap: (index) {
        if (index == 0) {
          context.go(Routes.homeContent);
        } else if (index == 1) {
          context.go(Routes.calendar);
        } else if (index == 2) {
          context.go(Routes.profile);
        } else if (index == 3) {
          context.go(Routes.history);
        }
      },
      items:  [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          activeIcon: Icon(Icons.home),
          label: 'Home',
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_month_outlined),
          activeIcon: Icon(Icons.calendar_month),
          label: 'Calendar',
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.person_2_outlined),
          activeIcon: Icon(Icons.person),
          label: 'Profile',
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.history_outlined),
          activeIcon: Icon(Icons.history),
          label: 'History',
        ),
      ],
    );
  }
}
