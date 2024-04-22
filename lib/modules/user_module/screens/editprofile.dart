import 'package:floating_bottom_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:terra_treasures/modules/user_module/screens/cartpage.dart';
import 'package:terra_treasures/modules/user_module/screens/education.dart';
import 'package:terra_treasures/modules/user_module/screens/profile.dart';
import 'package:terra_treasures/util/constants.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        leading: IconButton(onPressed: (){
          Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfilePage()),
              );
        }, 
        icon: const Icon(Icons.arrow_circle_left_outlined)),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Column(
              children: [
               Stack(
                children: [
                  Image.asset('assets/profile.png'),
                 const Padding(
                   padding: EdgeInsets.only(top: 140,left: 100,),
                   child: Icon(Icons.camera_alt,color: Colors.white,),
                 )
                ],
               ),
               Padding(
                 padding: const EdgeInsets.only(top: 40,left: 40,right: 40),
                 child: TextFormField(
                  decoration:  InputDecoration(
                    hintText: "Name",
                    hintStyle: GoogleFonts.inder(
                      color:Colors.grey,
                    )
                  ),
                 ),
               ),
                Padding(
                 padding: const EdgeInsets.only(top: 20,left: 40,right: 40),
                 child: TextFormField(
                  decoration:  InputDecoration(
                    hintText: "Phone Number",
                    hintStyle: GoogleFonts.inder(
                      color:Colors.grey,
                    )
                  ),
                 ),
               ),
                Padding(
                 padding: const EdgeInsets.only(top: 20,left: 40,right: 40),
                 child: TextFormField(
                  decoration:  InputDecoration(
                    hintText: "E-mail",
                    hintStyle: GoogleFonts.inder(
                      color:Colors.grey,
                    )
                  ),
                 ),
               ),
               const SizedBox(height: 50,),
               Container(
                height: 35,
                width: 150,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(17),
                ),
                child: TextButton(onPressed: (){
                  ScaffoldMessenger.of(context).showSnackBar(const 
            SnackBar(content: Text("Profile Edited Successfully"),
            showCloseIcon: true,
            backgroundColor: Color(0xff436850),
            duration: Duration(seconds: 2),
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.only(bottom:30,left: 50,right: 50),));
                                
                }, 
                child: Text("Edit",style: GoogleFonts.inder(color:Colors.black),)),
               )
              ],
            ),
          ),
        )),
         bottomNavigationBar:  AnimatedBottomNavigationBar(
          barColor: kPrimaryColor,
          bottomBarCenterModel: BottomBarCenterModel(
            centerBackgroundColor: Colors.white,
            centerIcon: const FloatingCenterButton(
              child: Icon(Icons.move_up_rounded,color: kPrimaryColor,),
               ), 
            centerIconChild: [
              FloatingCenterButtonChild(
                child: const Icon(Icons.school,color: kPrimaryColor,),
                onTap: () {
                  Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const EducationContent()),
              );
                },
                ),
                FloatingCenterButtonChild(
                child: const Icon(Icons.shopping_bag_outlined,color:kPrimaryColor),
                onTap: () {
                  Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CartPage()),
              );
                },
                ),
                FloatingCenterButtonChild(
                child: const Icon(Icons.quiz,color: kPrimaryColor,),
                onTap: () {
                  
                },
                ),
                FloatingCenterButtonChild(
                child: const Icon(Icons.question_mark_outlined,color: kPrimaryColor,),
                onTap: () {
                  
                },
                )

            ]), 
          bottomBar: const [
              BottomBarItem(
                icon: Icon(Icons.home,color: Colors.white,),
                 iconSelected: Icon(Icons.home),title: "Home",
                 titleStyle:TextStyle(color: AppColors.white),
                dotColor: Colors.white
                 ),
                 BottomBarItem(
                icon: Icon(Icons.people_alt,color: Colors.white,),
                 iconSelected: Icon(Icons.people_alt),title: "Community",
                 titleStyle:TextStyle(color: AppColors.white),
                 dotColor: Colors.white)  
          ]),
        
    );
  }
}