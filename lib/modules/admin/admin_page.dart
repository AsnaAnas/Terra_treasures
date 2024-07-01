import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:terra_treasures/modules/admin/admin_home.dart';
import 'package:terra_treasures/util/constants.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({super.key});

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Stack(
        children: [
           Container(
            height: double.infinity,
            width:double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/admin1.png"),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 100,left: 500,bottom: 100,),
            child: Container(
              height: 600,
              width: 300,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 40,),
                    child: Text("LOGIN",style: GoogleFonts.inknutAntiqua(fontSize:18,),),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20,right: 20),
                    child: TextFormField(
                       
                        decoration: InputDecoration(
                          labelText: 'Username',
                          labelStyle: GoogleFonts.inder(color:Colors.grey),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          filled: true,
                          fillColor: Colors.white
                        ),
                        
                      ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20,right: 20),
                    child: TextFormField(
                       
                        decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: GoogleFonts.inder(color:Colors.grey),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          
                        ),
                        obscureText: true,
                      ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  ElevatedButton(onPressed: (){
                    Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  const AdminHome()),
            );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kPrimaryColor,
                    fixedSize: const Size(200, 45)
                  ),
                   child: Text("LOGIN",style: GoogleFonts.inder(color:Colors.white),))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}