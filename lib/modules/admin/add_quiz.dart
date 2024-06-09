
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:terra_treasures/modules/admin/admin_home.dart';

// import 'package:terra_treasures/modules/admin/view_buyer.dart';
// import 'package:terra_treasures/modules/admin/view_seller.dart';
// import 'package:terra_treasures/util/constants.dart';

// class AddQuiz extends StatefulWidget {
//   const AddQuiz({super.key});

//   @override
//   State<AddQuiz> createState() => _AddQuizState();
// }

// class _AddQuizState extends State<AddQuiz> {
//   String? selectedCategory;
//   String? correctAnswer;
//   final List<String> categories = [
//     'Sustainability',
//     'Sustainability&Biodiversity',
//     'Sustainability&Textile',
//     'Sustainability&recycling'
//   ];

//   final TextEditingController questionController = TextEditingController();
//   final TextEditingController option1Controller = TextEditingController();
//   final TextEditingController option2Controller = TextEditingController();
//   final TextEditingController option3Controller = TextEditingController();
//   final TextEditingController option4Controller = TextEditingController();

//   final _formKey = GlobalKey<FormState>();

//   void _submitQuiz() {
//     if (_formKey.currentState!.validate()) {
//       // Collect the data
//       final String question = questionController.text;
//       final String option1 = option1Controller.text;
//       final String option2 = option2Controller.text;
//       final String option3 = option3Controller.text;
//       final String option4 = option4Controller.text;

//       // Example collection to store quiz data
//       final Map<String, dynamic> quizData = {
//         'category': selectedCategory,
//         'question': question,
//         'options': [option1, option2, option3, option4],
//         'correctAnswer': correctAnswer,
//       };

//       // You can store `quizData` in your desired collection/database here
//       print('Quiz Data: $quizData');

