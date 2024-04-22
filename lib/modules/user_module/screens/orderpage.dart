import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:terra_treasures/modules/user_module/screens/paymentmethod.dart';
import 'package:terra_treasures/util/constants.dart';

class OrderSummury extends StatelessWidget {
  const OrderSummury({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        leading: IconButton(onPressed: (){},
         icon: const Icon(Icons.arrow_circle_left_outlined)),
         title: const Text("Order Summury"),
         centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 30,right: 8,left: 8),
          child: Column(
            children: [
              Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(Icons.check_box,color: kPrimaryColor,size: 30,),
                      Container(
                      width: 50.0, 
                      height: 1.0, 
                      color: Colors.grey, 
                       ),
                       const Icon(Icons.check_box,color: kPrimaryColor,size: 30,),
                      Container(
                      width: 50.0, 
                      height: 1.0, 
                      color: Colors.grey, 
                       ),
                       const Icon(Icons.looks_3_outlined,color: kPrimaryColor,size: 30,),
                      
                    ],
                  ),
                  const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Address"),
                  Text("Order Summury"),
                  Text("Payment")
                ],
              ),
                  const Divider(
                    height: 50,
                    thickness: 3,
                  ),
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Deliver to:\nabc,\n123 Building,xyz,Kerala\n9012345678",style: GoogleFonts.inder(),),
                        Text("Delivery Address",style: GoogleFonts.inder(color:Colors.grey),),
                        const Icon(Icons.check_circle,color: Color(0xff0FA779),)
                      ],
                       ),
                   ),
                   const Divider(
                    height: 70,
                    thickness: 3,
                   ),
                   Text(
                    "Order Summury",
                    style: GoogleFonts.inder(
                     fontSize:18,
                    ),),
                    const Divider(
                      height: 30,
                      color: Colors.white,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Herbs & Spice Jar",
                        style: GoogleFonts.inder(
                     fontSize:16,
                    ),),
                    Text("Qty:1",style: GoogleFonts.inder(
                     fontSize:18,
                    ),),
                    
                    Row(
                      children: [
                        const Icon(Icons.currency_rupee,size: 20,),
                        Text("300",style: GoogleFonts.inder(
                         fontSize:18,
                        ),),
                      ],
                    ),
                      ],
                      
                    ),
                    const SizedBox(height: 200,),
                    Align(
                      alignment: Alignment.bottomRight,
                     child:  SizedBox(
                      width: 200,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: kPrimaryColor,
                        ),
                        onPressed: (){
                          Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const PaymentMethod()),
              );
                        }, 
                      child:  Padding(
                        padding: const EdgeInsets.all(15),
                        child: Row(
                          children: [
                            Text("CONFIRM",
                            style: GoogleFonts.inder(
                            fontSize:18,
                            color:Colors.white
                            )
                            ),
                           const Icon(Icons.check,color: Colors.white,)
                          ],
                        ),
                      )),
                    )
                    )
                    
            ],
          ),
        ),
      ),
    );
  }
}