import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const CustomButton({super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
       style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff166F31),fixedSize: const Size(150, 40)) ,
      child: Text(text,style: GoogleFonts.inder(color:Colors.white,fontSize:17)),
                
              
    );
    
    
  }
}