// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:terra_treasures/util/constants.dart';

// class ExampleRegister extends StatefulWidget {
//   const ExampleRegister({super.key});

//   @override
//   State<ExampleRegister> createState() => _ExampleRegisterState();
// }

// class _ExampleRegisterState extends State<ExampleRegister> {
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController regnoController = TextEditingController();
//   final TextEditingController cgpaController = TextEditingController();
//   final TextEditingController skillController = TextEditingController();
//   final TextEditingController contactController = TextEditingController();


//     Future<void> _submitData() async {
//     String name = nameController.text;
//     String regNo = regnoController.text;
//     String cgpa = cgpaController.text;
//     String skills = skillController.text;
//     String contact = contactController.text;

//     await FirebaseFirestore.instance.collection('registration').add({
//       'name': name,
//       'reg_no': regNo,
//       'cgpa': cgpa,
//       'skills': skills,
//       'contact': contact,
//     });

//     // Clear the text fields after submission
//     nameController.clear();
//     regnoController.clear();
//     cgpaController.clear();
//     skillController.clear();
//     contactController.clear();

//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text('Registration Successful')),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.only(top: 100,right: 200,left: 200),
//         child: Column(
//           children: [
//             Text("Registration Page"),
//             SizedBox(
//               height: 20,
//             ),
//              TextFormField(
//                       controller: nameController,
//                       decoration: InputDecoration(
//                         labelText: 'name',
//                         labelStyle: GoogleFonts.inder(),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(3.0),
//                         ),
//                         filled: true,
//                         fillColor:  Colors.white
//                       ),
//                     ),
//                     SizedBox(
//               height: 20,
//             ),
//                     TextFormField(
//                       controller: regnoController,
//                       decoration: InputDecoration(
//                         labelText: 'reg_no',
//                         labelStyle: GoogleFonts.inder(),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(3.0),
//                         ),
//                         filled: true,
//                         fillColor: Colors.white
//                       ),
//                     ),
//                     SizedBox(
//               height: 20,
//             ),
//                     TextFormField(
//                       controller: contactController,
//                       decoration: InputDecoration(
//                         labelText: 'contact',
//                         labelStyle: GoogleFonts.inder(),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(3.0),
//                         ),
//                         filled: true,
//                         fillColor:Colors.white
//                       ),
//                     ),
//                     SizedBox(
//               height: 20,
//             ),
//                     TextFormField(
//                       controller: cgpaController,
//                       decoration: InputDecoration(
//                         labelText: 'cgpa',
//                         labelStyle: GoogleFonts.inder(),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(3.0),
//                         ),
//                         filled: true,
//                         fillColor:Colors.white
//                       ),
//                     ),
//                     SizedBox(
//               height: 20,
//             ),
//                     TextFormField(
//                       controller: skillController,
//                       decoration: InputDecoration(
//                         labelText: 'skills',
//                         labelStyle: GoogleFonts.inder(),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(3.0),
//                         ),
//                         filled: true,
//                         fillColor: Colors.white
//                       ),
//                     ),
//                     SizedBox(
//               height: 20,
//             ),
//                     ElevatedButton(
                  
//                       onPressed: (){
//                       _submitData();
//                     }, 
//                     style: ElevatedButton.styleFrom(backgroundColor: kPrimaryColor),
//                     child: Text("Submit",style: TextStyle(color:Colors.white),))
//           ],
//         ),
//       ),
//     );
//   }
// }


// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:terra_treasures/util/constants.dart';

// class ExampleRegister extends StatefulWidget {
//   const ExampleRegister({super.key});

//   @override
//   State<ExampleRegister> createState() => _ExampleRegisterState();
// }

// class _ExampleRegisterState extends State<ExampleRegister> {
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController regnoController = TextEditingController();
//   final TextEditingController cgpaController = TextEditingController();
//   final TextEditingController skillController = TextEditingController();
//   final TextEditingController contactController = TextEditingController();

