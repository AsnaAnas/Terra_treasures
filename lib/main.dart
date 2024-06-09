import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:terra_treasures/business_logic/firebase_options.dart';
import 'package:terra_treasures/display_details.dart';
import 'package:terra_treasures/example_reg.dart';
import 'package:terra_treasures/modules/admin/add_quiz.dart';
import 'package:terra_treasures/modules/admin/admin_home.dart';
import 'package:terra_treasures/modules/admin/view_buyer.dart';
import 'package:terra_treasures/splash.dart';


 



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
      home:         AddQuiz()
    );
  }
}



