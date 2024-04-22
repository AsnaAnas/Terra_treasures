import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:terra_treasures/modules/user_module/screens/forum_details.dart';
import 'package:terra_treasures/modules/user_module/screens/home.dart';
import 'package:terra_treasures/util/constants.dart';

class ForumPage extends StatelessWidget {
  const ForumPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        leading: IconButton(onPressed: (){
           Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),
              );
        },
         icon: const Icon(Icons.arrow_circle_left_outlined)),
         title:  Text("Forum",style: GoogleFonts.inder(color: Colors.black,fontSize: 24,),),
         centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40,left: 30,right: 30),
              child:GestureDetector(
                onTap: () {
                   Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ForumDetails()),
              );
                },
                child: Container(
                  height: 100,
                  width: 400,
                  decoration:  BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(17),
                    border: Border.all(color: Colors.grey.shade300)
                  ),
                  child: ListTile(
                    leading: Image.asset("assets/forum.png"),
                    title: Text("The Green Gaurdian",style: GoogleFonts.inder(),),
                    trailing:  Text("Follow",style: GoogleFonts.inder(color:const Color(0xff0FA779)),)
                  ),
                ),
              ),
            ),
             Padding(
              padding: const EdgeInsets.only(top: 40,left: 30,right: 30),
              child: Container(
                height: 100,
                width: 400,
                decoration:  BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(17),
                  border: Border.all(color: Colors.grey.shade300)
                ),
                child: ListTile(
                  leading: Image.asset("assets/forum1.png"),
                  title: Text(" Green Agora",style: GoogleFonts.inder(),),
                  trailing:  Text("Follow",style: GoogleFonts.inder(color:const Color(0xff0FA779)),)
                ),
              ),
            ), Padding(
              padding: const EdgeInsets.only(top: 40,left: 30,right: 30),
              child: Container(
                height: 100,
                width: 400,
                decoration:  BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(17),
                  border: Border.all(color: Colors.grey.shade300)
                ),
                child: ListTile(
                  leading: Image.asset("assets/forum.png"),
                  title: Text("The Green Gaurdian",style: GoogleFonts.inder(),),
                  trailing:  Text("Follow",style: GoogleFonts.inder(color:const Color(0xff0FA779)),)
                ),
              ),
            ),
             Padding(
              padding: const EdgeInsets.only(top: 40,left: 30,right: 30),
              child: Container(
                height: 100,
                width: 400,
                decoration:  BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(17),
                  border: Border.all(color: Colors.grey.shade300)
                ),
                child: ListTile(
                  leading: Image.asset("assets/forum.png"),
                  title: Text("The Green Gaurdian",style: GoogleFonts.inder(),),
                  trailing:  Text("Follow",style: GoogleFonts.inder(color:const Color(0xff0FA779)),)
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}