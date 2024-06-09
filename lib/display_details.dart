// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:terra_treasures/util/constants.dart';

// class DisplayDetails extends StatefulWidget {
//   const DisplayDetails({super.key});

//   @override
//   State<DisplayDetails> createState() => _DisplayDetailsState();
// }

// class _DisplayDetailsState extends State<DisplayDetails> {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   Future<void> _deleteData(String id) async {
//     await _firestore.collection('registration').doc(id).delete();
//   }

//   Future<void> _editData(String id, Map<String, dynamic> newData) async {
//     await _firestore.collection('registration').doc(id).update(newData);
//   }

//   void _showEditDialog(DocumentSnapshot document) {
//     final TextEditingController nameController = TextEditingController(text: document['name']);
//     final TextEditingController regnoController = TextEditingController(text: document['reg_no']);
//     final TextEditingController contactController = TextEditingController(text: document['contact']);
//     final TextEditingController cgpaController = TextEditingController(text: document['cgpa']);
//     final TextEditingController skillController = TextEditingController(text: document['skills']);

//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Edit Data'),
//           content: SingleChildScrollView(
//             child: Column(
//               children: [
//                 TextField(
//                   controller: nameController,
//                   decoration: InputDecoration(labelText: 'Name'),
//                 ),
//                 TextField(
//                   controller: regnoController,
//                   decoration: InputDecoration(labelText: 'Reg No'),
//                 ),
//                 TextField(
//                   controller: contactController,
//                   decoration: InputDecoration(labelText: 'Contact'),
//                 ),
//                 TextField(
//                   controller: cgpaController,
//                   decoration: InputDecoration(labelText: 'CGPA'),
//                 ),
//                 TextField(
//                   controller: skillController,
//                   decoration: InputDecoration(labelText: 'Skills'),
//                 ),
//               ],
//             ),
//           ),
//           actions: [
//             ElevatedButton(
//               child: Text('Cancel'),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//             ElevatedButton(
//               child: Text('Save'),
//               onPressed: () {
//                 Map<String, dynamic> newData = {
//                   'name': nameController.text,
//                   'reg_no': regnoController.text,
//                   'contact': contactController.text,
//                   'cgpa': cgpaController.text,
//                   'skills': skillController.text,
//                 };
//                 _editData(document.id, newData);
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Text("Details of registered Users"),
//             SizedBox(
//               height: 40,
//             ),
//             const Padding(
//               padding: EdgeInsets.only(top: 80, left: 250, right: 250),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   Text("Name"),
//                    SizedBox(
//                             width: 20,
//                           ),
//                   Text("Reg_no"),
//                    SizedBox(
//                             width: 20,
//                           ),
//                   Text("Contact"),
//                    SizedBox(
//                             width: 20,
//                           ),
//                   Text("CGPA"),
//                    SizedBox(
//                             width: 20,
//                           ),
//                   Text("Skills"),
//                 ],
//               ),
//             ),
//             StreamBuilder<QuerySnapshot>(
//               stream: _firestore.collection('registration').snapshots(),
//               builder: (context, snapshot) {
//                 if (!snapshot.hasData) {
//                   return CircularProgressIndicator();
//                 }

//                 final users = snapshot.data!.docs;

//                 return ListView.separated(
//                   shrinkWrap: true,
//                   physics: NeverScrollableScrollPhysics(),
//                   itemBuilder: (context, index) {
//                     var user = users[index];
//                     return Padding(
//                       padding: const EdgeInsets.only(left: 270,),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           Text(user['name']),
//                           SizedBox(
//                             width: 20,
//                           ),
//                           Text(user['reg_no']),
//                            SizedBox(
//                             width: 20,
//                           ),
//                           Text(user['contact']),
//                            SizedBox(
//                             width: 20,
//                           ),
//                           Text(user['cgpa']),
//                            SizedBox(
//                             width: 20,
//                           ),
//                           Text(user['skills']),
//                            SizedBox(
//                             width: 20,
//                           ),
//                          ElevatedButton(
//                           style: ElevatedButton.styleFrom(backgroundColor: kPrimaryColor),
//                           onPressed: (){
//                           _showEditDialog(user);
//                          }, child: Text("Edit",style: TextStyle(color: Colors.white),)),
//                           SizedBox(
//                             width: 20,
//                           ),
//                           ElevatedButton(
//                             style: ElevatedButton.styleFrom(backgroundColor: kPrimaryColor),
//                             onPressed: (){
//                             _deleteData(user.id);
//                           }, child: Text("Delete",style: TextStyle(color: Colors.white),))
//                         ],
//                       ),
//                     );
//                   },
//                   separatorBuilder: (context, index) {
//                     return Divider();
//                   },
//                   itemCount: users.length,
//                 );
//               },
//             ),
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

