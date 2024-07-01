
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:terra_treasures/modules/user_module/screens/quiz_home.dart';
// import 'package:terra_treasures/modules/user_module/screens/quiz_question.dart';
// import 'package:terra_treasures/util/constants.dart';

// class QuizStart extends StatelessWidget {
//   final String selectedCategory;

//   const QuizStart({super.key, required this.selectedCategory});

//   Future<int> fetchQuestionCount(String category) async {
//     final querySnapshot = await FirebaseFirestore.instance
//         .collection('quiz')
//         .where('category', isEqualTo: category)
//         .get();
//     return querySnapshot.size;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Container(
//             decoration: const BoxDecoration(color: bgColor),
//             height: 200,
//             child: AppBar(
//               backgroundColor: kPrimaryColor,
//               leading: IconButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => const QuizHome()),
//                   );
//                 },
//                 icon: const Icon(Icons.arrow_circle_left_outlined, size: 30, color: Colors.white),
//               ),
//               title: Text(
//                 "Quiz",
//                 style: GoogleFonts.inder(color: Colors.white, fontSize: 24),
//               ),
//               elevation: 0,
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(top: 100),
//             child: Card(
//               margin: const EdgeInsets.fromLTRB(30, 20, 30, 70),
//               child: FutureBuilder<int>(
//                 future: fetchQuestionCount(selectedCategory),
//                 builder: (context, snapshot) {
//                   if (snapshot.connectionState == ConnectionState.waiting) {
//                     return Center(child: CircularProgressIndicator());
//                   } else if (snapshot.hasError) {
//                     return Center(child: Text('Error: ${snapshot.error}'));
//                   } else {
//                     final questionCount = snapshot.data ?? 0;
//                     return ListView(
//                       children: [
//                         Column(
//                           children: [
//                             Text(
//                               "Quiz Found",
//                               style: GoogleFonts.inder(color: Colors.black, fontSize: 24),
//                             ),
//                             const SizedBox(height: 50),
//                             Text(
//                               "About Quiz",
//                               style: GoogleFonts.inder(color: Colors.grey, fontSize: 18),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
//                               child: Container(
//                                 height: 160,
//                                 width: 300,
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(17),
//                                   border: Border.all(color: Colors.grey),
//                                 ),
//                                 child: Column(
//                                   children: [
//                                     ListTile(
//                                       leading: Text(
//                                         "Quiz Type",
//                                         style: GoogleFonts.inder(color: Colors.black, fontSize: 16),
//                                       ),
//                                       trailing: Text(
//                                         ": MCQ",
//                                         style: GoogleFonts.inder(color: Colors.black, fontSize: 16),
//                                       ),
//                                     ),
                                    
//                                     ListTile(
//                                       leading: Text(
//                                         "Number of questions",
//                                         style: GoogleFonts.inder(color: Colors.black, fontSize: 16),
//                                       ),
//                                       trailing: Text(
//                                         ": $questionCount",
//                                         style: GoogleFonts.inder(color: Colors.black, fontSize: 16),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(height: 90),
//                             ElevatedButton(
//                               style: ElevatedButton.styleFrom(
//                                 backgroundColor: kPrimaryColor,
//                                 fixedSize: const Size(200, 30),
//                               ),
//                               onPressed: () {
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(builder: (context) => const QuestionPage()),
//                                 );
//                               },
//                               child: Text(
//                                 "Start Quiz",
//                                 style: GoogleFonts.inder(color: Colors.white, fontSize: 16),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     );
//                   }
//                 },
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }



import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:terra_treasures/modules/user_module/screens/quiz_home.dart';
import 'package:terra_treasures/modules/user_module/screens/quiz_question.dart';
import 'package:terra_treasures/util/constants.dart';

class QuizStart extends StatelessWidget {
  final String selectedCategory;

  const QuizStart({super.key, required this.selectedCategory});

  Future<int> fetchQuestionCount(String category) async {
    final querySnapshot = await FirebaseFirestore.instance
        .collection('quiz')
        .where('category', isEqualTo: category)
        .get();
    return querySnapshot.size;
  }

  @override
  Widget build(BuildContext context) {
    log(selectedCategory);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(color: bgColor),
            height: 200,
            child: AppBar(
              backgroundColor: kPrimaryColor,
              leading: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const QuizHome()),
                  );
                },
                icon: const Icon(Icons.arrow_circle_left_outlined, size: 30, color: Colors.white),
              ),
              title: Text(
                "Quiz",
                style: GoogleFonts.inder(color: Colors.white, fontSize: 24),
              ),
              elevation: 0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Card(
              margin: const EdgeInsets.fromLTRB(30, 20, 30, 70),
              child: FutureBuilder<int>(
                future: fetchQuestionCount(selectedCategory),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else {
                    final questionCount = snapshot.data ?? 0;
                    log(questionCount.toString());
                    return ListView(
                      children: [
                        Column(
                          children: [
                            Text(
                              "Quiz Found",
                              style: GoogleFonts.inder(color: Colors.black, fontSize: 24),
                            ),
                            const SizedBox(height: 50),
                            Text(
                              "About Quiz",
                              style: GoogleFonts.inder(color: Colors.grey, fontSize: 18),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
                              child: Container(
                                height: 100,
                                width: 300,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(17),
                                  border: Border.all(color: Colors.grey),
                                ),
                                child: Column(
                                  children: [
                                    ListTile(
                                      leading: Text(
                                        "Quiz Type",
                                        style: GoogleFonts.inder(color: Colors.black, fontSize: 16),
                                      ),
                                      trailing: Text(
                                        ": MCQ",
                                        style: GoogleFonts.inder(color: Colors.black, fontSize: 16),
                                      ),
                                    ),
                                    // ListTile(
                                    //   leading: Text(
                                    //     "Number of questions",
                                    //     style: GoogleFonts.inder(color: Colors.black, fontSize: 16),
                                    //   ),
                                    //   trailing: Text(
                                    //     ": $questionCount",
                                    //     style: GoogleFonts.inder(color: Colors.black, fontSize: 16),
                                    //   ),
                                    // ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 90),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: kPrimaryColor,
                                fixedSize: const Size(200, 30),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => QuestionPage(category: selectedCategory)),
                                );
                              },
                              child: Text(
                                "Start Quiz",
                                style: GoogleFonts.inder(color: Colors.white, fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
