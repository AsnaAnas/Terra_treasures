import 'package:flutter/material.dart';
import 'package:terra_treasures/util/constants.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        foregroundColor: kPrimaryColor,
        onPressed: (){},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50)
        ),
        child: const Icon(Icons.add),
        ),
    );
    
  }
}