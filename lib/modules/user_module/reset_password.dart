

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:terra_treasures/modules/user_module/login_screen.dart';
import 'package:terra_treasures/util/custom_button.dart';
import 'package:terra_treasures/util/textfield.dart';

class ResetPassword extends StatelessWidget {
   ResetPassword ({super.key});
  final passwordcontroller=TextEditingController();
  final confirmpassword=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
       
        body: Padding(
          padding: const EdgeInsets.only(top: 100),
          child: Column(
            
             children: [
              Text("Reset Your \n Passord",
              style: GoogleFonts.inder(fontSize:24,fontWeight:FontWeight.bold,color:Color(0xff436850)),),
              const SizedBox(height: 50,),
                          MyTextfield(
                controller: passwordcontroller,
                 hintText: "New Password", obscureText: false),
                 const SizedBox(height: 20,),
                  MyTextfield(
                controller: confirmpassword,
                 hintText: "Confirm Password", obscureText: true),
           const SizedBox(height: 30,),
           CustomButton(onPressed: (){
            ScaffoldMessenger.of(context).showSnackBar(const 
            SnackBar(content: Text("Reset Password Successfully"),
            showCloseIcon: true,
            backgroundColor: Color(0xff436850),
            duration: Duration(seconds: 2),
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.only(bottom:50,left: 50,right: 50),));
            
           
           }, text: "Reset")
             ],
          ),
        ),
    );
  }
}