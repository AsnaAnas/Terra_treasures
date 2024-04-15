import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:terra_treasures/util/button.dart';
import 'package:terra_treasures/util/constants.dart';


class ProductDetails extends StatelessWidget {
   ProductDetails({super.key});

//   static List<String> title=['Cocunut spoon Wood(5pc)','Cocunut spoon Wood(5pc)','Cocunut spoon Wood(5pc)','Cocunut spoon Wood(5pc)'];
// static List url=['assets/spoon.png','assets/spoon.png','assets/spoon.png','assets/spoon.png',];
// static List<String> sub=['150','150','150','150',];
// final List<ProductList> data=List.generate(title.length, (index) => ProductList('${title[index]}', '${url[index]}', '${sub[index]}'));

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        leading: const Icon(Icons.arrow_circle_left_outlined),
        actions: const [
         Padding(
           padding: EdgeInsets.all(10),
           child: Icon(Icons.shopping_bag_outlined),
         ),
      ],),
      body:  SingleChildScrollView(
        // child: ListView.builder(itemBuilder: (context, index) {
        //   return Card(
        //     child: 
        
              
        //     Column(
        //    children: [
        //     Center(
        //       child: Image.asset('assets/spoon.png',)),
        //       const SizedBox(
        //         height: 20,
        //       ),
        //       Text("Coconut Wood Spoon(5pc)",style: GoogleFonts.inder(fontSize:20),),
        //        Padding(
        //          padding: const EdgeInsets.only(left: 50,),
        //          child: Row(
        //           children: [
        //              const Icon(Icons.currency_rupee_outlined),
        //              Text("150",style: GoogleFonts.inder(fontSize:20),)
        //           ],
        //           ),
        //        ),
               
        //         const SizedBox(height: 20,),
        //             Container(
        //             height: 35,
        //             width: 200,
        //             decoration:  BoxDecoration(
        //               borderRadius: BorderRadius.circular(17),
        //               border: Border.all(color: Colors.black),
                                
        //             ),
        //             child:  TextButton(
        //               onPressed: (){
        //                // Navigator.push(context,MaterialPageRoute(builder: (context) =>  RegisterScreen()) );
                            
        //             }, 
        //             child:  Padding(
        //               padding: const EdgeInsets.only(left: 50),
        //               child: Row(
        //                 children: [
        //                    Text(" Quantity:5",style: GoogleFonts.inder(color:Colors.black),),
                          
        //                    const Icon(Icons.arrow_drop_down,color: Colors.black,)
        //                 ],
        //               ),
        //             )
        //             )
        //             ),
        //             const SizedBox(
        //               height: 60,
        //             ),
        //           Container(
        //             height: 40,
        //             width: 300,
        //             decoration:  BoxDecoration(
        //               borderRadius: BorderRadius.circular(17),
        //               border: Border.all(color: kPrimaryColor),
                                
        //             ),
        //             child:  TextButton(
                      
        //               onPressed: (){
        //                // Navigator.push(context,MaterialPageRoute(builder: (context) =>  RegisterScreen()) );
                            
        //             }, 
                    
        //             child:  Align(
        //               alignment: Alignment.center,
        //               child: Text(" Add to Cart",style: GoogleFonts.inder(color:kPrimaryColor),),
        //             )
        //             )

        //           ),
        //           const SizedBox(
        //             height: 20,
        //           ),
        //           PageButton(onPressed: (){}, text: "Buy Now")
              
        //    ],
        // )

        //     );
        
          

 
       
        // }
        // )
        child: ListView(
          
        ),
         ),
    );
  }
}

// class ProductList
// {
//   final String name,ImageUrl,desc;
//   ProductList(this.name,this.ImageUrl,this.desc);
// }