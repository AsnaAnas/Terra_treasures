import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:terra_treasures/auth/login_screen.dart';
import 'package:terra_treasures/auth/registerpage.dart';
import 'package:terra_treasures/business_logic/firebase_options.dart';

import 'package:terra_treasures/crud/ui.dart';
import 'package:terra_treasures/modules/seller_module/seller_home.dart';
import 'package:terra_treasures/modules/user_module/screens/home.dart';
import 'package:terra_treasures/modules/user_module/screens/profile.dart';
import 'package:terra_treasures/splash.dart';
import 'package:terra_treasures/tapped.dart';

 



Future <void> main()  async{
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
      home:        const HomeScreen()
    );
  }
}



