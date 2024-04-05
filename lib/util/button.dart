import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonPage extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
   ButtonPage({super.key,required this.onPressed,required this.text});

  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(onPressed: (){},
                  style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff166F31),fixedSize: const Size(200, 40)) , 
                  child: Text(text,
                  style:GoogleFonts.inknutAntiqua(fontSize:17,color:Colors.white) ,),
                  );
                
  }
}