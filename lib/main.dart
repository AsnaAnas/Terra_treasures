import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:terra_treasures/firebase_options.dart';
import 'package:terra_treasures/modules/user_module/addresspage.dart';
import 'package:terra_treasures/modules/user_module/cartpage.dart';
import 'package:terra_treasures/modules/user_module/education.dart';
import 'package:terra_treasures/modules/user_module/home.dart';
import 'package:terra_treasures/modules/user_module/moreinfo.dart';
import 'package:terra_treasures/modules/user_module/notification.dart';
import 'package:terra_treasures/modules/user_module/order.dart';
import 'package:terra_treasures/modules/user_module/orderdetails.dart';
import 'package:terra_treasures/modules/user_module/orderpage.dart';
import 'package:terra_treasures/modules/user_module/orderplaced.dart';
import 'package:terra_treasures/modules/user_module/paymentmethod.dart';
import 'package:terra_treasures/modules/user_module/paymentpage.dart';
import 'package:terra_treasures/modules/user_module/productDetails.dart';
import 'package:terra_treasures/modules/user_module/profile.dart';
import 'package:terra_treasures/modules/user_module/sustain.dart';
import 'package:terra_treasures/modules/user_module/welcome.dart';
import 'package:terra_treasures/util/customnav.dart';




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
      home:  const HomeScreen()
    );
  }
}



