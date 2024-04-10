import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:terra_treasures/firebase_options.dart';
import 'package:terra_treasures/modules/user_module/home.dart';
import 'package:terra_treasures/modules/user_module/home_page.dart';
import 'package:terra_treasures/modules/user_module/login_screen.dart';

import 'package:terra_treasures/modules/user_module/onboarding_screen.dart';
import 'package:terra_treasures/modules/user_module/welcome.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
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
      home: const HomeScreen()
    );
  }
}



