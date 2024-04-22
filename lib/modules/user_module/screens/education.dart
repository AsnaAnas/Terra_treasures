import 'package:floating_bottom_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:terra_treasures/modules/user_module/screens/cartpage.dart';
import 'package:terra_treasures/modules/user_module/screens/quiz_home.dart';
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
           
          ],
        ),
      ),
       bottomNavigationBar:  AnimatedBottomNavigationBar(
          barColor: kPrimaryColor,
          bottomBarCenterModel: BottomBarCenterModel(
            centerBackgroundColor: Colors.white,
            centerIcon: const FloatingCenterButton(
              child: Icon(Icons.move_up_rounded,color: kPrimaryColor,),), 
            centerIconChild: [
              FloatingCenterButtonChild(
                child: const Icon(Icons.school,color: kPrimaryColor,),
                onTap: () {
                  Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const EducationContent()),
              );
                },
                ),
                FloatingCenterButtonChild(
                child: const Icon(Icons.shopping_bag_outlined,color:kPrimaryColor),
                onTap: () {
                  Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CartPage()),
              );
                },
                ),
                FloatingCenterButtonChild(
                child: const Icon(Icons.quiz,color: kPrimaryColor,),
                onTap: () {
                  Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const QuizHome()),
              );
                },
                ),
                FloatingCenterButtonChild(
                child: const Icon(Icons.question_mark_outlined,color: kPrimaryColor,),
                onTap: () {
                  
                },
                )

            ]), 
          bottomBar: const [
              BottomBarItem(
                icon: Icon(Icons.home,color: Colors.white,),
                 iconSelected: Icon(Icons.home),title: "Home",
                 titleStyle:TextStyle(color: AppColors.white),
                 dotColor: Colors.white
                 ),
                 BottomBarItem(
                icon: Icon(Icons.people_alt,color: Colors.white,),
                 iconSelected: Icon(Icons.people_alt),title: "Community",
                 titleStyle:TextStyle(color: AppColors.white),
                 dotColor: Colors.white) ,
                
          ]),
        
    );
  }
}