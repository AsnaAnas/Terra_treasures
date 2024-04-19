import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:terra_treasures/util/constants.dart';

class EducationContent extends StatelessWidget {
  const EducationContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        leading: const Padding(
          padding: EdgeInsets.only(top: 15,left: 20,),
          child: CircleAvatar(
            backgroundImage:AssetImage("assets/user_avtar.png"),
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(top: 15,left: 30,),
          child: Text("Example",
          style: GoogleFonts.inder(),),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text("Post",
            style: GoogleFonts.inder(color:const Color(0xff0FA779)),),
          )
        ],
      ),
      body:   SingleChildScrollView(
        child: Column(
          children: [
            const Divider(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  const CircleAvatar(),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Text("Demo Name",
                    style: GoogleFonts.inder(),),
                  )
                ],
              ),
            ),
            Image.asset('assets/img.png'),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(onPressed: (){}, icon: Icon(Icons.favorite_border_outlined)),
                IconButton(onPressed: (){}, icon: Icon(Icons.comment)),
                IconButton(onPressed: (){}, icon: Icon(Icons.share)),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  const CircleAvatar(),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Text("Demo Name",
                    style: GoogleFonts.inder(),),
                  )
                ],
              ),
            ),
            Image.asset('assets/image.png'),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(onPressed: (){}, icon: const Icon(Icons.favorite_border_outlined)),
                IconButton(onPressed: (){}, icon: const Icon(Icons.comment)),
                IconButton(onPressed: (){}, icon: const Icon(Icons.share)),
              ],
            )
            // ListTile(
            //   leading: const CircleAvatar(),
            //   title: Text("Demo Name",
            //   style: GoogleFonts.inder(),),
              
            // )
          ],
        ),
      ),
    );
  }
}