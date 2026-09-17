import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:work_space/customs/CustomElevatedButton.dart';
import 'package:work_space/services/AuthServic.dart';

import 'package:work_space/style/AppColors.dart';
import 'package:work_space/style/units.dart';
import 'package:work_space/route/routes.dart';

class Loginview extends StatefulWidget {
  const Loginview({super.key});

  @override
  State<Loginview> createState() => _LoginviewState();
}

class _LoginviewState extends State<Loginview> {
  bool isPasswordVisible = false;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  AuthService authService = AuthService();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Padding(
        padding: EdgeInsets.only(
          top: Units.getHeight(context: context, widgetheight: 80),
          left: 25,
          right: 25,
          bottom: 40,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        Center(
        child: Text(
        'Welcome Back!',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
        ),
      ),
      SizedBox(
        height: Units.getHeight(context: context, widgetheight: 10),
      ),
      Center(
        child: Text(
          'Your work fast and structured with Todyapp',
          style: TextStyle(fontSize: 13, color: Colors.black38),),),
      SizedBox(
        height: Units.getHeight(context: context, widgetheight: 55),),
      Text(
        'Email Address',
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
      ),
      SizedBox(height: 8),
      TextField(
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          hintText: 'name@example.com',
          hintStyle: TextStyle(color: Colors.black26),
          filled: true,
          fillColor: Color(0xffF5F6F8),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: BorderSide.none,
          ),
        ),
      ),
      SizedBox(
        height: Units.getHeight(context: context, widgetheight: 25),
      ),
      Text(
        'Password',
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
      ),
      SizedBox(height: 8),
      TextField(
        controller: passwordController,
        obscureText: !isPasswordVisible,
        decoration: InputDecoration(
          hintText: 'Enter your password',
          hintStyle: TextStyle(color: Colors.black26),
          filled: true,
          fillColor: Color(0xffF5F6F8),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: BorderSide.none,
          ),
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                isPasswordVisible = !isPasswordVisible;
              });
            },
            icon: Icon(
              isPasswordVisible
                  ? Icons.visibility
                  : Icons.visibility_off_outlined,
              color: Colors.black38,
            ),
          ),
        ),
      ),
      Spacer(),
      Customelevatedbutton(
        buttonTitle: 'Login',
        onpressed: () async {
          try {
            final user = await authService.login(
              email: emailController.text.trim(),
              password: passwordController.text.trim(),
            );
            if (user != null) {
              showDialog(context: context, builder: (context) {
                return AlertDialog(title: Text('Success'),
                  content: Text('Login successful'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        context.push(Routes.homeContent);
                      },
                      child: Text('OK'),
                    ),
                  ],
                );
              }
              );
            }
          }
          catch (e) {
            showDialog(context: context, builder: (context) {
              return AlertDialog(
                title: Text('Error'),
                content: Text('Login failed'),
                actions: [ TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  }, child: Text('OK'),),
                ],);
            },);
          }
        },
      ),],),)
      );
  }
}


