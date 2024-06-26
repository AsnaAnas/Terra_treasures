import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:terra_treasures/modules/auth_screens/forgot_psd.dart';
import 'package:terra_treasures/modules/user_module/screens/onboarding_screen.dart';
import 'package:terra_treasures/auth/registerpage.dart';
import 'package:terra_treasures/util/custom_button.dart';
//import 'package:terra_treasures/util/textfield.dart';

class LoginScreen extends StatefulWidget {
 
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
   final _formkey=GlobalKey<FormState>();

  final _usernameController=TextEditingController();

final _passwordController=TextEditingController();
String email="",password="";

login()async
{
  SharedPreferences preferences=await SharedPreferences.getInstance();
  try {
  final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: email,
    password: password,
 );
 preferences.setString('islogging', credential.user!.uid);
 ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Sign in succesfull')));
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) =>  OnboardingScreen(),
            ));

  }
on FirebaseAuthException catch (e) {
    ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Invalid username or password')));
  }
}

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
        body: SafeArea(
      
        child: Stack(
         
        children: [
          Container(
        height: double.infinity,
        width: double.infinity,
        decoration:  BoxDecoration(
          image: DecorationImage(
            opacity: .4,
            image: const AssetImage("assets/login.jpg"),
          fit: BoxFit.fill,
          colorFilter: ColorFilter.mode(
          Colors.black.withOpacity(0.99),
          BlendMode.dstATop,
        ),
          )
        ),
        child:  Padding(
          padding: const EdgeInsets.only(top: 45,left: 22),
          child: Text("Welcome\n Back !" ,style:GoogleFonts.inknutAntiqua(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold) ),
        ),
              ),
               Padding(
         padding: const EdgeInsets.only(top: 200),
         child: Form(
              key: _formkey,
           child: SingleChildScrollView(
             child: Padding(
               padding: const EdgeInsets.all(20),
               child: Column(
                         children: [
                          //  MyTextfield(
                          //  controller: usernameController,
                          //   hintText: 'Username',
                          //   obscureText: false,
                          //              ),
                          TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    
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
                          
                       
                            const SizedBox(height: 20,),
                        //    MyTextfield(
                        //  controller: passwordController,
                        //  hintText: 'Password',
                        //  obscureText: true,
                        //          ),
               
                        TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                   
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      enabledBorder:  OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey),
                         borderRadius: BorderRadius.circular(17),
                       ),
                      fillColor: Colors.white,
                      filled: true,
                      hintText:"Password",
                    ),
                    validator: (value) {
                      if(value!.isEmpty)
                      {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                        const SizedBox(height: 10,),
                         
                      
                         Padding(
                           padding: const EdgeInsets.only(right: 20),
                           child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ForgotPsd()),
                  );
                },
                child: Align(alignment:Alignment.centerRight,child:  Text("Forgot Password?",style: GoogleFonts.inder(fontSize:15,color:Colors.white))),
                       ),
                          
                         ),
                        
                        const SizedBox(height: 30,),
                        CustomButton(onPressed: (){
                          if(_formkey.currentState!.validate()){
                            setState(() {
                              email=_usernameController.text;
                              password=_passwordController.text;
                            });
                            login();
                    //           Navigator.push(
                    // context,
                    // MaterialPageRoute(builder: (context) => const OnboardingScreen()),);
                    //       }
                    //       else{
                    //         ScaffoldMessenger.of(context).showSnackBar(
                    //           SnackBar(content: Text('Invalid username or password',
                    //           style: GoogleFonts.inder(fontSize:16,color:Colors.grey)))
                    //         );
                         }
                          
                        }, text: "Sign In"),
                         const Text("_____________or login with______________",style: TextStyle(color: Colors.white)),
                         const SizedBox(height: 10,),
                         const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                    
                    Image(image: AssetImage('assets/google.png'),height: 40,),

                   // Image(image: AssetImage('assets/facebook.png'),height: 20,),
                    
                           ],
                         ),
                        const SizedBox(height: 20,),
                         Padding(
                           padding: const EdgeInsets.only(right: 20),
                           child: Align(
                            alignment: Alignment.bottomRight,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text("Don't have an account?",
                                style: GoogleFonts.inder(fontSize:16,color:Colors.grey)),
                                Padding(
                           padding: const EdgeInsets.only(right: 20),
                           child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  RegisterPage()),
                  );
                },
                child: Align(alignment:Alignment.centerRight,child:  Text("Sign Up",style: GoogleFonts.inder(fontSize:15,color:Colors.white))),
                       ),
                         
                         ),
                                
                              ],
                            ),
                                             ),
                         )
                         ],
               ),
             ),
           ),
         ),
               ),
        ],
        ),
        ),
    );
  }
}