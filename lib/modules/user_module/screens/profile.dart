import 'package:floating_bottom_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:terra_treasures/modules/user_module/screens/cartpage.dart';
import 'package:terra_treasures/modules/user_module/screens/editprofile.dart';
import 'package:terra_treasures/modules/user_module/screens/education.dart';
import 'package:terra_treasures/modules/user_module/screens/home.dart';
import 'package:terra_treasures/modules/user_module/screens/order.dart';
import 'package:terra_treasures/modules/user_module/screens/settings.dart';
import 'package:terra_treasures/util/constants.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        leading: IconButton(onPressed: (){
         Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),
              );
        }, 
        icon: const Icon(Icons.arrow_circle_left_outlined)),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset('assets/profile.png'),
                Text("Example",
                style: GoogleFonts.inder(
                  fontSize:18,
                   ),),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/coin.png"),
                      Text("10",style: GoogleFonts.inder(),),
                    ],
                   ),
                   const SizedBox(height: 30,),
                   Container(
                       height: 40,
                        width: 150,
                        decoration:  BoxDecoration(
                          borderRadius: BorderRadius.circular(17),
                          border: Border.all(color: Colors.black),
                                    
                        ),
                        child: TextButton(onPressed: (){
                          Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const EditProfile()),
              );
                        },
                         child: Text("Edit Profile",
                         style: GoogleFonts.inder(color:Colors.black),)),
                    ),
                    const SizedBox(height: 20,),
                 Container(
                  height: 400,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(29),topRight:Radius.circular(29) )
                  ),
                  child:  Column(
                    
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 15,left: 30,right: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Icon(Icons.settings),
                            Text(
                              "Settings",
                              style: GoogleFonts.inder(
                                fontSize:18,
                              ),),
                           IconButton(onPressed: (){
                             Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsPage()),
              );
                           }, icon: const Icon(Icons.arrow_forward_ios_rounded))
                          ],
                        ),
                      ),
                     Padding(
                       padding: const EdgeInsets.only(left: 30,right: 30),
                       child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                            const Icon(Icons.lock),
                            Text(
                                "Change Password",
                                style: GoogleFonts.inder(
                                  fontSize:18,
                                ),),
                            IconButton(onPressed: (){
                              showDialog(context: context,
                               builder: (ctx)=> AlertDialog(
                                title: const Text("Change Password"),
                               actions: [
                                TextField(
                                  decoration: InputDecoration(
                  enabledBorder:  OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey),
                     borderRadius: BorderRadius.circular(17),
                   ),
                  fillColor: bgColor,
                  filled: true,
                  hintText: "New Password",
                  hintStyle: GoogleFonts.inder(color:Colors.grey)
                ),
                                ),
                                const SizedBox(height: 10,),
                                TextField(
                                  decoration: InputDecoration(
                  enabledBorder:  OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey),
                     borderRadius: BorderRadius.circular(17),
                   ),
                  fillColor: bgColor,
                  filled: true,
                  hintText: "Confirm Password",
                  hintStyle: GoogleFonts.inder(color:Colors.grey)
                ),
                                ),
                                const SizedBox(height: 10,),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: kPrimaryColor,
                                    fixedSize: const Size(100, 30)
                                  ),
                                  onPressed: (){
                                     ScaffoldMessenger.of(context).showSnackBar(const 
                                     SnackBar(content: Text("Password Changed"),
                                    showCloseIcon: true,
                                     backgroundColor: Color(0xff436850),
                                    duration: Duration(seconds: 2),
                                    behavior: SnackBarBehavior.floating,
                                     margin: EdgeInsets.only(bottom:50,left: 50,right: 50),));
                                     Navigator.of(context).pop();  
                                  }, 
                                child: Text("Save",style: GoogleFonts.inder(color:Colors.white),))
                               ],
                               ));
                            },
                        icon: const Icon(Icons.arrow_forward_ios_rounded))
                        ],
                       ),
                     ),
                      Padding(
                       padding: const EdgeInsets.only(left: 30,right: 30),
                       child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                            const Icon(Icons.cases_outlined),
                            Text(
                                "My Orders",
                                style: GoogleFonts.inder(
                                  fontSize:18,
                                ),),
                            IconButton(onPressed: (){
                              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MyOrderPage()),
              );
                            }, icon: const Icon(Icons.arrow_forward_ios_rounded))
                        ],
                       ),
                     ),
                      Padding(
                       padding: const EdgeInsets.only(left: 30,right: 30),
                       child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                            const Icon(Icons.logout),
                            Text(
                                "Logout",
                                style: GoogleFonts.inder(
                                  fontSize:18,
                                ),),
                            IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_forward_ios_rounded))
                        ],
                       ),
                     )

                    ],
                  ),
                 ) 
              ],
            ),
          ),
        
        ),
        
      ),

       bottomNavigationBar:  AnimatedBottomNavigationBar(
          barColor: kPrimaryColor,
          bottomBarCenterModel: BottomBarCenterModel(
            centerBackgroundColor: Colors.white,
            centerIcon: const FloatingCenterButton(
              child: Icon(Icons.move_up_rounded,color: kPrimaryColor,),), 
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