// class DisplayDetails extends StatefulWidget {
//   const DisplayDetails({super.key});

//   @override
//   State<DisplayDetails> createState() => _DisplayDetailsState();
// }

// class _DisplayDetailsState extends State<DisplayDetails> {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   Future<void> _deleteData(String id) async {
//     await _firestore.collection('registration').doc(id).delete();
//   }

//   Future<void> _editData(String id, Map<String, dynamic> newData) async {
//     await _firestore.collection('registration').doc(id).update(newData);
//   }

//   void _showEditDialog(DocumentSnapshot document) {
//     final TextEditingController nameController = TextEditingController(text: document['name']);
//     final TextEditingController regnoController = TextEditingController(text: document['reg_no']);
//     final TextEditingController contactController = TextEditingController(text: document['contact']);
//     final TextEditingController cgpaController = TextEditingController(text: document['cgpa']);
//     final TextEditingController skillController = TextEditingController(text: document['skills']);

//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Edit Data'),
//           content: SingleChildScrollView(
//             child: Column(
//               children: [
//                 TextField(
//                   controller: nameController,
//                   decoration: InputDecoration(labelText: 'Name'),
//                 ),
//                 TextField(
//                   controller: regnoController,
//                   decoration: InputDecoration(labelText: 'Reg No'),
//                 ),
//                 TextField(
//                   controller: contactController,
//                   decoration: InputDecoration(labelText: 'Contact'),
//                 ),
//                 TextField(
//                   controller: cgpaController,
//                   decoration: InputDecoration(labelText: 'CGPA'),
//                 ),
//                 TextField(
//                   controller: skillController,
//                   decoration: InputDecoration(labelText: 'Skills'),
//                 ),
//               ],
//             ),
//           ),
//           actions: [
//             ElevatedButton(
//               child: Text('Cancel'),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//             ElevatedButton(
//               child: Text('Save'),
//               onPressed: () {
//                 Map<String, dynamic> newData = {
//                   'name': nameController.text,
//                   'reg_no': regnoController.text,
//                   'contact': contactController.text,
//                   'cgpa': cgpaController.text,
//                   'skills': skillController.text,
//                 };
//                 _editData(document.id, newData);
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Text("Details of registered Users"),
//             SizedBox(height: 40),
//             const Padding(
//               padding: EdgeInsets.symmetric(horizontal: 250),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   Expanded(child: Text("Name", textAlign: TextAlign.center)),
//                   Expanded(child: Text("Reg No", textAlign: TextAlign.center)),
//                   Expanded(child: Text("Contact", textAlign: TextAlign.center)),
//                   Expanded(child: Text("CGPA", textAlign: TextAlign.center)),
//                   Expanded(child: Text("Skills", textAlign: TextAlign.center)),
//                   Expanded(child: Text("Actions", textAlign: TextAlign.center)),
//                 ],
//               ),
//             ),
//             StreamBuilder<QuerySnapshot>(
//               stream: _firestore.collection('registration').snapshots(),
//               builder: (context, snapshot) {
//                 if (!snapshot.hasData) {
//                   return CircularProgressIndicator();
//                 }

//                 final users = snapshot.data!.docs;

