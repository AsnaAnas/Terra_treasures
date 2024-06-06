import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:floating_bottom_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:terra_treasures/modules/seller_module/seller_home.dart';
import 'package:terra_treasures/modules/seller_module/seller_profile.dart';
import 'package:terra_treasures/modules/user_module/screens/cartpage.dart';
import 'package:terra_treasures/modules/user_module/screens/community_start.dart';
import 'package:terra_treasures/modules/user_module/screens/education.dart';
import 'package:terra_treasures/modules/user_module/screens/profile.dart';
import 'package:terra_treasures/util/constants.dart';

class SellerEditProfile extends StatefulWidget {
  
   SellerEditProfile({super.key});

  @override
  State<SellerEditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<SellerEditProfile> {
  final _firestor= FirebaseFirestore.instance;

  final _auth=FirebaseAuth.instance;
  File? selectedImage;
  final _nameController=TextEditingController();
  final _phoneController=TextEditingController();
  final _emailController=TextEditingController();

  @override
  Widget build(BuildContext context) {

    Future<void> _pickedImageGallery()async{
      final pickedImage= await ImagePicker().pickImage(source: ImageSource.gallery);
      if(pickedImage==null) return;
      setState(() {
        selectedImage=File(pickedImage.path);
      });
    }

     String id= _auth.currentUser!.uid;
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        leading: IconButton(onPressed: (){
          Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SellerProfile()),
              );
        }, 
        icon: const Icon(Icons.arrow_circle_left_outlined)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 30),
              child: StreamBuilder(stream: _firestor.collection('seller').doc(id).snapshots(), 
              builder: (context,snapshot)
              {
                DocumentSnapshot data=snapshot.data!;
                String imageUrl=data['image'];
                _nameController.text=data['name'];
                _emailController.text=data['email'];
                _phoneController.text=data['phone'];
                  return Column(
                children: [
                 Stack(
                  children: [
                    Container(
                       width: 200,
                       height: 200,
                       decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: selectedImage!=null
                          ?FileImage(selectedImage!)
                          :AssetImage(imageUrl)
                          as ImageProvider<Object>
                          )
                       ),
                    ),
                   
                    Padding(
                     padding: EdgeInsets.only(top: 140,left: 150,),
                     child:IconButton(onPressed: () async {
                       // showImagePickerOption(context);
                       _pickedImageGallery().then((value) async
                       {
                        SettableMetadata metadata= SettableMetadata(contentType:'image/jpeg');
                        final currenttime=TimeOfDay.now();
          
                        UploadTask uploadTask= FirebaseStorage.instance
                          .ref()
                          .child('shoapimage/shoap$currenttime')
                          .putFile(selectedImage!,metadata);
          
                          TaskSnapshot snapshot= await uploadTask;
          
                          await snapshot.ref.getDownloadURL().then((url){
                            String id= _auth.currentUser!.uid;
                            FirebaseFirestore.instance.collection('seller')
                            .doc(id).update({'image':url});
                          } );
                       }
                       );
                     }, icon: Icon(Icons.camera_alt,color: Colors.black,size: 30,))
                     // Icon(Icons.camera_alt,color: Colors.white,),
                   )
                  ],
                 ),
                 Padding(
                   padding: const EdgeInsets.only(top: 40,left: 40,right: 40),
                   child: TextFormField(
                    controller: _nameController,
                    decoration:  InputDecoration(
                      hintStyle: GoogleFonts.inder(
                        color:Colors.grey,
                      )
                    ),
                   ),
                 ),
                  Padding(
                   padding: const EdgeInsets.only(top: 20,left: 40,right: 40),
                   child: TextFormField(
                    controller: _phoneController,
                    decoration:  InputDecoration(
                      hintStyle: GoogleFonts.inder(
                        color:Colors.grey,
                      )
                    ),
                   ),
                 ),
                  Padding(
                   padding: const EdgeInsets.only(top: 20,left: 40,right: 40),
                   child: TextFormField(
                    controller: _emailController,
                    decoration:  InputDecoration(
                     
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
              );
              })
              
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
              //     Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) =>  EducationContent()),
              // );
                },
                ),
                FloatingCenterButtonChild(
                child: const Icon(Icons.shopping_bag_outlined,color:kPrimaryColor),
                onTap: () {
              //     Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => const CartPage()),
              // );
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
          bottomBar:  [
              BottomBarItem(
                icon: const Icon(Icons.home,color: Colors.white,),
                 iconSelected: const Icon(Icons.home),title: "Home",
                 titleStyle:const TextStyle(color: AppColors.white),
                dotColor: Colors.white,
                onTap: (value) {
                  Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  SellerHome()),
              );
                },
                 ),
                 BottomBarItem(
                icon: const Icon(Icons.people_alt,color: Colors.white,),
                 iconSelected: const Icon(Icons.people_alt),title: "Community",
                 titleStyle:const TextStyle(color: AppColors.white),
                 dotColor: Colors.white,
                 onTap: (value) {
              //      Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => const CommunityStart()),
              // );
                 },
                 )
                 
          ]),
        
    );

    
  }
  
  
}