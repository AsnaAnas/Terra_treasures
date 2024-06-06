

import 'dart:developer';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:terra_treasures/modules/user_module/screens/controller/controller.dart';
import 'package:terra_treasures/model/user_model.dart';
import 'package:terra_treasures/modules/user_module/screens/home.dart';
import 'package:terra_treasures/util/custom_button.dart';

class RegisterPage extends StatefulWidget {
  
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterPage> {
  final _formkey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  String email = "", password = "";
  File? selectedImage;
  final _auth = FirebaseAuth.instance;
  final Controller controller = Controller();

  Future<void> _pickImageFromGallery() async {
    final pickedImage = await controller.pickImage();
    if (pickedImage != null) {
      setState(() {
        selectedImage = File(pickedImage.path);
        log(selectedImage.toString());
      });
    }
  }

  Future<void> _register() async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        email = _emailController.text;
        password = _passwordController.text;
      });

      try {
        final userCredential = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        final uid = userCredential.user!.uid;

        String imageUrl = '';
        if (selectedImage != null) {
          imageUrl = await controller.uploadImage(XFile(selectedImage!.path));
        }

        final userModel = UserModel(
          name: _usernameController.text,
          email: _emailController.text,
          phone: _phoneController.text,
          imageUrl: imageUrl,
          id: uid
        );

        await controller.addUser(userModel, uid);

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Registration successful')),
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>  HomeScreen(),
          ),
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Weak password')),
          );
        } else if (e.code == 'email-already-in-use') {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('E-mail is already in use')),
          );
        }
      } catch (e) {
        print(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const AssetImage("assets/login.jpg"),
                opacity: .4,
                fit: BoxFit.fill,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.99),
                  BlendMode.dstATop,
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 100, left: 120),
            child: Text(
              "Sign Up",
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 200),
            child: Form(
              key: _formkey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: selectedImage != null
                          ? FileImage(selectedImage!)
                          : const AssetImage("assets/avatar.png") as ImageProvider,
                      child: IconButton(
                        onPressed: _pickImageFromGallery,
                        icon: const Icon(Icons.camera_alt),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      cursorHeight: 20,
                      controller: _usernameController,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(17),
                        ),
                        fillColor: Colors.white,
                        filled: true,
                        hintText: "User name",
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your username';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      cursorHeight: 20,
                      controller: _emailController,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(17),
                        ),
                        fillColor: Colors.white,
                        filled: true,
                        hintText: "Email",
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your Email';
                        }
                        RegExp emailRegExp = RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                        if (!emailRegExp.hasMatch(value)) {
                          return "Please enter a valid email";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      cursorHeight: 20,
                      controller: _phoneController,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(17),
                        ),
                        fillColor: Colors.white,
                        filled: true,
                        hintText: "Phone Number",
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your Phone number';
                        }
                        if (_phoneController.text.length != 10) {
                          return 'Phone number must contain 10 digits';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      cursorHeight: 20,
                      controller: _passwordController,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(17),
                        ),
                        fillColor: Colors.white,
                        filled: true,
                        hintText: "Password",
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your Password';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      cursorHeight: 20,
                      controller: _confirmPasswordController,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(17),
                        ),
                        fillColor: Colors.white,
                        filled: true,
                        hintText: "Confirm Password",
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please confirm your password';
                        }
                        if (_passwordController.text !=
                            _confirmPasswordController.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 60),
                    CustomButton(
                      onPressed: _register,
                      text: "Sign Up",
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}