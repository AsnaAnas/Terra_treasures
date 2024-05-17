

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:terra_treasures/auth/login_screen.dart';
// import 'package:terra_treasures/crud/controller.dart';
// import 'package:terra_treasures/model/user_model.dart';
// import 'package:terra_treasures/util/custom_button.dart';

// class NewPage extends StatefulWidget {
//    const  NewPage({super.key});

//   @override
//   State<NewPage> createState() => _NewPageState();
// }

// class _NewPageState extends State<NewPage> {

  
//   Controller controller=Controller();

//   final _formkey=GlobalKey<FormState>();
//   final _usernameController=TextEditingController();
//   final _emailcontroller=TextEditingController();
//   final _phonecontroller=TextEditingController();
//   final _passwordController=TextEditingController();
//   final _confirmpassword=TextEditingController();
//   String email="", password="";


//   registration() async
// {
//   try {
//   final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
//     email: email,
//     password: password,
//   );
//    ScaffoldMessenger.of(context)
//           .showSnackBar(SnackBar(content: Text('Registration successful')));
//       Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(
//             builder: (context) => LoginScreen(),
//           ));

        
// } on FirebaseAuthException catch (e) {
//   if (e.code == 'weak-password') {
//     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//           content: const Text('Weak password'),
//         ));
//   } else if (e.code == 'email-already-in-use') {
//      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//           content: Text('E-mail is already in use'),
//         ));
//   }
// } catch (e) {
//   print(e);
// }
// }

//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(

//        body: Stack(
//         children: [
//           Container(
//         height: double.infinity,
//         width: double.infinity,
//         decoration:  BoxDecoration(
        
//           image: DecorationImage(image: const AssetImage("assets/login.jpg"),
//           opacity: .4,
//           fit: BoxFit.fill,
//           colorFilter: ColorFilter.mode(
//           Colors.black.withOpacity(0.99),
//           BlendMode.dstATop,
//         ),
//           )
//         ),
        
//       ),
    
//     const Padding(
//       padding: EdgeInsets.only(top: 100,left: 120,),
//       child: Text("Sign Up",style: TextStyle(color: Colors.white,fontSize: 30),),
//     ),
    
//        Padding(
//          padding: const EdgeInsets.only(top: 200,),

//          child:Form(
//           key: _formkey,
//            child: SingleChildScrollView(
//              child: Column(
//               // mainAxisAlignment: MainAxisAlignment.center,
//                        children: [
//                   const SizedBox(height: 20,),

//                          TextFormField(
//                     autovalidateMode: AutovalidateMode.onUserInteraction,
//                     cursorHeight: 20,
//                     controller: _usernameController,
//                     obscureText: false,
//                     decoration: InputDecoration(
//                       enabledBorder:  OutlineInputBorder(
//                         borderSide: const BorderSide(color: Colors.grey),
//                          borderRadius: BorderRadius.circular(17),
//                        ),
//                       fillColor: Colors.white,
//                       filled: true,
//                       hintText: "User name",
//                     ),
//                     validator: (value) {
//                       if(value!.isEmpty)
//                       {
//                         return 'Please enter your username';
//                       }
//                       return null;
//                     },
//                   ),
                        
//                         //  MyTextfield(
//                         //  controller: usernameController,
//                         //   hintText: 'Username',
//                         //   obscureText: false,
//                         //              ),
//                         const SizedBox(height: 20,),
//                          TextFormField(
//                     autovalidateMode: AutovalidateMode.onUserInteraction,
//                     cursorHeight: 20,
//                     controller: _emailcontroller,
//                     obscureText: false,
//                     decoration: InputDecoration(
//                       enabledBorder:  OutlineInputBorder(
//                         borderSide: const BorderSide(color: Colors.grey),
//                          borderRadius: BorderRadius.circular(17),
//                        ),
//                       fillColor: Colors.white,
//                       filled: true,
//                       hintText: "Email",
//                     ),
//                     validator: (value) {
//                       if(value!.isEmpty)
//                       {
//                         return 'Please enter your Email';
//                       }
//                       RegExp emailRegExp=RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
//                       if(!emailRegExp.hasMatch(value))
//                       {
//                         return "Please enter a valid email";
//                       }
//                       return null;
//                     },
                    
