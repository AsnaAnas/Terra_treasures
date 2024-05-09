//import 'dart:js_interop';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:terra_treasures/auth/login_screen.dart';
import 'package:terra_treasures/modules/auth_screens/seller_login.dart';
import 'package:terra_treasures/util/custom_button.dart';


class SellerRegister extends StatefulWidget {
   const SellerRegister({super.key});

  @override
  State<SellerRegister> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<SellerRegister> {
  final _formkey=GlobalKey<FormState>();
  final _usernameController=TextEditingController();
  final _passwordController=TextEditingController();
  final _phonecontroller=TextEditingController();
  final _emailcontroller=TextEditingController();
  final _confirmpassword=TextEditingController();
  final _cityController=TextEditingController();
  final _stateController=TextEditingController();
  final _houseController=TextEditingController();
  final _placeController=TextEditingController();
  String email="",password="";

  final _auth = FirebaseAuth.instance;
//Add details into firebase

Future addDetails(Map<String,dynamic> regInfo, String userId)async
{
   return FirebaseFirestore.instance
   .collection('seller')
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
            builder: (context) => SellerLogin(),
          ));

          // String registered_user_id = randomString(10);
          String uid= _auth.currentUser!.uid;
            Map<String,dynamic> registereinfomap = {
              "name": _usernameController.text,
              "email": _emailcontroller.text,
              "phone":_phonecontroller.text,
              "password" : _passwordController.text,
              "city" : _cityController.text,
               "state" : _stateController.text,
                "house_no" : _houseController.text,
                 "place" : _placeController.text,
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
                      return null;
                    },
                  ),
                      const SizedBox(height: 10,),
                  Row(
                    children: [
                      SizedBox(
                        width: 170,
                        child: TextFormField(
                                controller: _cityController,
                                cursorHeight: 20,
                                obscureText: false,
                                decoration: InputDecoration(
                              enabledBorder:  OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.black),
                                 borderRadius: BorderRadius.circular(17),
                                 
                               ),
                             fillColor: Colors.white,
                              filled: true,
                              hintText: "City",
                              hintStyle: GoogleFonts.inder(color:Colors.black),
                              
                               ),
                              ),
                      ),
                      SizedBox(width: 20,),

                      SizedBox(
                    width: 170,
                    child: TextFormField(
                            controller: _stateController,
                            cursorHeight: 20,
                            obscureText: false,
                            decoration: InputDecoration(
                          enabledBorder:  OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black),
                             borderRadius: BorderRadius.circular(17),
                             
                           ),
                         fillColor: Colors.white,
                          filled: true,
                          hintText: "State",
                          hintStyle: GoogleFonts.inder(color:Colors.black),
                          
                           ),
                          ),
                  ),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  TextFormField(
                          controller: _houseController,
                          cursorHeight: 20,
                          obscureText: false,
                          decoration: InputDecoration(
                        enabledBorder:  OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black),
                           borderRadius: BorderRadius.circular(17),
                           
                         ),
                       fillColor: Colors.white ,
                        filled: true,
                        hintText: "House No:,Building name",
                        hintStyle: GoogleFonts.inder(color:Colors.black),
                        
                         ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                                controller: _placeController,
                                cursorHeight: 20,
                                obscureText: false,
                                decoration: InputDecoration(
                              enabledBorder:  OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.black),
                                 borderRadius: BorderRadius.circular(17),
                                 
                               ),
                              fillColor: Colors.white,
                              filled: true,
                              hintText: "Road name,Area, Colony(Required)",
                              hintStyle: GoogleFonts.inder(color:Colors.black),
                              
                               ),
                              ),
                       
                 
                      const SizedBox(height: 60,),
                      CustomButton(onPressed: () async{
                        if(_formkey.currentState!.validate())
                        {
                          setState(() {
                            email=_emailcontroller.text;
                            password=_passwordController.text;
                          });
                          registration();
               
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


