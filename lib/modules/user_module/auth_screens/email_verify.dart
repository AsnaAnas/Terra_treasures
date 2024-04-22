import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:terra_treasures/modules/user_module/auth_screens/reset_password.dart';
import 'package:terra_treasures/util/custom_button.dart';

class VerifyEmailPage extends StatelessWidget {
  const VerifyEmailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
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
       
        child: Form(
          
          child: Padding(
            padding: const EdgeInsets.only(left: 50,right: 50),
            
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: Text("Verify Code",style: GoogleFonts.inder(fontSize:30,fontWeight:FontWeight.bold,color:Colors.black),),
                ),
                Text("Enter your security code here",style: GoogleFonts.inder(fontSize:15,color:Colors.black),),
                const SizedBox(height: 100,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  
                        children: [
                          
                SizedBox(
                  height: 68,
                  width: 64,
                  child: TextField(
                    onChanged: (value) {
                      if(value.length == 1)
                      {
                        FocusScope.of(context).nextFocus();
                      }
                    },
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly,
                      
                    ],
                    decoration: const InputDecoration(
                          enabledBorder:  OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey,width: 3),
                            // borderRadius: BorderRadius.circular(17),
                           ),
                          //fillColor: Colors.grey,
                          filled: false,
                          
                        ),
                  )
                ),
                        
                 SizedBox(
                  height: 68,
                  width: 64,
                  child: TextField(
                    onChanged: (value) {
                      if(value.length == 1)
                      {
                        FocusScope.of(context).nextFocus();
                      }
                    },
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    decoration: const InputDecoration(
                          enabledBorder:  OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey,width: 3),
                           //  borderRadius: BorderRadius.circular(17),
                           
                           ),
                          //fillColor: Colors.grey,
                          filled: false,
                    )
                  )
                ),
                
                SizedBox(
                  height: 68,
                  width: 64,
                  child: TextField(
                    onChanged: (value) {
                      if(value.length == 1)
                      {
                        FocusScope.of(context).nextFocus();
                      }
                    },
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    decoration: const InputDecoration(
                          enabledBorder:  OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey,width: 3),
                             //borderRadius: BorderRadius.circular(17),
                           ),
                          //fillColor: Colors.grey,
                          filled: false,
                          
                        ),
                  )
                ),
                        SizedBox(
                  height: 68,
                  width: 64,
                  child: TextField(
                    onChanged: (value) {
                      if(value.length == 1)
                      {
                        FocusScope.of(context).nextFocus();
                      }
                    },
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    decoration: const InputDecoration(
                          enabledBorder:  OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey,width: 3),
                            // borderRadius: BorderRadius.circular(17),
                           ),
                          //
                          //fillColor: Colors.grey,
                          filled: false,
                          
                        ),
                  )
                ),
                        
                        ],
                        
                  ),
                  const SizedBox(height: 50,),
                  CustomButton(onPressed: (){
                 Navigator.push(context,MaterialPageRoute(builder: (context) =>  ResetPassword()) );

                  }, text: "Verify"),

                  const SizedBox(height: 50,),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Text("Don't receive it ? ",style: GoogleFonts.inder(fontSize:16,color:Colors.black),),
                       Text("Resend it",style: GoogleFonts.inder(fontSize:16,color:Colors.blueAccent),)
                     ],
                   )
              ],
            ),
          )),
      ),
    );
  }
}