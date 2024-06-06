import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:terra_treasures/modules/user_module/screens/home.dart';
import 'package:terra_treasures/util/constants.dart';

class QuizHome extends StatelessWidget {
  
  const QuizHome({super.key});

  @override
  Widget build(BuildContext context) {
  // final  myImageAndCaption = [
  //     ["assets/images/banane.jpg", ],
  //     ["assets/images/banane.jpg", ],
  //     ["assets/images/banane.jpg", ],
  //     ["assets/images/banane.jpg", ],
      
  //   ];
  //   final title=[
  //    "Sustainability",
  //    "Sustainability & Biodiversity",
  //    "Sustainability & Textile",
  //    "Sustainability & Recycling"
  //   ];
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        toolbarHeight: 200,
        backgroundColor: kPrimaryColor,
        leading: IconButton(onPressed: (){
           Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  HomeScreen()),
              );
        }, 
        icon: const Icon(Icons.arrow_circle_left_outlined,color: Colors.white,size: 30,)),
        title:  Text("Quiz",
        style: GoogleFonts.inder(color:Colors.white,fontSize:24,),),
        centerTitle: true,
      ),
     body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Text("categories",
            style: GoogleFonts.inder(color:Colors.black,fontSize:24,),),
            const SizedBox(height: 20,),
            GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
              shrinkWrap: true,
              children:List.generate(4, (index) => 
              Container(
                height: 90,
                width: 90,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(17),
                  border: Border.all(color: Colors.grey)
                ),
               child: Stack(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 100,left: 30,right: 30),
                    child: Text("Sustainability"),
                  ),
                  Image.asset('assets/quiz1.png'),
                ],
               ),
              ))
              )
          ],
        ),
      ),
     ),
    );
  }
}