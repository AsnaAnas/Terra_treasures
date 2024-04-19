import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:terra_treasures/modules/user_module/home.dart';
import 'package:terra_treasures/util/constants.dart';

class OrderPlaced extends StatelessWidget {
  const OrderPlaced({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        leading:  Padding(
          padding: const EdgeInsets.only(top: 30,left: 20),
          child: IconButton(onPressed: (){
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),
              );
          }, icon:const Icon(Icons.home,color: Colors.white,) )
        ),

      ),
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.check_circle,size: 50,color: Colors.white,),
            const SizedBox(height: 20,),
            Text("Order Confirmed",
            style: GoogleFonts.inder(
              color:Colors.white,
              fontSize:24,
            ),),
            const SizedBox(height: 30,),
             Text("Thankyou for your order.\nPlease keep track user order.",
             textAlign: TextAlign.center,
            style: GoogleFonts.inder(
              color:Colors.white,
              fontSize:16,
            ),),
            const SizedBox(height: 60,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(300, 35),
                backgroundColor: Colors.white,
              ),
              onPressed: (){
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
              }, 
            child:  Text("Continue Shopping",
            style: GoogleFonts.inder(
              color:kPrimaryColor
            ),) )
          ],
        ),
      ),
    );
  }
}