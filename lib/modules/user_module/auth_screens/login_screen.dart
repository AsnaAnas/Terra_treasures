import 'package:flutter/material.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:terra_treasures/controller.dart';
import 'package:terra_treasures/modules/user_module/auth_screens/forgot_psd.dart';
import 'package:terra_treasures/modules/user_module/screens/onboarding_screen.dart';
import 'package:terra_treasures/modules/user_module/auth_screens/register_screen.dart';
import 'package:terra_treasures/util/custom_button.dart';
import 'package:terra_treasures/util/textfield.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({super.key});

  final usernameController=TextEditingController();
final passwordController=TextEditingController();

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
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
           child: Column(
                     children: [
                       MyTextfield(
                       controller: usernameController,
                        hintText: 'Username',
                        obscureText: false,
                                   ),
          
                        const SizedBox(height: 20,),
                       MyTextfield(
                     controller: passwordController,
                     hintText: 'Password',
                     obscureText: true,
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
                       Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const OnboardingScreen()),);
                    }, text: "Sign In"),
                     const Text("_____________or login with______________",style: TextStyle(color: Colors.white)),
                     const SizedBox(height: 10,),
                     const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                
                Image(image: AssetImage('assets/google.png'),height: 20,),
               // Image(image: AssetImage('assets/facebook.png'),height: 20,),
                
                       ],
                     ),
                    // const SizedBox(height: 20,),
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
                MaterialPageRoute(builder: (context) => RegisterScreen()),
              );
            },
            child: Align(alignment:Alignment.centerRight,child:  Text("Sign Up",style: GoogleFonts.inder(fontSize:15,color:Colors.white))),
                   ),
                     
                     ),
                            
                          ],
                        ),
                                         ),
                     )
                     ]
           ),
                 ),
             
            
                ],
              ),
        ),
          );
       
  }
}