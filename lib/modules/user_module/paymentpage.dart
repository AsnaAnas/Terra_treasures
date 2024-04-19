import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:terra_treasures/modules/user_module/addresspage.dart';
import 'package:terra_treasures/modules/user_module/cartpage.dart';
import 'package:terra_treasures/modules/user_module/orderpage.dart';
import 'package:terra_treasures/util/constants.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
   
    return  Scaffold(
      backgroundColor: bgColor,
      appBar:AppBar(
        backgroundColor: bgColor,
        leading: IconButton(onPressed: (){
           Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CartPage()),);
        }, 
        icon: const Icon(Icons.arrow_circle_left_outlined)),
        title: const Text("Payment"),
        centerTitle: true,
      ) ,
      body:  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 30,left: 8,right: 8),
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
                   const Icon(Icons.looks_two_outlined,color: kPrimaryColor,size: 30,),
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
               Row(
                children: [
                  const Icon(Icons.add,color: Color(0xff0FA779),),
                  Text(
                    "Add an address",
                    style: GoogleFonts.inder(
                      color:const Color(0xff0FA779)
                    ),
                    )
                ],
              ),
              Row(
                children: [
                 Text(
                  "Deliver to:\nabc,\n123 Building,\nxyz,Kerala\n9087123456",
                  style: GoogleFonts.inder(
                    fontSize:16
                  ),),
                  const SizedBox(width: 50,),
                  Container(
                     height: 35,
                    width: 200,
                    decoration:  BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color:kPrimaryColor),
            
                    ),
                    child: TextButton(onPressed: (){
                      Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddressPage()),
              );
                    }, 
                    child:  Text(
                      "CHANGE",
                      style: GoogleFonts.inder(
                        color:kPrimaryColor,
                        fontWeight:FontWeight.w800
                      ),
                      ) ),

                  )
                ],
              ),
              const Divider(
                height: 50,
                thickness: 3,
              ),
              
              Padding(
                padding: const EdgeInsets.only(left: 50,right: 30),
                child: Container(
                  child: Row(
                    children: [
                      Image.asset('assets/herbs_jar.png'),
                       Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            Text(
                              "Herbs & Spice Jar",
                              style: GoogleFonts.inder(),),
                            Text(
                              "Wooden Meterial",
                               style: GoogleFonts.inder(),
                              ),
                            Row(
                              children: [
                                const Icon(Icons.currency_rupee,size: 20,),
                                Text("300",
                                 style: GoogleFonts.inder(),)
                              ],
                            ),
                            const Row(
                              children: [
                                Icon(Icons.star,color: Colors.amber,),
                                Icon(Icons.star,color: Colors.amber,),
                                Icon(Icons.star,color: Colors.amber,),
                                Icon(Icons.star,color: Colors.amber,),
                                Icon(Icons.star,color: Color.fromARGB(255, 213, 213, 213),),
                              ]
                              
                            )
                           
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const Divider(
                height: 50,
                thickness: 3,
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    Text("Price Details",
                    style: GoogleFonts.inder(
                      fontSize:18,
                      ),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Total Price",
                          style: GoogleFonts.inder(
                      fontSize:16,
                      ),),
                      Row(
                        children: [
                          const Icon(Icons.currency_rupee,size: 20,),
                          Text("300",
                          style: GoogleFonts.inder(),),
                        ],
                      )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Delivery Charge",
                          style: GoogleFonts.inder(
                      fontSize:16,
                      ),),
                      Text("FREE",
                      style: GoogleFonts.inder(
                      fontSize:16,
                      color:const Color(0xff34A853)
                      ),)
                        ],
                      )
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: 
                ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(200, 35),
                  backgroundColor: kPrimaryColor,
                ),
                onPressed: (){
                  Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => OrderSummury()),
              );
                }, 
              child: Text(
                "CONTINUE",
                style: GoogleFonts.inder(
                  color:Colors.white,
                  fontWeight:FontWeight.w500,
                  fontSize:18),))
              )
              
            ],
          ),
        ),
      ),
    );
  }
}