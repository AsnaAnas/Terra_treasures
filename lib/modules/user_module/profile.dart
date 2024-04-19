import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:terra_treasures/util/constants.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        leading: IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_circle_left_outlined)),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset('assets/profile.png'),
              Text("Example",
              style: GoogleFonts.inder(
                fontSize:18,
                 ),),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/coin.png"),
                    Text("10",style: GoogleFonts.inder(),),
                  ],
                 )
            ],
          ),
        ),
      ),
    );
  }
}