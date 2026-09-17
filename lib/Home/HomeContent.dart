import 'package:flutter/material.dart';
import 'package:work_space/Home/HomePage.dart';
import 'package:work_space/customs/CustomAppBar.dart';
import 'package:work_space/customs/TaskForm.dart';
import 'package:work_space/navigators/HomeTab.dart';
import 'package:work_space/style/AppColors.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  int currentIndex = 0;

  Future<void> showTaskSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      isDismissible: false,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 15,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
               Align(
                alignment: Alignment.topRight,
                child: CloseButton(),
              ),
               TaskForm(),
            ],
          ),
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 150),
        child: CustomAppBar(),
      ),
      body: HomeTab(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.PrimaryColor,
        onPressed: () {
          showTaskSheet(context);
        },
        child: Icon(Icons.add,color: AppColors.whiteColor,),
      ),
      floatingActionButtonLocation:
      FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Homepage(),
    );
  }
}