//   Map<String, String> submittedData = {};

//   Future<void> _submitData() async {
//     String name = nameController.text;
//     String regNo = regnoController.text;
//     String cgpa = cgpaController.text;
//     String skills = skillController.text;
//     String contact = contactController.text;

//     DocumentReference docRef = await FirebaseFirestore.instance.collection('registration').add({
//       'name': name,
//       'reg_no': regNo,
//       'cgpa': cgpa,
//       'skills': skills,
//       'contact': contact,
//     });

//     setState(() {
//       submittedData = {
//         'id': docRef.id,
//         'name': name,
//         'reg_no': regNo,
//         'cgpa': cgpa,
//         'skills': skills,
//         'contact': contact,
//       };
//     });

//     // Clear the text fields after submission
//     nameController.clear();
//     regnoController.clear();
//     cgpaController.clear();
//     skillController.clear();
//     contactController.clear();

//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text('Registration Successful')),
//     );
//   }

//   Future<void> _deleteData(String id) async {
//     await FirebaseFirestore.instance.collection('registration').doc(id).delete();
//     setState(() {
//       submittedData = {};
//     });
//   }

//   void _editData() {
//     nameController.text = submittedData['name']!;
//     regnoController.text = submittedData['reg_no']!;
//     cgpaController.text = submittedData['cgpa']!;
//     skillController.text = submittedData['skills']!;
//     contactController.text = submittedData['contact']!;
//     setState(() {
//       submittedData = {};
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(top: 100, right: 200, left: 200),
//               child: Column(
//                 children: [
//                   Text("Registration Page"),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   TextFormField(
//                     controller: nameController,
//                     decoration: InputDecoration(
//                       labelText: 'Name',
//                       labelStyle: GoogleFonts.inder(),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(3.0),
//                       ),
//                       filled: true,
//                       fillColor: Colors.white,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   TextFormField(
//                     controller: regnoController,
//                     decoration: InputDecoration(
//                       labelText: 'Reg No',
//                       labelStyle: GoogleFonts.inder(),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(3.0),
//                       ),
//                       filled: true,
//                       fillColor: Colors.white,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   TextFormField(
//                     controller: contactController,
//                     decoration: InputDecoration(
//                       labelText: 'Contact',
//                       labelStyle: GoogleFonts.inder(),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(3.0),
//                       ),
//                       filled: true,
//                       fillColor: Colors.white,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   TextFormField(
//                     controller: cgpaController,
//                     decoration: InputDecoration(
//                       labelText: 'CGPA',
//                       labelStyle: GoogleFonts.inder(),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(3.0),
//                       ),
//                       filled: true,
//                       fillColor: Colors.white,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   TextFormField(
//                     controller: skillController,
//                     decoration: InputDecoration(
//                       labelText: 'Skills',
//                       labelStyle: GoogleFonts.inder(),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(3.0),
//                       ),
//                       filled: true,
//                       fillColor: Colors.white,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   ElevatedButton(
//                     onPressed: () {
//                       _submitData();
//                     },
//                     style: ElevatedButton.styleFrom(backgroundColor: kPrimaryColor),
//                     child: Text(
//                       "Submit",
//                       style: TextStyle(color: Colors.white),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             if (submittedData.isNotEmpty)
//               Padding(
//                 padding: const EdgeInsets.only(top: 100, right: 200, left: 50),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text("Submitted Data"),
//                     SizedBox(height: 20),
//                     Text("Name: ${submittedData['name']}"),
//                     Text("Reg No: ${submittedData['reg_no']}"),
//                     Text("CGPA: ${submittedData['cgpa']}"),
//                     Text("Skills: ${submittedData['skills']}"),
//                     Text("Contact: ${submittedData['contact']}"),
//                     SizedBox(height: 20),
//                     Row(
//                       children: [
//                         ElevatedButton(
//                           onPressed: _editData,
//                           style: ElevatedButton.styleFrom(backgroundColor: kPrimaryColor),
//                           child: Text(
//                             "Edit",
//                             style: TextStyle(color: Colors.white),
//                           ),
//                         ),
//                         SizedBox(width: 10),
//                         ElevatedButton(
//                           onPressed: () {
//                             _deleteData(submittedData['id']!);
//                           },
//                           style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
//                           child: Text(
//                             "Delete",
//                             style: TextStyle(color: Colors.white),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:terra_treasures/util/constants.dart';

