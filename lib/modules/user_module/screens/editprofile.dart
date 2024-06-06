import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:floating_bottom_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:terra_treasures/model/user_model.dart';
import 'package:terra_treasures/modules/user_module/screens/cartpage.dart';
import 'package:terra_treasures/modules/user_module/screens/education.dart';
import 'package:terra_treasures/modules/user_module/screens/profile.dart';
import 'package:terra_treasures/util/constants.dart';

class EditProfile extends StatefulWidget {
  EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _firestor = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  File? selectedImage;
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();

  Future<void> _pickedImageGallery() async {
    final pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage == null) return;
    setState(() {
      selectedImage = File(pickedImage.path);
    });
  }

  Future<void> _updateProfile() async {
    String id = _auth.currentUser!.uid;
    Map<String, dynamic> updatedData = {
      'name': _nameController.text,
      'phone': _phoneController.text,
      'email': _emailController.text,
    };
    
    if (selectedImage != null) {
      SettableMetadata metadata = SettableMetadata(contentType: 'image/jpeg');
      final currenttime = TimeOfDay.now();
      UploadTask uploadTask = FirebaseStorage.instance
          .ref()
          .child('shoapimage/shoap$currenttime')
          .putFile(selectedImage!, metadata);
      TaskSnapshot snapshot = await uploadTask;
      String imageUrl = await snapshot.ref.getDownloadURL();
      updatedData['imageUrl'] = imageUrl;
    }

    await _firestor.collection('register').doc(id).update(updatedData);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text("Profile Edited Successfully"),
      showCloseIcon: true,
      backgroundColor: Color(0xff436850),
      duration: Duration(seconds: 2),
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.only(bottom: 30, left: 50, right: 50),
    ));
  }

  @override
  Widget build(BuildContext context) {
    String id = _auth.currentUser!.uid;
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfilePage()),
            );
          },
          icon: const Icon(Icons.arrow_circle_left_outlined),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 30),
              child: StreamBuilder(
                stream: _firestor.collection('register').doc(id).snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return CircularProgressIndicator();
                  }
                  UserModel userModel = UserModel.fromMap(snapshot.data!.data()!);

                  String image = userModel.imageUrl.toString();
                  _nameController.text = userModel.name;
                  _emailController.text = userModel.email;
                  _phoneController.text = userModel.phone;
                  return Column(
                    children: [
                      Stack(
                        children: [
                          CircleAvatar(
                            radius: 100,
                            backgroundImage: selectedImage != null
                                ? FileImage(selectedImage!)
                                : NetworkImage(image) as ImageProvider,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 140, left: 150),
                            child: IconButton(
                              onPressed: () async {
                                _pickedImageGallery();
                              },
                              icon: Icon(Icons.camera_alt, color: Colors.black, size: 30),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 40, left: 40, right: 40),
                        child: TextFormField(
                          controller: _nameController,
                          decoration: InputDecoration(
                            hintStyle: GoogleFonts.inder(color: Colors.grey),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20, left: 40, right: 40),
                        child: TextFormField(
                          controller: _phoneController,
                          decoration: InputDecoration(
                            hintStyle: GoogleFonts.inder(color: Colors.grey),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20, left: 40, right: 40),
                        child: TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            hintStyle: GoogleFonts.inder(color: Colors.grey),
                          ),
                        ),
                      ),
                      const SizedBox(height: 50),
                      Container(
                        height: 35,
                        width: 150,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(17),
                        ),
                        child: TextButton(
                          onPressed: _updateProfile,
                          child: Text(
                            "Edit",
                            style: GoogleFonts.inder(color: Colors.black),
                          ),
                        ),
                      )
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: AnimatedBottomNavigationBar(
        barColor: kPrimaryColor,
        bottomBarCenterModel: BottomBarCenterModel(
          centerBackgroundColor: Colors.white,
          centerIcon: const FloatingCenterButton(
            child: Icon(Icons.move_up_rounded, color: kPrimaryColor),
          ),
          centerIconChild: [
            FloatingCenterButtonChild(
              child: const Icon(Icons.school, color: kPrimaryColor),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EducationContent()),
                );
              },
            ),
            FloatingCenterButtonChild(
              child: const Icon(Icons.shopping_bag_outlined, color: kPrimaryColor),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CartPage()),
                );
              },
            ),
            FloatingCenterButtonChild(
              child: const Icon(Icons.quiz, color: kPrimaryColor),
              onTap: () {},
            ),
            FloatingCenterButtonChild(
              child: const Icon(Icons.question_mark_outlined, color: kPrimaryColor),
              onTap: () {},
            )
          ],
        ),
        bottomBar: const [
          BottomBarItem(
            icon: Icon(Icons.home, color: Colors.white),
            iconSelected: Icon(Icons.home),
            title: "Home",
            titleStyle: TextStyle(color: AppColors.white),
            dotColor: Colors.white,
          ),
          BottomBarItem(
            icon: Icon(Icons.people_alt, color: Colors.white),
            iconSelected: Icon(Icons.people_alt),
            title: "Community",
            titleStyle: TextStyle(color: AppColors.white),
            dotColor: Colors.white,
          )
        ],
      ),
    );
  }
}
