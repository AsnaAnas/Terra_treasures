import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:terra_treasures/auth/login_screen.dart';
import 'package:terra_treasures/modules/user_module/screens/home.dart';
import 'package:terra_treasures/modules/user_module/screens/welcome.dart';

class SplashScreen extends StatefulWidget {
  
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  void initState() {
    super.initState();
    // Set a delay for the splash screen, after which navigate to the next screen
    Timer(const Duration(seconds: 2), () {
      // Navigate to the desired screen after the splash screen delay
       Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  WelcomeScreen()),
              );
    });
  }

  // check(BuildContext context)async{
  //   SharedPreferences preferences=await SharedPreferences.getInstance();
  //   String? name=preferences.getString('isloggin');

  //   if(name!=null)
  //   {
  //      Navigator.push(context,MaterialPageRoute(builder: (context) =>  HomeScreen()) );
  //   }
  //   else
  //   {
  //     Navigator.push(context,MaterialPageRoute(builder: (context) =>  LoginScreen()) );
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body: Center(
        child: Image.asset("assets/logo.png"),
      ),
    );
  }
}