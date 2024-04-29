import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:terra_treasures/business_logic/firebase_options.dart';
import 'package:terra_treasures/modules/auth_screens/login_screen.dart';
import 'package:terra_treasures/modules/auth_screens/register_screen.dart';
import 'package:terra_treasures/modules/seller_module/add_details.dart';
import 'package:terra_treasures/modules/seller_module/add_product.dart';
import 'package:terra_treasures/modules/seller_module/myproduct.dart';
import 'package:terra_treasures/modules/seller_module/seller_home.dart';
import 'package:terra_treasures/modules/seller_module/seller_order.dart';
import 'package:terra_treasures/modules/seller_module/sellerorder_details.dart';
import 'package:terra_treasures/modules/user_module/screens/addresspage.dart';
import 'package:terra_treasures/modules/user_module/screens/cartpage.dart';
import 'package:terra_treasures/modules/user_module/screens/community_start.dart';
import 'package:terra_treasures/modules/user_module/screens/editprofile.dart';
import 'package:terra_treasures/modules/user_module/screens/education.dart';
import 'package:terra_treasures/modules/user_module/screens/forum.dart';
import 'package:terra_treasures/modules/user_module/screens/forum_details.dart';
import 'package:terra_treasures/modules/user_module/screens/home.dart';
import 'package:terra_treasures/modules/user_module/screens/moreinfo.dart';
import 'package:terra_treasures/modules/user_module/screens/notification.dart';
import 'package:terra_treasures/modules/user_module/screens/order.dart';
import 'package:terra_treasures/modules/user_module/screens/orderdetails.dart';
import 'package:terra_treasures/modules/user_module/screens/orderpage.dart';
import 'package:terra_treasures/modules/user_module/screens/orderplaced.dart';
import 'package:terra_treasures/modules/user_module/screens/paymentmethod.dart';
import 'package:terra_treasures/modules/user_module/screens/paymentpage.dart';
import 'package:terra_treasures/modules/user_module/screens/product.dart';
import 'package:terra_treasures/modules/user_module/screens/productDetails.dart';
import 'package:terra_treasures/modules/user_module/screens/profile.dart';
import 'package:terra_treasures/modules/user_module/screens/quiz_finish.dart';
import 'package:terra_treasures/modules/user_module/screens/quiz_home.dart';
import 'package:terra_treasures/modules/user_module/screens/quiz_question.dart';
import 'package:terra_treasures/modules/user_module/screens/quiz_start.dart';
import 'package:terra_treasures/modules/user_module/screens/settings.dart';
import 'package:terra_treasures/modules/user_module/screens/sustain.dart';
import 'package:terra_treasures/modules/user_module/screens/welcome.dart';
import 'package:terra_treasures/util/customnav.dart';
import 'package:terra_treasures/util/tabview.dart';




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
      home:     RegisterScreen()
    );
  }
}



