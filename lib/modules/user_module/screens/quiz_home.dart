// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:terra_treasures/modules/user_module/screens/home.dart';
// import 'package:terra_treasures/util/constants.dart';

// class QuizHome extends StatelessWidget {

//   const QuizHome({super.key});

//   @override
//   Widget build(BuildContext context) {

//     return Scaffold(
//       backgroundColor: bgColor,
//       appBar: AppBar(
//         toolbarHeight: 200,
//         backgroundColor: kPrimaryColor,
//         leading: IconButton(onPressed: (){
//            Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) =>  HomeScreen()),
//               );
//         },
//         icon: const Icon(Icons.arrow_circle_left_outlined,color: Colors.white,size: 30,)),
//         title:  Text("Quiz",
//         style: GoogleFonts.inder(color:Colors.white,fontSize:24,),),
//         centerTitle: true,
//       ),
//      body: SingleChildScrollView(
//       child: Padding(
//         padding: const EdgeInsets.all(10),
//         child: Column(
//           children: [
//             Text("categories",
//             style: GoogleFonts.inder(color:Colors.black,fontSize:24,),),
//             const SizedBox(height: 20,),
//             GridView.count(
//               crossAxisCount: 2,
//               crossAxisSpacing: 10.0,
//               mainAxisSpacing: 10.0,
//               shrinkWrap: true,
//               children:List.generate(4, (index) =>
//               Container(
//                 height: 90,
//                 width: 90,
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(17),
//                   border: Border.all(color: Colors.grey)
//                 ),
//                child: Stack(
//                 children: [
//                   const Padding(
//                     padding: EdgeInsets.only(top: 100,left: 30,right: 30),
//                     child: Text("Sustainability"),
//                   ),
//                   Image.asset('assets/quiz1.png'),
//                 ],
//                ),
//               ))
//               )
//           ],
//         ),
//       ),
//      ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:terra_treasures/modules/user_module/screens/home.dart';
import 'package:terra_treasures/modules/user_module/screens/quiz_start.dart';
import 'package:terra_treasures/util/constants.dart';

class QuizHome extends StatelessWidget {
  const QuizHome({super.key});

  Future<List<String>> fetchQuizCategories() async {
    final querySnapshot =
        await FirebaseFirestore.instance.collection('quiz').get();
    final categories = querySnapshot.docs
        .map((doc) => doc['category'] as String)
        .toSet()
        .toList(); // Convert to set to remove duplicates, then back to list
    return categories;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        toolbarHeight: 200,
        backgroundColor: kPrimaryColor,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          },
          icon: const Icon(Icons.arrow_circle_left_outlined,
              color: Colors.white, size: 30),
        ),
        title: Text(
          "Quiz",
          style: GoogleFonts.inder(color: Colors.white, fontSize: 24),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<List<String>>(
        future: fetchQuizCategories(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No categories found'));
          } else {
            final categories = snapshot.data!;
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Text(
                      "Categories",
                      style:
                          GoogleFonts.inder(color: Colors.black, fontSize: 24),
                    ),
                    const SizedBox(height: 20),
                    GridView.builder(
                      itemCount: categories.length,
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 10.0,
                      ),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => QuizStart(selectedCategory: categories.toString(),)),
                            );
                          },
                          child: Container(
                            height: 90,
                            width: 90,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(17),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 100, left: 30, right: 30),
                                  child: Text(categories[index]),
                                ),
                                Image.asset(
                                    'assets/quiz1.png'), // Make sure you have this asset
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
