import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:terra_treasures/modules/user_module/home.dart';
import 'package:terra_treasures/util/constants.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
   
    return  Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        leading: IconButton(onPressed: (){
           Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),
              );
        },
         icon: const Icon(Icons.arrow_circle_left_outlined,color: Colors.white,)),
         title: Text(
          "Notification",
          style: GoogleFonts.inder(
            color:Colors.white
          ),),
          centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15,right: 15,),
              child: Align(
                alignment: Alignment.topRight,
                child: Text(
                  "Show All",
                  style: GoogleFonts.inder(
                    color:Colors.grey
                  ),),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: 
                    Text("TODAY",
                  style: GoogleFonts.inder( ),),
                  ),
                ),
                
                ListTile(
                  leading: Image.asset("assets/log.png"),
                  title:  Text("Hello Welcome!\nThank You for choosing this application",
                  textAlign:TextAlign.left,
                  style: GoogleFonts.inder(
                    fontSize:15,
                  ),),
                  
                ),
                Divider(),
                ListTile(
                  leading: Image.asset("assets/log.png"),
                  title:  Text("Join a vibrant community of individuals passionate about protecting our planet. Share ideas, offer support, and celebrate each other's successes.",
                  textAlign:TextAlign.left,
                  style: GoogleFonts.inder(
                    fontSize:15,
                  ),),
                  
                ),
                Divider(),
              ],
            ),
          ],
        ),
      )
    );
  }
}