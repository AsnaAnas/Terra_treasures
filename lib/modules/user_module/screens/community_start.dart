import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:terra_treasures/modules/user_module/screens/forum.dart';
import 'package:terra_treasures/util/constants.dart';

class CommunityStart extends StatelessWidget {
  const CommunityStart({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: bgColor,
     body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 180,),
        child: Padding(
          padding: const EdgeInsets.only(left: 30,),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20),
                child: RichText(
                        textAlign: TextAlign.center,
                         text:  TextSpan(
                           text: 'Connect with your community\n\n',
                           style: GoogleFonts.inder(color: Colors.black,fontSize: 22,fontWeight:FontWeight.w300),
                           children:  <TextSpan>[
                            
                             TextSpan(
                               text: "SEARCH CONNECT & SHARE\n\n",
                                style: GoogleFonts.inder(color: Colors.black,fontSize: 18),
                             ),
                             TextSpan(
                               text: "2,345\n",
                                style: GoogleFonts.inder(color: Colors.black,fontSize: 24,fontWeight:FontWeight.w700),
                             ),
                             TextSpan(
                               text: "community forum",
                                style: GoogleFonts.inder(color: Colors.black,fontSize: 13,),
                             ),
                           ],
                         ),
                       ),
              ),
              const SizedBox(height: 50,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: kPrimaryColor
                ),
                onPressed: (){
                   Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ForumPage()),
              );
                }, 
              child: Text("Start with community",
               style: GoogleFonts.inder(color: Colors.white,fontSize: 13,fontWeight:FontWeight.w700),))
            ],
          ),
        ),
      )),
    );
  }
}