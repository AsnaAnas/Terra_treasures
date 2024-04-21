import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:terra_treasures/util/constants.dart';
import 'package:terra_treasures/util/tabview.dart';

class ForumDetails extends StatelessWidget {
  const ForumDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        leading: IconButton(onPressed: (){},
         icon: const Icon(Icons.arrow_circle_left_outlined)),
         title: Padding(
           padding: const EdgeInsets.only(top: 10,),
           child: Image.asset("assets/forum.png"),
         ),
        actions: [
           Padding(
             padding: const EdgeInsets.only(right: 40,top: 10,),
             child: Text("The Green Gaurdian",style: GoogleFonts.inder(fontSize:20),),
           ),
        ],
         bottom: PreferredSize(
            preferredSize: const Size.fromHeight(40),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: Container(
                height: 40,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  color: Colors.green.shade100,
                ),
                child: const TabBar(
                  indicatorSize: TabBarIndicatorSize.tab,
                  dividerColor: Colors.transparent,
                  indicator: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black54,
                  tabs: [
                    TabItem(title: 'New Post', count: 6),
                    TabItem(title: 'Announcement', count: 3),
                    TabItem(title: 'Features', count: 1),
                    TabItem(title: 'Discussion', count: 1),
                  ],
                ),
              ),
            ),
          ),
      ),
      body: const TabBarView(
          children: [
            Center(child: Text('Inbox Page')),
            Center(child: Text('Archived Page')),
            Center(child: Text('Deleted Page')),
          ],
        ),
    );
  }
}