//       // Clear the form
//       questionController.clear();
//       option1Controller.clear();
//       option2Controller.clear();
//       option3Controller.clear();
//       option4Controller.clear();
//       setState(() {
//         selectedCategory = null;
//         correctAnswer = null;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Container(
//             height: double.infinity,
//             width: double.infinity,
//             decoration: const BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage("assets/admin_back.png"),
//                 fit: BoxFit.fill,
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(
//               top: 50,
//               bottom: 50,
//               left: 60,
//             ),
//             child: SingleChildScrollView(
//               child: Container(
//                 width: 900,
//                 height: 800,
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(15),
//                 ),
//                 child: Column(
//                   children: [
//                     AppBar(
//                       leading: Image.asset('assets/logo.png'),
//                       title: Text(
//                         "Terra Treasure",
//                         style: GoogleFonts.philosopher(fontSize: 22),
//                       ),
//                       actions: [
//                         Padding(
//                           padding: const EdgeInsets.all(10),
//                           child: InkWell(
//                             onTap: () {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) => const AdminHome()),
//                               );
//                             },
//                             child: Text(
//                               "Home",
//                               style: GoogleFonts.inder(),
//                             ),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(10),
//                           child: InkWell(
//                             onTap: () {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) => const ViewBuyer()),
//                               );
//                             },
//                             child: Text(
//                               "View Buyer",
//                               style: GoogleFonts.inder(),
//                             ),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(10),
//                           child: InkWell(
//                             onTap: () {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) => const ViewSeller()),
//                               );
//                             },
//                             child: Text(
//                               "View Seller",
//                               style: GoogleFonts.inder(),
//                             ),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(10),
//                           child: Container(
//                             width: 80,
//                             height: 40,
//                             alignment: Alignment.center,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(15),
//                               color: kPrimaryColor,
//                             ),
//                             child: Text(
//                               "Add quiz",
//                               style: GoogleFonts.inder(color: Colors.white),
//                             ),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(10),
//                           child: Text(
//                             "Logout",
//                             style: GoogleFonts.inder(),
//                           ),
//                         ),
//                       ],
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(top: 30),
//                       child: Expanded(
//                         child: Center(
//                           child: SingleChildScrollView(
//                             child: Form(
//                               key: _formKey,
//                               child: Column(
//                                 children: [
//                                   Text(
//                                     "Add Quiz",
//                                     style: GoogleFonts.inder(fontSize: 24),
//                                   ),
//                                   const SizedBox(
//                                     height: 30,
//                                   ),
//                                   Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceEvenly,
//                                     children: [
//                                       Text(
//                                         "Select category",
//                                         style: GoogleFonts.inder(),
//                                       ),
//                                       Center(
//                                         child: DropdownButton<String>(
//                                           hint: Text(
//                                             'Select category',
//                                             style: GoogleFonts.inder(),
//                                           ),
//                                           value: selectedCategory,
//                                           onChanged: (String? newValue) {
//                                             setState(() {
//                                               selectedCategory = newValue;
//                                             });
//                                           },
//                                           items: categories
//                                               .map<DropdownMenuItem<String>>(
//                                                   (String value) {
//                                             return DropdownMenuItem<String>(
//                                               value: value,
//                                               child: Text(value),
//                                             );
//                                           }).toList(),
//                                         ),
//                                       )
//                                     ],
//                                   ),
//                                   const SizedBox(
//                                     height: 30,
//                                   ),
//                                   Padding(
//                                     padding: const EdgeInsets.symmetric(
//                                         horizontal: 16.0),
//                                     child: Padding(
//                                       padding: const EdgeInsets.only(
//                                         left: 210,
//                                         right: 100,
//                                       ),
//                                       child: Column(
//                                         children: [
//                                           _buildTextField(
//                                               "Question", questionController),
//                                           const SizedBox(height: 20),
//                                           _buildTextField(
//                                               "Option 1", option1Controller),
//                                           const SizedBox(height: 20),
//                                           _buildTextField(
//                                               "Option 2", option2Controller),
//                                           const SizedBox(height: 20),
//                                           _buildTextField(
//                                               "Option 3", option3Controller),
//                                           const SizedBox(height: 20),
//                                           _buildTextField(
//                                               "Option 4", option4Controller),
//                                           const SizedBox(height: 20),
//                                           Row(
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.spaceEvenly,
//                                             children: [
//                                               Text(
//                                                 "Correct Answer",
//                                                 style: GoogleFonts.inder(),
//                                               ),
//                                               DropdownButton<String>(
//                                                 hint: Text(
//                                                   'Select correct answer',
//                                                   style: GoogleFonts.inder(),
//                                                 ),
//                                                 value: correctAnswer,
//                                                 onChanged: (String? newValue) {
//                                                   setState(() {
//                                                     correctAnswer = newValue;
//                                                   });
//                                                 },
//                                                 items: [
//                                                   option1Controller.text,
//                                                   option2Controller.text,
//                                                   option3Controller.text,
//                                                   option4Controller.text
//                                                 ].map<DropdownMenuItem<String>>(
//                                                     (String value) {
//                                                   return DropdownMenuItem<String>(
//                                                     value: value,
//                                                     child: Text(value),
//                                                   );
//                                                 }).toList(),
//                                               ),
//                                             ],
//                                           ),
//                                           const SizedBox(height: 20),
//                                           ElevatedButton(
//                                             style: ElevatedButton.styleFrom(
//                                               backgroundColor: kPrimaryColor
//                                             ),
//                                             onPressed: _submitQuiz,
//                                             child: Text("Submit",style: GoogleFonts.inder(color:Colors.white),),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildTextField(
//       String labelText, TextEditingController controller) {
//     return Row(
//       children: [
//         Expanded(
//           child: Text(
//             labelText,
//             style: GoogleFonts.inder(),
//           ),
//         ),
//         const SizedBox(width: 20),
//         SizedBox(
//           width: 300,
//           child: TextFormField(
//             controller: controller,
//             decoration: InputDecoration(
//               labelText: 'Enter $labelText',
//               labelStyle: GoogleFonts.inder(color: Colors.grey),
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               filled: true,
//               fillColor: Colors.white,
//             ),
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Please enter $labelText';
//               }
//               return null;
//             },
//             onChanged: (value) {
//               setState(() {});
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:terra_treasures/model/quiz_model.dart';
import 'package:terra_treasures/modules/admin/admin_home.dart';
import 'package:terra_treasures/modules/admin/controller/quiz_controller.dart';
import 'package:terra_treasures/modules/admin/view_buyer.dart';
import 'package:terra_treasures/modules/admin/view_seller.dart';
import 'package:terra_treasures/util/constants.dart';
 // Import the controller

class AddQuiz extends StatefulWidget {
  const AddQuiz({super.key});

  @override
  State<AddQuiz> createState() => _AddQuizState();
}

class _AddQuizState extends State<AddQuiz> {
  String? selectedCategory;
  String? correctAnswer;
  final List<String> categories = [
    'Sustainability',
    'Sustainability&Biodiversity',
    'Sustainability&Textile',
    'Sustainability&Recycling'
  ];

  final TextEditingController questionController = TextEditingController();
  final TextEditingController option1Controller = TextEditingController();
  final TextEditingController option2Controller = TextEditingController();
  final TextEditingController option3Controller = TextEditingController();
  final TextEditingController option4Controller = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final QuizController _quizController = QuizController();  // Create an instance of the controller

  void _submitQuiz() async {
    if (_formKey.currentState!.validate()) {
      // Collect the data
      final String question = questionController.text;
      final String option1 = option1Controller.text;
      final String option2 = option2Controller.text;
      final String option3 = option3Controller.text;
      final String option4 = option4Controller.text;

      // Create a quiz model instance
      final quizData = QuizModel(
        category: selectedCategory!,
        question: question,
        option1: option1,
        option2: option2,
        option3: option3,
        option4: option4,
      );

      // Store the data using the controller
      await _quizController.create(
        quizData.category,
        quizData.question,
        quizData.option1,
        quizData.option2,
        quizData.option3,
        quizData.option4,
      );

      // Clear the form
      questionController.clear();
      option1Controller.clear();
      option2Controller.clear();
      option3Controller.clear();
      option4Controller.clear();
      setState(() {
        selectedCategory = null;
        correctAnswer = null;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Quiz added successfully!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/admin_back.png"),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 50,
              bottom: 50,
              left: 60,
            ),
            child: SingleChildScrollView(
              child: Container(
                width: 900,
                height: 800,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    AppBar(
                      leading: Image.asset('assets/logo.png'),
                      title: Text(
                        "Terra Treasure",
                        style: GoogleFonts.philosopher(fontSize: 22),
                      ),
                      actions: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const AdminHome()),
                              );
                            },
                            child: Text(
                              "Home",
                              style: GoogleFonts.inder(),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const ViewBuyer()),
                              );
                            },
                            child: Text(
                              "View Buyer",
                              style: GoogleFonts.inder(),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const ViewSeller()),
                              );
                            },
                            child: Text(
                              "View Seller",
                              style: GoogleFonts.inder(),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Container(
                            width: 80,
                            height: 40,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: kPrimaryColor,
                            ),
                            child: Text(
                              "Add quiz",
                              style: GoogleFonts.inder(color: Colors.white),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            "Logout",
                            style: GoogleFonts.inder(),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Center(
                        child: SingleChildScrollView(
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                Text(
                                  "Add Quiz",
                                  style: GoogleFonts.inder(fontSize: 24),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      "Select category",
                                      style: GoogleFonts.inder(),
                                    ),
                                    Center(
                                      child: DropdownButton<String>(
                                        hint: Text(
                                          'Select category',
                                          style: GoogleFonts.inder(),
                                        ),
                                        value: selectedCategory,
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            selectedCategory = newValue;
                                          });
                                        },
                                        items: categories
                                            .map<DropdownMenuItem<String>>(
                                                (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      left: 210,
                                      right: 100,
                                    ),
                                    child: Column(
                                      children: [
                                        _buildTextField(
                                            "Question", questionController),
                                        const SizedBox(height: 20),
                                        _buildTextField(
                                            "Option 1", option1Controller),
                                        const SizedBox(height: 20),
                                        _buildTextField(
                                            "Option 2", option2Controller),
                                        const SizedBox(height: 20),
                                        _buildTextField(
                                            "Option 3", option3Controller),
                                        const SizedBox(height: 20),
                                        _buildTextField(
                                            "Option 4", option4Controller),
                                        const SizedBox(height: 20),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              "Correct Answer",
                                              style: GoogleFonts.inder(),
                                            ),
                                            DropdownButton<String>(
                                              hint: Text(
                                                'Select correct answer',
                                                style: GoogleFonts.inder(),
                                              ),
                                              value: correctAnswer,
                                              onChanged: (String? newValue) {
                                                setState(() {
                                                  correctAnswer = newValue;
                                                });
                                              },
                                              items: [
                                                option1Controller.text,
                                                option2Controller.text,
                                                option3Controller.text,
                                                option4Controller.text
                                              ].map<DropdownMenuItem<String>>(
                                                  (String value) {
                                                return DropdownMenuItem<String>(
                                                  value: value,
                                                  child: Text(value),
                                                );
                                              }).toList(),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 20),
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: kPrimaryColor
                                          ),
                                          onPressed: _submitQuiz,
                                          child: Text("Submit",style: GoogleFonts.inder(color:Colors.white),),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(
      String labelText, TextEditingController controller) {
    return Row(
      children: [
        Expanded(
          child: Text(
            labelText,
            style: GoogleFonts.inder(),
          ),
        ),
        const SizedBox(width: 20),
        SizedBox(
          width: 300,
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
              labelText: 'Enter $labelText',
              labelStyle: GoogleFonts.inder(color: Colors.grey),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              filled: true,
              fillColor: Colors.white,
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter $labelText';
              }
              return null;
            },
            onChanged: (value) {
              setState(() {});
            },
          ),
        ),
      ],
    );
  }
}