//                   ),
             
//                       //    const SizedBox(height: 20,),
//                       //    MyTextfield(
//                       //  controller: emailcontroller,
//                       //  hintText: 'Email',
//                       //  obscureText: false,
//                       //          ),
//                          const SizedBox(height: 20,),
//                           TextFormField(
//                     autovalidateMode: AutovalidateMode.onUserInteraction,
//                     cursorHeight: 20,
//                     controller: _phonecontroller,
//                     obscureText: false,
//                     decoration: InputDecoration(
//                       enabledBorder:  OutlineInputBorder(
//                         borderSide: const BorderSide(color: Colors.grey),
//                          borderRadius: BorderRadius.circular(17),
//                        ),
//                       fillColor: Colors.white,
//                       filled: true,
//                       hintText: "Phone Number",
//                     ),
//                     validator: (value) {
//                       if(value!.isEmpty)
//                       {
//                         return 'Please enter your Phone numnber';
//                       }
//                       if(_phonecontroller.text.length < 10 || _phonecontroller.text.length >10 )
//                       {
//                         return 'Phone number must contain 10 digits';
//                       }
//                       return null;
//                     },
//                   ),
//                       //    MyTextfield(
//                       //  controller: phonecontroller,
//                       //  hintText: 'Phone Number',
//                       //  obscureText: false,
//                       //          ),
//                                 const SizedBox(height: 20,),
//                                  TextFormField(
//                     autovalidateMode: AutovalidateMode.onUserInteraction,
//                     cursorHeight: 20,
//                     controller: _passwordController,
//                     obscureText: false,
//                     decoration: InputDecoration(
//                       enabledBorder:  OutlineInputBorder(
//                         borderSide: const BorderSide(color: Colors.grey),
//                          borderRadius: BorderRadius.circular(17),
//                        ),
//                       fillColor: Colors.white,
//                       filled: true,
//                       hintText: "Password",
//                     ),
//                     validator: (value) {
//                       if(value!.isEmpty)
//                       {
//                         return 'Please enter your Password';
//                       }
//                       return null;
//                     },
//                   ),
//                       //    MyTextfield(
//                       //  controller: passwordController,
//                       //  hintText: 'Password',
//                       //  obscureText: false,
//                       //          ),
//                                 const SizedBox(height: 20,),
//                                  TextFormField(
//                     autovalidateMode: AutovalidateMode.onUserInteraction,
//                     cursorHeight: 20,
//                     controller: _confirmpassword,
//                     obscureText: false,
//                     decoration: InputDecoration(
//                       enabledBorder:  OutlineInputBorder(
//                         borderSide: const BorderSide(color: Colors.grey),
//                          borderRadius: BorderRadius.circular(17),
//                        ),
//                       fillColor: Colors.white,
//                       filled: true,
//                       hintText: "Confirm Password",
//                     ),
//                     validator: (value) {
//                       if(value!.isEmpty)
//                       {
//                         return 'Please confirm your password';
//                       }
//                       if((_passwordController.text!=_confirmpassword.text)){
//                         return 'Password do not match';
//                       }
//                       return null;
//                     },
//                   ),
//                       //    MyTextfield(
//                       //  controller: passwordController,
//                       //  hintText: 'Confirm Password',
//                       //  obscureText: false,
//                       //          ),
             
//                       // const SizedBox(height: 20,),
                       
                 
//                       const SizedBox(height: 60,),
//                       CustomButton(onPressed: () async{
//                         if(_formkey.currentState!.validate())
//                         {
//                           setState(() {
//                             email=_emailcontroller.text;
//                             password=_passwordController.text;
//                           });
//                          // registration();
                
//                       }
//                        controller.addUser(UserModel(
//                         name: _usernameController.text, 
//                         email: _emailcontroller.text, 
//                         phone: _phonecontroller.text,
//                         //image: image
//                         )); 
                
               
//                       }, text: "Sign Up"),
                       
//                           ],
//                         ),
//            ),
//          ),
//                   )
//                    ]
//          ),


//     );
//   }
// }