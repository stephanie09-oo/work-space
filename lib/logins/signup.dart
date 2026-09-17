import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:work_space/customs/CustomElevatedButton.dart';
import 'package:work_space/route/routes.dart';
import 'package:work_space/services/AuthServic.dart';
import 'package:work_space/style/AppColors.dart';
import 'package:work_space/style/units.dart';

class Signupview extends StatefulWidget {
  const Signupview({super.key});

  @override
  State<Signupview> createState() => _SignupviewState();
}

class _SignupviewState extends State<Signupview> {
  bool isPasswordVisible = false;
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  AuthService authService = AuthService();

  @override
  void dispose() {
    usernameController.dispose();
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
          'Create account',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
          ),
        ),
        SizedBox(
          height: Units.getHeight(context: context, widgetheight: 10),
        ),
        Center(
          child: Text(
            'Create your account and feel the benefits',
            style: TextStyle(fontSize: 13, color: Colors.black38),
          ),),
        SizedBox(
          height: Units.getHeight(context: context, widgetheight: 45),
        ),
        Text(
          'Username',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 8),
        TextField(
          controller: usernameController,
          decoration: InputDecoration(
            hintText: 'Enter your username',
            hintStyle: TextStyle(color: Colors.black26),
            filled: true,
            fillColor: Color(0xffF5F6F8),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide.none,),),),
              SizedBox(
                height: Units.getHeight(context: context, widgetheight: 25),),
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
                height: Units.getHeight(context: context, widgetheight: 25),),
        Text(
          'Password',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),),
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
              ),),),),
        Spacer(),
        Customelevatedbutton(
          buttonTitle: 'Sign Up',
          onpressed: () async {
            try {
              final user = await authService.signUp(
                email: emailController.text.trim(),
                password: passwordController.text.trim(),
              );
              if (user != null) {
                showDialog(context: context, builder: (context) {
                  return AlertDialog(title: Text('Success'),
                      content: Text('Account created successfully'),
                      actions: [ TextButton( onPressed: ()
                  {
                    Navigator.pop(context);
                    context.push(Routes.loginView);
                  }, child: Text('OK'),)
                  ]
                  );
                },
                );
              }
            } catch (e) {
              showDialog(context: context, builder: (context) {
                return AlertDialog(
                  title: Text('Error'),
                  content: Text('Sign up failed'),
                  actions: [ TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    }, child: Text('OK'),),
                  ],);
              },);
            }
          },
        ),
      ],),));
    }
}


