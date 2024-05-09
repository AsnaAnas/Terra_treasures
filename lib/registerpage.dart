//import 'dart:js_interop';

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:random_string/random_string.dart';

import 'package:terra_treasures/auth/login_screen.dart';
import 'package:terra_treasures/util/custom_button.dart';
//import 'package:terra_treasures/util/textfield.dart';

class RegisterPage extends StatefulWidget {
   const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterPage> {
  final _formkey=GlobalKey<FormState>();
  final _usernameController=TextEditingController();
  final _passwordController=TextEditingController();
  final _phonecontroller=TextEditingController();
  final _emailcontroller=TextEditingController();
  final _confirmpassword=TextEditingController();
  String email="",password="";
 // String url='';

  File? selectedImage;

  final _auth = FirebaseAuth.instance;
  

//Add details into firebase

Future addDetails(Map<String,dynamic> regInfo, String userId)async
{
   return FirebaseFirestore.instance
   .collection('register')
   .doc(userId)
   .set(regInfo);
}
//Authentication
registration() async
{
  try {
  final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: email,
    password: password,
  );
   ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Registration successful')));
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LoginScreen(),
          ));

          // String registered_user_id = randomString(10);
          String uid= _auth.currentUser!.uid;
            Map<String,dynamic> registereinfomap = {
              "name": _usernameController.text,
              "email": _emailcontroller.text,
              "phone":_phonecontroller.text,
              "password" : _passwordController.text,
              "image" :'',
              "id": uid,
            };
            await addDetails(registereinfomap, uid);
            const SnackBar(content: Text("Details added to firebase Succesfully"));
} on FirebaseAuthException catch (e) {
  if (e.code == 'weak-password') {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: const Text('Weak password'),
        ));
  } else if (e.code == 'email-already-in-use') {
     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('E-mail is already in use'),
        ));
  }
} catch (e) {
  print(e);
}
}

  @override
  Widget build(BuildContext context) {

     Future<void> _pickedImageGallery()async{
      final pickedImage= await ImagePicker().pickImage(source: ImageSource.gallery);
      if(pickedImage==null) return;
      setState(() {
        selectedImage=File(pickedImage.path);
      });
    }

    return  Scaffold(

       body: Stack(
        children: [
          Container(
        height: double.infinity,
        width: double.infinity,
        decoration:  BoxDecoration(
        
          image: DecorationImage(image: const AssetImage("assets/login.jpg"),
          opacity: .4,
          fit: BoxFit.fill,
          colorFilter: ColorFilter.mode(
          Colors.black.withOpacity(0.99),
          BlendMode.dstATop,
        ),
          )
        ),
        
      ),
    //  Padding(
    //    padding: const EdgeInsets.only(left:200,right: 200),
    //    child: Text("Sign Up",
    //                   style: GoogleFonts.inder(fontSize:20,fontWeight:FontWeight.bold,
    //                   color:Colors.white),
    //                   ),
    //  )
    const Padding(
      padding: EdgeInsets.only(top: 100,left: 120,),
      child: Text("Sign Up",style: TextStyle(color: Colors.white,fontSize: 30),),
    ),
    
       Padding(
         padding: const EdgeInsets.only(top: 200,),

         child:Form(
          key: _formkey,
           child: SingleChildScrollView(
             child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                  const SizedBox(height: 20,),

                         TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    cursorHeight: 20,
                    controller: _usernameController,
                    obscureText: false,
                    decoration: InputDecoration(
                      enabledBorder:  OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey),
                         borderRadius: BorderRadius.circular(17),
                       ),
                      fillColor: Colors.white,
                      filled: true,
                      hintText: "User name",
                    ),
                    validator: (value) {
                      if(value!.isEmpty)
                      {
                        return 'Please enter your username';
                      }
                      return null;
                    },
                  ),
                        
                        //  MyTextfield(
                        //  controller: usernameController,
                        //   hintText: 'Username',
                        //   obscureText: false,
                        //              ),
                        const SizedBox(height: 20,),
                         TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    cursorHeight: 20,
                    controller: _emailcontroller,
                    obscureText: false,
                    decoration: InputDecoration(
                      enabledBorder:  OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey),
                         borderRadius: BorderRadius.circular(17),
                       ),
                      fillColor: Colors.white,
                      filled: true,
                      hintText: "Email",
                    ),
                    validator: (value) {
                      if(value!.isEmpty)
                      {
                        return 'Please enter your Email';
                      }
                      RegExp emailRegExp=RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                      if(!emailRegExp.hasMatch(value))
                      {
                        return "Please enter a valid email";
                      }
                      return null;
                    },
                    
                  ),
             
                      //    const SizedBox(height: 20,),
                      //    MyTextfield(
                      //  controller: emailcontroller,
                      //  hintText: 'Email',
                      //  obscureText: false,
                      //          ),
                         const SizedBox(height: 20,),
                          TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    cursorHeight: 20,
                    controller: _phonecontroller,
                    obscureText: false,
                    decoration: InputDecoration(
                      enabledBorder:  OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey),
                         borderRadius: BorderRadius.circular(17),
                       ),
                      fillColor: Colors.white,
                      filled: true,
                      hintText: "Phone Number",
                    ),
                    validator: (value) {
                      if(value!.isEmpty)
                      {
                        return 'Please enter your Phone numnber';
                      }
                      if(_phonecontroller.text.length < 10 || _phonecontroller.text.length >10 )
                      {
                        return 'Phone number must contain 10 digits';
                      }
                      return null;
                    },
                  ),
                      //    MyTextfield(
                      //  controller: phonecontroller,
                      //  hintText: 'Phone Number',
                      //  obscureText: false,
                      //          ),
                                const SizedBox(height: 20,),
                                 TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    cursorHeight: 20,
                    controller: _passwordController,
                    obscureText: false,
                    decoration: InputDecoration(
                      enabledBorder:  OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey),
                         borderRadius: BorderRadius.circular(17),
                       ),
                      fillColor: Colors.white,
                      filled: true,
                      hintText: "Password",
                    ),
                    validator: (value) {
                      if(value!.isEmpty)
                      {
                        return 'Please enter your Password';
                      }
                      return null;
                    },
                  ),
                      //    MyTextfield(
                      //  controller: passwordController,
                      //  hintText: 'Password',
                      //  obscureText: false,
                      //          ),
                                const SizedBox(height: 20,),
                                 TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    cursorHeight: 20,
                    controller: _confirmpassword,
                    obscureText: false,
                    decoration: InputDecoration(
                      enabledBorder:  OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey),
                         borderRadius: BorderRadius.circular(17),
                       ),
                      fillColor: Colors.white,
                      filled: true,
                      hintText: "Confirm Password",
                    ),
                    validator: (value) {
                      if(value!.isEmpty)
                      {
                        return 'Please confirm your password';
                      }
                      if((_passwordController.text!=_confirmpassword.text)){
                        return 'Password do not match';
                      }
                      return null;
                    },
                  ),
                      //    MyTextfield(
                      //  controller: passwordController,
                      //  hintText: 'Confirm Password',
                      //  obscureText: false,
                      //          ),
             
                      // const SizedBox(height: 20,),
                       
                 
                      const SizedBox(height: 60,),
                      CustomButton(onPressed: () async{
                        if(_formkey.currentState!.validate())
                        {
                          setState(() {
                            email=_emailcontroller.text;
                            password=_passwordController.text;
                          });
                          registration();
                //          Navigator.push(context,MaterialPageRoute(builder: (context) =>  const LoginScreen()
                //          )
                //           );
                //            ScaffoldMessenger.of(context).showSnackBar(const 
                // SnackBar(content: Text("register Successfully"),
                // showCloseIcon: true,
                // backgroundColor: Color.fromARGB(255, 0, 124, 43),
                // duration: Duration(seconds: 2),
                // behavior: SnackBarBehavior.floating,
                // margin: EdgeInsets.only(bottom:50,left: 50,right: 50),));
                      }
                        
                
               
                      }, text: "Sign Up"),
                       
                          ],
                        ),
           ),
         ),
                  )
                   ]
         ),
       );
  
             
           
      
   
  }
}


