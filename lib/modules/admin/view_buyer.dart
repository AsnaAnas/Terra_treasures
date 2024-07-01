

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:terra_treasures/model/user_model.dart';
import 'package:terra_treasures/modules/admin/add_quiz.dart';
import 'package:terra_treasures/modules/admin/admin_home.dart';
import 'package:terra_treasures/modules/admin/view_seller.dart';
import 'package:terra_treasures/util/constants.dart';

class ViewBuyer extends StatefulWidget {
  const ViewBuyer({super.key});

  @override
  State<ViewBuyer> createState() => _ViewBuyerState();
}

class _ViewBuyerState extends State<ViewBuyer> {


    Future<void> _deleteUser(String userId) async {
    try {
      await FirebaseFirestore.instance.collection('register').doc(userId).delete();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('User deleted successfully')));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error deleting user: $e')));
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
                        child: Container(
                          width: 80,
                          height: 40,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: kPrimaryColor,
                          ),
                          child: Text(
                            "View Buyer",
                            style: GoogleFonts.inder(color: Colors.white),
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
                      InkWell(
                        onTap: () {
                           Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const AddQuiz()),
                              );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            "Add quiz",
                            style: GoogleFonts.inder(),
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
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance.collection('register').snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return Center(child: CircularProgressIndicator());
                          }
                          if (snapshot.hasError) {
                            return Center(child: Text('Error: ${snapshot.error}'));
                          }
                          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                            return Center(child: Text('No buyers found'));
                          }

                          List<UserModel> users = snapshot.data!.docs
                              .map((doc) => UserModel.fromMap(doc.data() as Map<String, dynamic>))
                              .toList();

                          return ListView.separated(
                            itemBuilder: (context, index) {
                              UserModel user = users[index];
                              return ListTile(
                                leading: CircleAvatar(
                                  backgroundImage: user.imageUrl != null && user.imageUrl!.isNotEmpty
                                        ? NetworkImage(user.imageUrl!)
                                        : AssetImage("assets/avatar.png") as ImageProvider,
                                ),
                                title: Text(user.name ?? 'No Name'),
                                trailing: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    fixedSize: Size(90, 35),
                                    backgroundColor: kPrimaryColor
                                  ),
                                  onPressed: () {
                                    _deleteUser(user.id!);
                                  },
                                  child: Text("Delete",style: GoogleFonts.inder(color:Colors.white),),
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return Divider();
                            },
                            itemCount: users.length,
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

