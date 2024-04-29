

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:terra_treasures/modules/auth_screens/email_verify.dart';
import 'package:terra_treasures/util/custom_button.dart';
import 'package:terra_treasures/util/textfield.dart';

class ForgotPsd extends StatelessWidget {
   ForgotPsd({super.key});
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
           color: Colors.black,
          image: DecorationImage(image: const AssetImage("assets/login.jpg"),
          fit: BoxFit.fill,
          colorFilter: ColorFilter.mode(
          Colors.black.withOpacity(0.8),
          BlendMode.dstATop,
        ),
          )
        ),
        
      ),
      Padding(
        padding: const EdgeInsets.only(top: 150,left: 80,right:50),
        child: Text("Forget Password",style: GoogleFonts.inder(
          fontSize:24,fontWeight:FontWeight.bold,color:Colors.white)
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 300,left: 50,),
        child: Column(
          children: [
            MyTextfield(
              controller: emailcontroller, 
              hintText: "Enter your email", 
              obscureText: false),

              const SizedBox(height: 50,),
              CustomButton(onPressed: (){
                Navigator.push(context,MaterialPageRoute(builder: (context) =>  VerifyEmailPage()) );
              }, text: "Send")
          ],
        ),
      )
         ]
  
    )
           
         
      );

  
  }
}