

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:floating_bottom_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:terra_treasures/auth/login_screen.dart';
import 'package:terra_treasures/model/user_model.dart';
import 'package:terra_treasures/modules/user_module/screens/cartpage.dart';
import 'package:terra_treasures/modules/user_module/screens/editprofile.dart';
import 'package:terra_treasures/modules/user_module/screens/education.dart';
import 'package:terra_treasures/modules/user_module/screens/home.dart';
import 'package:terra_treasures/modules/user_module/screens/order.dart';
import 'package:terra_treasures/modules/user_module/screens/settings.dart';
import 'package:terra_treasures/util/constants.dart';

class ProfilePage extends StatefulWidget {
  
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  
   final  _firestor= FirebaseFirestore.instance;
   final _auth=FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    // String id=_auth.currentUser!.uid;
    //String productId = widget.productId;
    String? id; 
if (_auth.currentUser != null) {
  id = _auth.currentUser!.uid;
}
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        leading: IconButton(onPressed: (){
         Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  HomeScreen()),
              );
        }, 
        icon: const Icon(Icons.arrow_circle_left_outlined)),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 15),
            child: 
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                StreamBuilder(stream:_firestor.collection('register').doc(id).snapshots() , 
                builder: (context,snapshot)
                {
                  UserModel userModel=UserModel.fromMap(snapshot.data!.data()!);
           
           String image=userModel.imageUrl.toString();
                  
                   return    Padding(
                padding: const EdgeInsets.only(top: 20,left: 15,),
                child: CircleAvatar(
                 backgroundImage: NetworkImage(image),
                 radius: 60,
                          
                        ),
              );
                }
                ),
              
                StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                 
                  stream: _firestor.collection('register').doc(id).snapshots(),
                  builder: (context, snapshot) {
                  
                 UserModel userModel=UserModel.fromMap(snapshot.data!.data()!);
                   
                   return  Text(userModel.name,
                  style: GoogleFonts.inder(
                    fontSize:18,
                     ),);
                  },
                  
                ),
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
                MaterialPageRoute(builder: (context) =>  EditProfile()),
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
                MaterialPageRoute(builder: (context) =>  SettingsPage()),
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
                MaterialPageRoute(builder: (context) =>  MyOrderPage()),
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
                            IconButton(onPressed: ()async
                            {
                              _showLogoutBottomSheet();
                              // SharedPreferences preferences=await SharedPreferences.getInstance();
                              // _auth.signOut().then((value) =>
                              //  Navigator.push(context,MaterialPageRoute(builder: (context) =>  const LoginScreen()) ));
                              //  preferences.clear();
                              //  log('Logout sucessfully' as num);
                            }, icon: const Icon(Icons.arrow_forward_ios_rounded))
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
                MaterialPageRoute(builder: (context) =>  EducationContent()),
              );
                },
                ),
                FloatingCenterButtonChild(
                child: const Icon(Icons.shopping_bag_outlined,color:kPrimaryColor),
                onTap: () {
                  Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  CartPage()),
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

  void _showLogoutBottomSheet() {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        height: MediaQuery.of(context).size.height * 0.3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Are you sure you want to logout?',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    SharedPreferences preferences = await SharedPreferences.getInstance();
                    _auth.signOut().then((value) => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()))); // Use pushReplacement here
                    preferences.clear();
                    // log('logout successfully' as num);

                    print('Logout confirmed');
                    Navigator.pop(context);
                  },
                  child: Text('Logout'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Cancel'),
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}

}