//                 return ListView.separated(
//                   shrinkWrap: true,
//                   physics: NeverScrollableScrollPhysics(),
//                   itemBuilder: (context, index) {
//                     var user = users[index];
//                     return Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 250),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           Expanded(child: Text(user['name'], textAlign: TextAlign.center)),
//                           Expanded(child: Text(user['reg_no'], textAlign: TextAlign.center)),
//                           Expanded(child: Text(user['contact'], textAlign: TextAlign.center)),
//                           Expanded(child: Text(user['cgpa'], textAlign: TextAlign.center)),
//                           Expanded(child: Text(user['skills'], textAlign: TextAlign.center)),
//                           Expanded(
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 ElevatedButton(
//                           style: ElevatedButton.styleFrom(backgroundColor: kPrimaryColor),
//                           onPressed: (){
//                           _showEditDialog(user);
//                          }, child: Text("Edit",style: TextStyle(color: Colors.white),)),
//                           // SizedBox(
//                           //   width: 20,
//                           // ),
//                           ElevatedButton(
//                             style: ElevatedButton.styleFrom(backgroundColor: kPrimaryColor),
//                             onPressed: (){
//                             _deleteData(user.id);
//                           }, child: Text("Delete",style: TextStyle(color: Colors.white),))
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     );
//                   },
//                   separatorBuilder: (context, index) {
//                     return Divider();
//                   },
//                   itemCount: users.length,
//                 );
//               },
//             ),
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

class DisplayDetails extends StatefulWidget {
  const DisplayDetails({super.key});

  @override
  State<DisplayDetails> createState() => _DisplayDetailsState();
}

class _DisplayDetailsState extends State<DisplayDetails> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> _deleteData(String id) async {
    await _firestore.collection('registration').doc(id).delete();
  }

  Future<void> _editData(String id, Map<String, dynamic> newData) async {
    await _firestore.collection('registration').doc(id).update(newData);
  }

  void _showEditDialog(DocumentSnapshot document) {
    final TextEditingController nameController = TextEditingController(text: document['name']);
    final TextEditingController regnoController = TextEditingController(text: document['reg_no']);
    final TextEditingController contactController = TextEditingController(text: document['contact']);
    final TextEditingController cgpaController = TextEditingController(text: document['cgpa']);
    final TextEditingController skillController = TextEditingController(text: document['skills']);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit Data'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(labelText: 'Name'),
                ),
                TextField(
                  controller: regnoController,
                  decoration: InputDecoration(labelText: 'Reg No'),
                ),
                TextField(
                  controller: contactController,
                  decoration: InputDecoration(labelText: 'Contact'),
                ),
                TextField(
                  controller: cgpaController,
                  decoration: InputDecoration(labelText: 'CGPA'),
                ),
                TextField(
                  controller: skillController,
                  decoration: InputDecoration(labelText: 'Skills'),
                ),
              ],
            ),
          ),
          actions: [
            ElevatedButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: Text('Save'),
              onPressed: () {
                Map<String, dynamic> newData = {
                  'name': nameController.text,
                  'reg_no': regnoController.text,
                  'contact': contactController.text,
                  'cgpa': cgpaController.text,
                  'skills': skillController.text,
                };
                _editData(document.id, newData);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text("Details of registered Users",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
            SizedBox(height: 40),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(child: Text("Name", textAlign: TextAlign.center)),
                  Expanded(child: Text("Reg No", textAlign: TextAlign.center)),
                  Expanded(child: Text("Contact", textAlign: TextAlign.center)),
                  Expanded(child: Text("CGPA", textAlign: TextAlign.center)),
                  Expanded(child: Text("Skills", textAlign: TextAlign.center)),
                  Expanded(child: Text("Actions", textAlign: TextAlign.center)),
                ],
              ),
              
            ),
            
            StreamBuilder<QuerySnapshot>(
              stream: _firestore.collection('registration').snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return CircularProgressIndicator();
                }

                final users = snapshot.data!.docs;

                return Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      var user = users[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [
                            Expanded(child: Text(user['name'], textAlign: TextAlign.center)),
                            Expanded(child: Text(user['reg_no'], textAlign: TextAlign.center)),
                            Expanded(child: Text(user['contact'], textAlign: TextAlign.center)),
                            Expanded(child: Text(user['cgpa'], textAlign: TextAlign.center)),
                            Expanded(child: Text(user['skills'], textAlign: TextAlign.center)),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                   ElevatedButton(
                            style: ElevatedButton.styleFrom(backgroundColor: kPrimaryColor),
                            onPressed: (){
                            _showEditDialog(user);
                           }, child: Text("Edit",style: TextStyle(color: Colors.white),)),
                            // SizedBox(
                            //   width: 20,
                            // ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(backgroundColor: kPrimaryColor),
                              onPressed: (){
                              _deleteData(user.id);
                            }, child: Text("Delete",style: TextStyle(color: Colors.white),))
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Divider();
                    },
                    itemCount: users.length,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
