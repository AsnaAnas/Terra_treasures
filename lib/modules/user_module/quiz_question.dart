import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:terra_treasures/util/constants.dart';

class QuestionPage extends StatelessWidget {
  const QuestionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: bgColor,
            ),
            height: 200,
           child: AppBar(
            backgroundColor: kPrimaryColor,
            leading: IconButton(onPressed: (){}, 
            icon: const Icon(Icons.arrow_circle_left_outlined,size: 30,color: Colors.white,)),
            title: Text("Quiz",style: GoogleFonts.inder(color:Colors.white,fontSize:24,),),
            centerTitle: true,
            elevation: 0,
              actions:  const [
          Padding(padding: EdgeInsets.only(right: 20,top: 20),
          child: InkWell(
           // onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=> const HomeScreen())),
            child: Text('Skip',style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,fontWeight: FontWeight.w400),
              ),
          ),),
        ],
           ),
          ),
           Padding(
             padding: const EdgeInsets.only(top: 100,),
             child: Card(
              margin: const EdgeInsets.fromLTRB(30,20,30,120),
              child: ListView(
                children: [
                  const SizedBox(height: 30,),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20,),
                        child: Text("Which of these is a non-renewable resource?",
                        style: GoogleFonts.inder(color:Colors.black,fontSize:18,)),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(20, 30, 20, 0),
                        height: 50,
                        width: 250,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 30,right: 100,),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 26,
                                width: 26,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  border: Border.all(color: Colors.grey),
                                ),
                              ),
                              Text("Sun",style:GoogleFonts.inder(color:Colors.black,fontSize:16,) ,)
                            ],
                          ),
                        ),
                      ),
                       Container(
                        margin: const EdgeInsets.fromLTRB(20, 30, 20, 0),
                        height: 50,
                        width: 250,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 30,right: 100,),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 26,
                                width: 26,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  border: Border.all(color: Colors.grey),
                                ),
                              ),
                              Text("Moon",style:GoogleFonts.inder(color:Colors.black,fontSize:16,) ,)
                            ],
                          ),
                        ),
                      ),
                       Container(
                        margin: const EdgeInsets.fromLTRB(20, 30, 20, 0),
                        height: 50,
                        width: 250,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 30,right: 100,),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 26,
                                width: 26,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  border: Border.all(color: Colors.grey),
                                ),
                              ),
                              Text("Coal",style:GoogleFonts.inder(color:Colors.black,fontSize:16,) ,)
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 70,),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: kPrimaryColor,
                          fixedSize: const Size(200, 35)
                        ),
                        onPressed: (){}, 
                      child:  Text("Next",
                      style: GoogleFonts.inder(color:Colors.white,fontSize:16,) ,))
                    ],
                  )
                ],
              ),
              ),
           ),
           
        ],
      ),
    );
  }
}