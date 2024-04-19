import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:terra_treasures/modules/user_module/home.dart';
import 'package:terra_treasures/util/constants.dart';

class MoreInfo extends StatelessWidget {
  const MoreInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        leading: IconButton(onPressed: (){
          Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),
              );
        }, 
        icon: const Icon(Icons.arrow_circle_left_outlined)),
        
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8,),
            child: Text("Simple tips you can apply to live by the Reduce,Reuse,Recycle",
            style: GoogleFonts.inder(fontSize:22,fontWeight:FontWeight.bold),),
          ),
          Image.asset("assets/moreinfo.png"),
         //Image.asset('assets/more.png')
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: Column(
             children: [
               RichText(
                textAlign: TextAlign.justify,
                 text:  TextSpan(
                   text: 'Reduce:\n',
                   style: GoogleFonts.inder(color: Colors.black,fontSize: 16),
                   children: const <TextSpan>[
                     TextSpan(
                       text: '\u2022 Shop smart: Plan your meals and buy only what you need to avoid food waste. Opt for loose fruits and vegetables over packaged options. Choose products with minimal packaging or made from recycled materials.\n',
                     ),
                     TextSpan(
                       text: '\u2022 Say no to single-use: Carry reusable shopping bags, coffee mugs, water bottles, and cutlery. Decline plastic straws, utensils, and napkins when offered.\n',
                     ),
                     TextSpan(
                       text: '\u2022 Reduce paper use: Go paperless for bills and statements. Utilize reusable notebooks and handkerchiefs.\n',
                     ),
                   ],
                 ),
               ),
                RichText(
                  textAlign: TextAlign.justify,
                 text:  TextSpan(
                   text: 'Reuse:\n',
                   style: GoogleFonts.inder(color: Colors.black,fontSize: 16),
                   children: const <TextSpan>[
                     TextSpan(
                       text: '\u2022 Get creative: Repurpose old items instead of throwing them away. Use glass jars for storage, old T-shirts for cleaning cloths, or fabric scraps for DIY projects.\n',
                     ),
                     TextSpan(
                       text: '\u2022 Donate: Give pre-loved clothing, furniture, and electronics to charity or hold a garage sale.\n',
                     ),
                     TextSpan(
                       text: '\u2022 Compost food scraps: This reduces waste and creates nutrient-rich fertilizer for your garden.\n',
                     ),
                   ],
                 ),
               ),
                RichText(
                 text:  TextSpan(
                   text: 'Recycle:\n',
                   style: GoogleFonts.inder(color: Colors.black,fontSize: 16),
                   children: const <TextSpan>[
                     TextSpan(
                       text: '\u2022 Know your local guidelines: Every community has different recycling rules. Learn what items are accepted in your area and sort them accordingly.\n',
                     ),
                     TextSpan(
                       text: '\u2022 Rinse and clean recyclables: This helps ensure they can be properly processed and reused.\n',
                     ),
                     TextSpan(
                       text: '\u2022 Support companies using recycled materials: By choosing products made from recycled content, you encourage companies to continue these practices.\n',
                     ),
                   ],
                 ),
               ),
             ],
           ),
         )
        ],
      ),
    );
  }
}