

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:terra_treasures/model/seller_model.dart';
import 'package:terra_treasures/modules/admin/admin_home.dart';
import 'package:terra_treasures/modules/admin/view_buyer.dart';
import 'package:terra_treasures/util/constants.dart';

class ViewSeller extends StatefulWidget {
  const ViewSeller({super.key});

  @override
  State<ViewSeller> createState() => _ViewBuyerState();
}

class _ViewBuyerState extends State<ViewSeller> {


    Future<void> _deleteUser(String sellerId) async {
    try {
      await FirebaseFirestore.instance.collection('seller').doc(sellerId).delete();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('seller deleted successfully')));
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
                        child: InkWell
                        ( 
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
                        child: Container(
                          width: 80,
                          height: 40,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: kPrimaryColor,
                          ),
                          child: Text(
                            "View Seller",
                            style: GoogleFonts.inder(color:Colors.white),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          "Add quiz",
                          style: GoogleFonts.inder(),
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
                        stream: FirebaseFirestore.instance.collection('seller').snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return const Center(child: CircularProgressIndicator());
                          }
                          if (snapshot.hasError) {
                            return Center(child: Text('Error: ${snapshot.error}'));
                          }
                          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                            return const Center(child: Text('No seller found'));
                          }

                          List<SellerModel> sellers = snapshot.data!.docs
                              .map((doc) => SellerModel.fromMap(doc.data() as Map<String, dynamic>))
                              .toList();

                          return ListView.separated(
                            itemBuilder: (context, index) {
                              SellerModel seller = sellers[index];
                              return ListTile(
                                leading: CircleAvatar(
                                  backgroundImage: seller.imageUrl != null && seller.imageUrl!.isNotEmpty
                                        ? NetworkImage(seller.imageUrl!)
                                        : AssetImage("assets/avatar.png") as ImageProvider,
                                ),
                                title: Text(seller.name ?? 'No Name'),
                                trailing: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    fixedSize: Size(90,35 ),
                                    backgroundColor: kPrimaryColor
                                  ),
                                  onPressed: () {
                                    _deleteUser(seller.id!);
                                  },
                                  child: Text("Delete",style: GoogleFonts.inder(color:Colors.white),),
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return Divider();
                            },
                            itemCount: sellers.length,
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

