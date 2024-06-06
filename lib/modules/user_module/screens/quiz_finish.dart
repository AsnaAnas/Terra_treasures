import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:terra_treasures/modules/user_module/screens/profile.dart';
import 'package:terra_treasures/modules/user_module/screens/quiz_home.dart';
import 'package:terra_treasures/util/constants.dart';

class QuizFinish extends StatelessWidget {
  const QuizFinish({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        leading: IconButton(onPressed: (){
          // Navigator.push(
          //       context,
          //       MaterialPageRoute(builder: (context) => const QuizHome()),
          //     );
        }, 
        icon: const Icon(Icons.arrow_circle_left_outlined,color: Colors.white,size: 30,)),
        actions:  [
         IconButton(onPressed: (){
          // Navigator.push(
          //       context,
          //       MaterialPageRoute(builder: (context) => const QuizHome()),
          //     );
         }, icon: const Icon(Icons.close,color: Colors.white,))
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 30,right: 30),
            child: Container(
              height: 500,
              width: 500,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(29)
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 50,),
                child: Column(
                  children: [
                    Text("GREAT JOB",style: GoogleFonts.limelight(color:Colors.red,fontSize:42),),
                    const SizedBox(height: 40,),
                    Text("You eraned etra points",style: GoogleFonts.inder(color:Colors.black,fontSize:16)),
                    Image.asset("assets/coin.png"),
                    SizedBox(height: 50,),
                    Padding(
                      padding: const EdgeInsets.only(top: 30,left: 20,right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height:90 ,
                            width: 90,
                            decoration:  BoxDecoration(
                              color: const Color(0xffFBBC05),
                              borderRadius: BorderRadius.circular(17)
                            ),
                           child: Row(
                            children:  [
                              Padding(
                                padding: const EdgeInsets.only(left: 10,top: 10),
                                child: Column(
                                  children: [
                                    Text("10",style:  GoogleFonts.inder(color:Colors.white,fontSize:16),),
                                    Text("Question",style:  GoogleFonts.inder(color:Colors.white,fontSize:16),)
                                  ],
                                ),
                              )
                              
                            ],
                           ),
                          ),
                          Container(
                            height:90 ,
                            width: 90,
                            decoration:  BoxDecoration(
                              color: const Color(0xff00DC58),
                              borderRadius: BorderRadius.circular(17)
                            ),
                          child: Row(
                            children:  [
                              Padding(
                                padding: const EdgeInsets.only(left: 10,top: 10),
                                child: Column(
                                  children: [
                                    Text("7",style:  GoogleFonts.inder(color:Colors.white,fontSize:16),),
                                    Text("Correct",style:  GoogleFonts.inder(color:Colors.white,fontSize:16),)
                                  ],
                                ),
                              )
                              
                            ],
                           ),
                          ),Container(
                            height:90 ,
                            width: 90,
                            decoration:  BoxDecoration(
                              color: const Color(0xffFB0505),
                              borderRadius: BorderRadius.circular(17)
                            ),
                           child: Row(
                            children:  [
                              Padding(
                                padding: const EdgeInsets.only(left: 10,top: 10),
                                child: Column(
                                  children: [
                                    Text("3",style:  GoogleFonts.inder(color:Colors.white,fontSize:16),),
                                    Text("Incorrect",style:  GoogleFonts.inder(color:Colors.white,fontSize:16),)
                                  ],
                                ),
                              )
                              
                            ],
                           ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 30,),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kPrimaryColor
                      ),
                      onPressed: (){
              //           Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => const ProfilePage()),
              // );
                      }, 
                    child: Text("Check Your Points",style: GoogleFonts.inder(color:Colors.white,fontSize:16),))
                  ],
                ),
              ),
            ),
          ),
        )
      ),
    );
  }
}