class ExampleRegister extends StatefulWidget {
  const ExampleRegister({super.key});

  @override
  State<ExampleRegister> createState() => _ExampleRegisterState();
}

class _ExampleRegisterState extends State<ExampleRegister> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController regnoController = TextEditingController();
  final TextEditingController cgpaController = TextEditingController();
  final TextEditingController skillController = TextEditingController();
  final TextEditingController contactController = TextEditingController();

  Map<String, String> submittedData = {};

  Future<void> _submitData() async {
    String name = nameController.text;
    String regNo = regnoController.text;
    String cgpa = cgpaController.text;
    String skills = skillController.text;
    String contact = contactController.text;

    DocumentReference docRef = await FirebaseFirestore.instance.collection('registration').add({
      'name': name,
      'reg_no': regNo,
      'cgpa': cgpa,
      'skills': skills,
      'contact': contact,
    });

    setState(() {
      submittedData = {
        'id': docRef.id,
        'name': name,
        'reg_no': regNo,
        'cgpa': cgpa,
        'skills': skills,
        'contact': contact,
      };
    });

    // Clear the text fields after submission
    nameController.clear();
    regnoController.clear();
    cgpaController.clear();
    skillController.clear();
    contactController.clear();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Registration Successful')),
    );
  }

  Future<void> _deleteData(String id) async {
    await FirebaseFirestore.instance.collection('registration').doc(id).delete();
    setState(() {
      submittedData = {};
    });
  }

  void _editData() {
    nameController.text = submittedData['name']!;
    regnoController.text = submittedData['reg_no']!;
    cgpaController.text = submittedData['cgpa']!;
    skillController.text = submittedData['skills']!;
    contactController.text = submittedData['contact']!;
    setState(() {
      submittedData = {};
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 100, right: 200, left: 200),
              child: Column(
                children: [
                  Text("Registration Page"),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                      labelText: 'Name',
                      labelStyle: GoogleFonts.inder(),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(3.0),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: regnoController,
                    decoration: InputDecoration(
                      labelText: 'Reg No',
                      labelStyle: GoogleFonts.inder(),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(3.0),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: contactController,
                    decoration: InputDecoration(
                      labelText: 'Contact',
                      labelStyle: GoogleFonts.inder(),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(3.0),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: cgpaController,
                    decoration: InputDecoration(
                      labelText: 'CGPA',
                      labelStyle: GoogleFonts.inder(),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(3.0),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: skillController,
                    decoration: InputDecoration(
                      labelText: 'Skills',
                      labelStyle: GoogleFonts.inder(),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(3.0),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _submitData();
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: kPrimaryColor),
                    child: Text(
                      "Submit",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            if (submittedData.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 100, right: 200, left: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Submitted Data"),
                    SizedBox(height: 20),
                    Text("Name: ${submittedData['name']}"),
                    Text("Reg No: ${submittedData['reg_no']}"),
                    Text("CGPA: ${submittedData['cgpa']}"),
                    Text("Skills: ${submittedData['skills']}"),
                    Text("Contact: ${submittedData['contact']}"),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: _editData,
                          style: ElevatedButton.styleFrom(backgroundColor: kPrimaryColor),
                          child: Text(
                            "Edit",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: () {
                            _deleteData(submittedData['id']!);
                          },
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                          child: Text(
                            "Delete",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
