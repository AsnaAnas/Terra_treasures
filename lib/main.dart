import 'package:flutter/material.dart';
import 'package:terra_treasures/modules/user_module/home_page.dart';
import 'package:terra_treasures/modules/user_module/login_screen.dart';
import 'package:terra_treasures/modules/user_module/onboard.dart';
import 'package:terra_treasures/modules/user_module/onboarding_screen.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage()
    );
  }
}



