import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:terra_treasures/util/constants.dart';

class PageButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const PageButton({super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
       style: ElevatedButton.styleFrom(
                backgroundColor: kPrimaryColor,fixedSize: const Size(300, 40),
                ) ,
      child: Text(text,style: GoogleFonts.inder(color:Colors.white,fontSize:17)
      ),
      
                
              
    );
    
    
  }
}