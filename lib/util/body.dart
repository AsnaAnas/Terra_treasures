import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:terra_treasures/util/button.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return  Center(
      
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Welcome",
            style: GoogleFonts.inknutAntiqua(fontSize:30,color:Colors.green),
            ),
            SvgPicture.asset("assets/welc.svg",
            height: size.height*0.35,),

            Container(
              width: size.width*0.8,
              child:  ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child:  Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40,horizontal: 40),
                 child: Column(
                   children: [
                     ButtonPage(onPressed: (){},text: "Login",),
                     const SizedBox(height: 20,),
                     Container(
                      height: 35,
                    width: 200,
                      decoration:  BoxDecoration(
                      borderRadius: BorderRadius.circular(17),
                      border: Border.all(color: const Color(0xff166F31)),
            
                    ),
                     child:  Center(child: TextButton(
                      onPressed: (){
                        //Navigator.push(context,MaterialPageRoute(builder: (context) =>  RegisterScreen()) );

                    }, 
                    child:  Text("Register",
                    style: GoogleFonts.inknutAntiqua(fontSize:17,color:const Color(0xff166F31))))),
                     )
                    //  ButtonPage(onPressed: (){}, text: "Register",)
                   ],
                 ),
                  // child: ElevatedButton(onPressed: (){}, 
                  // child: Text("Login",
                  // style:GoogleFonts.inknutAntiqua(fontSize:17,) ,)
                  // ),
                  
                ),

              ),
            ),

          ],
        ),
    
    );
  }
}