import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:terra_treasures/modules/admin/add_quiz.dart';
import 'package:terra_treasures/modules/admin/admin_page.dart';
import 'package:terra_treasures/modules/admin/view_buyer.dart';
import 'package:terra_treasures/modules/admin/view_seller.dart';
import 'package:terra_treasures/util/constants.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({super.key});

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
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
                        child: Container(
                            width: 60,
                            height: 40,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: kPrimaryColor,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Home",
                                style: GoogleFonts.inder(color: Colors.white),
                              ),
                            )),
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
                            )),
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
                      InkWell(
                        onTap: () {
                          _showLogoutBottomSheet(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            "Logout",
                            style: GoogleFonts.inder(),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Container(
                            width: 250,
                            height: 300,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/earth_bg.png"),
                                  fit: BoxFit.fill),
                            ),
                            // child: Image.asset("assets/earth_bg.png"),
                          ),
                        ),
                        Column(
                          children: [
                            Text(
                              "The Importance of Sustainable \n and Eco-Friendly Products ",
                              style: GoogleFonts.inter(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 20,
                              ),
                              child: Text(
                                "Embracing eco-friendly materials offers a range of advantages. \n These materials are designed to minimize\n harm to the environment as they are often made from \n renewable resources, requiring less energy and water during production.\n They also emit fewer greenhouse gases and\n pollutants compared to conventional materials.",
                                style: GoogleFonts.inter(),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }


    void _showLogoutBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 100,),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Are you sure you want to logout?',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      SharedPreferences preferences = await SharedPreferences.getInstance();
                      FirebaseAuth.instance.signOut().then((value) => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AdminLogin()))); // Use pushReplacement here
                      preferences.clear();
                      // log('logout successfully' as num);
        
                     
                      Navigator.pop(context);
                    },
                    child: const Text('Logout'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Cancel'),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}

}
