

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:terra_treasures/modules/auth_screens/seller_login.dart';
import 'package:terra_treasures/auth/login_screen.dart';
import 'package:terra_treasures/auth/register_screen.dart';
import 'package:terra_treasures/modules/user_module/screens/home.dart';





class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  check(BuildContext context)async{
    SharedPreferences preferences=await SharedPreferences.getInstance();
    String? name=preferences.getString('isloggin');

    if(name!=null)
    {
       Navigator.push(context,MaterialPageRoute(builder: (context) =>  HomeScreen()) );
    }
    else
    {
      Navigator.push(context,MaterialPageRoute(builder: (context) =>  LoginScreen()) );
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          
          image: DecorationImage(
           // opacity:.4,
            image: AssetImage("assets/welcom.jpg"),
          fit: BoxFit.fill)
        ),
        child:  Center(
            child: Column(
               children: [
                // const Padding(
                //   padding: EdgeInsets.all(8.0),
                //   child: Image(image: AssetImage('assets/images/logo.png')),
                // ),
                const SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.only(top: 200),
                  child: Text("Welcome",
                  style: GoogleFonts.inder(fontSize:28,color:Colors.white )),
                ),
                const SizedBox(height: 10,),
                Text("GOOD FOR YOU,GOOD FOR YOUR HEALTH",
                style: GoogleFonts.inder(fontSize:13,color:Colors.white )),
                const SizedBox(height: 70,),  
                
                   
                   Container(
                    
                    height: 35,
                    width: 200,
                  
                    decoration:  BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(17),
                      border: Border.all(color: Colors.white),
            
                    ),
                    child:  Center(child: TextButton(onPressed: ()
                    {
                      Navigator.push(context,MaterialPageRoute(builder: (context) =>  LoginScreen()) );
                    }, 
                    child: const Text("SIGN IN",style: TextStyle(color: Color(0xff166F31),fontWeight: 
                    FontWeight.bold),))),
                   ),
                   const SizedBox(height: 20,),
                    Container(
                    height: 35,
                    width: 200,
                    decoration:  BoxDecoration(
                      borderRadius: BorderRadius.circular(17),
                      border: Border.all(color: Colors.white),
            
                    ),
                    child:  Center(child: TextButton(
                      onPressed: (){
                        Navigator.push(context,MaterialPageRoute(builder: (context) =>  RegisterScreen()) );

                    }, 
                    child: const Text("SIGN UP",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),))),
                   ),
                     const SizedBox(height: 70,),
                  GestureDetector(
                    onTap: () {
                       Navigator.push(context,MaterialPageRoute(builder: (context) =>   SellerLogin()) );
                    },
                    child: Text("Do you want to show case your product",
                    style: GoogleFonts.inder(fontSize:13,color:Colors.white ),))
                   
               ],
            ),
          ),
        ),
      
    );
  }
}