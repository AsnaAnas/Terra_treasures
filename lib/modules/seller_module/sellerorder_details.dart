import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:terra_treasures/util/constants.dart';

class SellerOrderDetails extends StatelessWidget {
  const SellerOrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        leading: IconButton(onPressed: (){}, 
        icon: const Icon(Icons.arrow_circle_left_outlined)),
        title: Text("Order #452789",
         style: GoogleFonts.inder(color:Colors.black),),
        centerTitle: true,
      ),
      body:  SingleChildScrollView(
        child: Column(
          children: [
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Order Status",
                   style: GoogleFonts.inder(color:Colors.black),),
                  Container(
                    height: 30,
                    width:200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.red)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Update status", style: GoogleFonts.inder(color:Colors.black),),
                        IconButton(onPressed: (){}, icon: Icon(Icons.arrow_drop_down))
                      ],
                    ),
                    
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 200,top: 10),
              child: Container(
                            height: 30,
                            width: 150,
                            decoration: BoxDecoration(
                              color: const Color(0xff1877F2),
                              borderRadius: BorderRadius.circular(10)
                            ),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text("Processing",
                              style:GoogleFonts.inder(color:Colors.white,fontSize:16))),
                          ),
            ),
            const SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Order date",
                  style:GoogleFonts.inder(color:Colors.black,fontSize:16)),
                  Text("26th Feb, 2024",
                  style:GoogleFonts.inder(color:Colors.black,fontSize:16))
                ],
              ),
            ),
            const Divider(),
           Padding(
             padding: const EdgeInsets.only(top: 10,right: 200),
             child: Text("Customer Details",style:GoogleFonts.inder(color:Colors.black,fontSize:18)),
           ),
           Padding(
             padding: const EdgeInsets.all(10),
             child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Name",style:GoogleFonts.inder(color:Colors.black,fontSize:16)),
                 Text("Example",style:GoogleFonts.inder(color:Colors.black,fontSize:16)),
              ],
             ),
           ),
            Padding(
             padding: const EdgeInsets.all(10),
             child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Phone Number",style:GoogleFonts.inder(color:Colors.black,fontSize:16)),
                 Text("9876543210",style:GoogleFonts.inder(color:Colors.black,fontSize:16)),
              ],
             ),
           ),
             Padding(
             padding: const EdgeInsets.all(10),
             child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Email Address",style:GoogleFonts.inder(color:Colors.black,fontSize:16)),
                 Text("example@gmail.com",style:GoogleFonts.inder(color:Colors.black,fontSize:16)),
              ],
             ),
           ),
           Padding(
             padding: const EdgeInsets.all(10),
             child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Delivery address",style:GoogleFonts.inder(color:Colors.black,fontSize:16)),
                 Text("abc building \n123,xyz street  ",style:GoogleFonts.inder(color:Colors.black,fontSize:16)),
              ],
             ),
           ),
           const Divider(),
            Padding(
              padding: const EdgeInsets.only(top: 10,right: 240,),
              child: Text("Product",style:GoogleFonts.inder(color:Colors.black,fontSize:18)),
            ),
            ListTile(
              leading: Image.asset("assets/product2.png"),
              title: Text("Earings from plastics",
              style:GoogleFonts.inder(color:Colors.black,fontSize:16)),
              subtitle: Row(
                children: [
                  const Icon(Icons.currency_rupee_sharp,size: 20,color: Colors.grey,),
                  Text("150",style:GoogleFonts.inder(color:Colors.grey,)),
                ],
              ),
              trailing: Text("N231450",style:GoogleFonts.inder(color:Colors.black,)),
            ),
            const SizedBox(height: 40,),
            Padding(
              padding: const EdgeInsets.only(left: 200,),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: kPrimaryColor,
                  fixedSize: const Size(150, 35)
                ),
                onPressed: (){}, 
              child: Text("SET",
              style:GoogleFonts.inder(color:Colors.white,fontWeight:FontWeight.bold))),
            )
          ],
        ),
      ),
    );
  }
}