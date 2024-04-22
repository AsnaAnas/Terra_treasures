import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:terra_treasures/modules/user_module/screens/home.dart';
import 'package:terra_treasures/util/constants.dart';

class Sustainability extends StatelessWidget {
  const Sustainability({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        leading: IconButton(onPressed: (){
           Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),);
        },
         icon: const Icon(Icons.arrow_circle_left_outlined)),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text("Why Sustainability is important?",style: GoogleFonts.inder(fontSize:20,fontWeight:FontWeight.bold),),
          ),
         Image.asset('assets/sustain.png'),
         Padding(
           padding: const EdgeInsets.all(20),
           child: Column(
             children: [
               RichText(
                      textAlign: TextAlign.justify,
                       text:  TextSpan(
                         text: 'Sustainability boils down to one core reason: to ensure the well-being of both our planet and ourselves, now and for future generations. Its about striking a balance between meeting our needs while preserving the resources and ecosystems that support all life. Here are some key points:\n Environmental Benefits:\n',
                         style: GoogleFonts.inder(color: Colors.black,fontSize: 16),
                         children: const <TextSpan>[
                           TextSpan(
                             text: '\u2022 Protects our planet: Combats climate change, conserves natural resources like water and forests, and reduces pollution.\n',
                           ),
                           TextSpan(
                             text: '\u2022 Preserves biodiversity: Ensures healthy ecosystems for all living things, including humans.\n',
                           ),
                           TextSpan(
                             text: '\u2022 Reduces waste: Promotes responsible consumption and production, minimizing our footprint on the environment.\n',
                           ),
                         ],
                       ),
                     ),
                     RichText(
                  textAlign: TextAlign.justify,
                   text:  TextSpan(
                     text: ' Social and Economical Benefits:\n',
                     style: GoogleFonts.inder(color: Colors.black,fontSize: 16),
                     children: const <TextSpan>[
                       TextSpan(
                         text: '\u2022 Improves health and well-being: Creates cleaner air, water, and food, leading to healthier communities.\n',
                       ),
                       TextSpan(
                         text: '\u2022 Boosts economic growth: Creates new jobs in green technologies and sustainable practices.\n',
                       ),
                       TextSpan(
                         text: '\u2022 Promotes social equity: Ensures everyone has access to clean water, energy, and healthy living conditions.\n',
                       ),
                     ],
                   ),
                 ),
             ],
           ),
         ),
               
        ],
      ),
    );
  }
}