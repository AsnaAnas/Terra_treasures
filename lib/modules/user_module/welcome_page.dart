import 'package:flutter/material.dart';
import 'package:terra_treasures/util/body.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 224, 249, 232),
      body: Body(),
    ) ;
  }
}