import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:terra_treasures/auth/login_screen.dart';
import 'package:terra_treasures/modules/seller_module/seller_profile.dart';
import 'package:terra_treasures/modules/user_module/screens/profile.dart';
import 'package:terra_treasures/util/constants.dart';

class SellerSettingsPage extends StatelessWidget {
   SellerSettingsPage({super.key});

  final _firestor=FirebaseFirestore.instance;
  final _auth=FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {

    String id=_auth.currentUser!.uid;
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        leading:  IconButton(onPressed: (){
           Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfilePage()),
              );
        },
         icon: const Icon(Icons.arrow_circle_left_outlined))
      ),
      body: StreamBuilder(stream: _firestor.collection('seller').doc(id).snapshots() , 
      builder: (context,snapshot)
      {
        DocumentSnapshot data= snapshot.data!;
        String imageUrl= data['image'];
        return  ListView(
        children: [
          ListTile(
            leading:  CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(imageUrl),
            ),
            title: Text("Welcome",
            style: GoogleFonts.inder(color:Colors.grey),),
            subtitle: Text("${data['name']}",
            style: GoogleFonts.inder(fontSize:18),),
            trailing: IconButton(onPressed: (){
              _showLogoutBottomSheet(context);
            }, 
            icon: const Icon(Icons.logout_sharp)),
          ),
          const Divider(height: 30,),
           ListTile(
            leading: const Icon(Icons.account_circle_outlined,color: Colors.grey,size: 30,),
            title: Text("User Profile",
            style: GoogleFonts.inder(color:Colors.black),),
            
            trailing: IconButton(onPressed: (){
               Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SellerProfile()),
              );
            },
             icon: const Icon(Icons.arrow_forward_ios)),
          ),
          const Divider(height: 30,),
           ListTile(
            leading: const Icon(Icons.lock,color: Colors.grey,size: 30,),
            title: Text("Change Password",
            style: GoogleFonts.inder(color:Colors.black),),
            trailing: IconButton(onPressed: (){
              showDialog(context: context,
                               builder: (ctx)=> AlertDialog(
                                title: const Text("Change Password"),
                               actions: [
                                TextField(
                                  decoration: InputDecoration(
                  enabledBorder:  OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey),
                     borderRadius: BorderRadius.circular(17),
                   ),
                  fillColor: bgColor,
                  filled: true,
                  hintText: "New Password",
                  hintStyle: GoogleFonts.inder(color:Colors.grey)
                ),
                                ),
                                const SizedBox(height: 10,),
                                TextField(
                                  decoration: InputDecoration(
                  enabledBorder:  OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey),
                     borderRadius: BorderRadius.circular(17),
                   ),
                  fillColor: bgColor,
                  filled: true,
                  hintText: "Confirm Password",
                  hintStyle: GoogleFonts.inder(color:Colors.grey)
                ),
                                ),
                                const SizedBox(height: 10,),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: kPrimaryColor,
                                    fixedSize: const Size(100, 30)
                                  ),
                                  onPressed: (){
                                     ScaffoldMessenger.of(context).showSnackBar(const 
                                     SnackBar(content: Text("Password Changed"),
                                    showCloseIcon: true,
                                     backgroundColor: Color(0xff436850),
                                    duration: Duration(seconds: 2),
                                    behavior: SnackBarBehavior.floating,
                                     margin: EdgeInsets.only(bottom:50,left: 50,right: 50),));
                                     Navigator.of(context).pop();  
                                  }, 
                                child: Text("Save",style: GoogleFonts.inder(color:Colors.white),))
                               ],
                               ));
            }, icon: const Icon(Icons.arrow_forward_ios_rounded)),
          ),
          const Divider()
        ],
      );
      })
     
    );

 }

  void _showLogoutBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        height: MediaQuery.of(context).size.height * 0.3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
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
                    _auth.signOut().then((value) => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()))); // Use pushReplacement here
                    preferences.clear();
                    // log('logout successfully' as num);

                    print('Logout confirmed');
                    Navigator.pop(context);
                  },
                  child: Text('Logout'),
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
      );
    },
  );
}

}