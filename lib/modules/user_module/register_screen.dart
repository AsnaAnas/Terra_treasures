import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:terra_treasures/modules/user_module/login_screen.dart';
import 'package:terra_treasures/util/custom_button.dart';
import 'package:terra_treasures/util/textfield.dart';

class RegisterScreen extends StatelessWidget {
   RegisterScreen({super.key});
  
  final usernameController=TextEditingController();
final passwordController=TextEditingController();
final phonecontroller=TextEditingController();

final emailcontroller=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return  Scaffold(

       body: Stack(
        children: [
          Container(
        height: double.infinity,
        width: double.infinity,
        decoration:  BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/login.jpg"),
          fit: BoxFit.fill,
          colorFilter: ColorFilter.mode(
          Colors.black.withOpacity(0.99),
          BlendMode.dstATop,
        ),
          )
        ),
        
      ),
     Padding(
       padding: const EdgeInsets.only(top: 55,left:200,right: 200),
       child: Text("Sign Up",
                      style: GoogleFonts.inder(fontSize:30,fontWeight:FontWeight.bold,
                      color:Colors.white),),
     ),
       Padding(
         padding: const EdgeInsets.only(top: 100),

         child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                    
                     MyTextfield(
                     controller: usernameController,
                      hintText: 'Username',
                      obscureText: false,
                                 ),

                      const SizedBox(height: 20,),
                     MyTextfield(
                   controller: emailcontroller,
                   hintText: 'Email',
                   obscureText: false,
                           ),
                     const SizedBox(height: 20,),
                     MyTextfield(
                   controller: phonecontroller,
                   hintText: 'Phone Number',
                   obscureText: false,
                           ),
                            const SizedBox(height: 20,),
                     MyTextfield(
                   controller: passwordController,
                   hintText: 'Password',
                   obscureText: false,
                           ),
                            const SizedBox(height: 20,),
                     MyTextfield(
                   controller: passwordController,
                   hintText: 'Confirm Password',
                   obscureText: false,
                           ),

                  // const SizedBox(height: 20,),
                   
    
                  const SizedBox(height: 60,),
                  CustomButton(onPressed: (){
                     ScaffoldMessenger.of(context).showSnackBar(const 
            SnackBar(content: Text("register Successfully"),
            showCloseIcon: true,
            backgroundColor: Color.fromARGB(255, 0, 124, 43),
            duration: Duration(seconds: 2),
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.only(bottom:50,left: 50,right: 50),));
            
           
                     Navigator.push(context,MaterialPageRoute(builder: (context) =>  LoginScreen()) );
                  }, text: "Sign Up"),
                   
                      ],
                    ),
                  )
                   ]
         ),
       );
  
             
           
      
   
  }
}