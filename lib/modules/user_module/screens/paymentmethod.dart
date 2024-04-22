import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:terra_treasures/modules/user_module/screens/orderplaced.dart';
import 'package:terra_treasures/util/constants.dart';

class PaymentMethod extends StatelessWidget {
  const PaymentMethod({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        leading: IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_circle_left_outlined)),
        title: Text("Payment",
        style: GoogleFonts.inder(
                     fontSize:18,
                    )),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
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
                     const Icon(Icons.check_box,color: kPrimaryColor,size: 30,),
                    Container(
                    width: 50.0, 
                    height: 1.0, 
                    color: Colors.grey, 
                     ),
                     const Icon(Icons.check_box,color: kPrimaryColor,size: 30,),
                    
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
                height: 70,
                thickness: 3,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: 
                Text("Payment Method",
              style: GoogleFonts.inder(
                     fontSize:18,
                    ))
              ),
             Padding(
               padding: const EdgeInsets.only(top: 30,left: 20,right: 20),
               child: Container(
                height: 60,
                width: 500,
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(15)
                ),
                child: TextButton(onPressed: (){}, 
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Wallet/UPI",
                      style: GoogleFonts.inder(
                        color:Colors.white
                      ),),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 180),
                      child: Icon(Icons.check_circle,color: Colors.white,),
                    )
                  ],
                )),
               ),
             ),
             const SizedBox(
              height: 25,
             ),
             Padding(
               padding: const EdgeInsets.only(top: 30,left: 20,right: 20),
               child: Container(
                  height: 60,
                  width: 500,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all()
                  ),
                  child: TextButton(onPressed: (){}, 
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Wallet/UPI",
                        style: GoogleFonts.inder(
                          color:Colors.black
                        ),),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 180),
                        child: Icon(Icons.circle_outlined,color: Colors.grey,),
                      )
                      
                    ],
                  ),
                  
                  ),
                 ),
             ),
             const SizedBox(
              height: 25,
             ),
             Padding(
               padding: const EdgeInsets.only(top: 30,left: 20,right: 20),
               child: Container(
                  height: 60,
                  width: 500,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all()
                  ),
                  child: TextButton(onPressed: (){}, 
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Wallet/UPI",
                        style: GoogleFonts.inder(
                          color:Colors.black
                        ),),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 180),
                        child: Icon(Icons.circle_outlined,color: Colors.grey,),
                      )
                      
                    ],
                  ),
                  
                  ),
                 ),
             ),

              Padding(
                padding: const EdgeInsets.only(top: 150,left: 10,right: 10),
                child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   const Row(
                     children: [
                       Icon(Icons.circle_outlined,color: Colors.grey,),
                        Text("Total:"),
                     ],
                   ),
                   
                   const Row(
                     children: [
                       Icon(Icons.currency_rupee,size: 20,),
                       Text("300")
                     ],
                   ),
                   ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kPrimaryColor
                    ),
                    onPressed: (){
                      Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const OrderPlaced()),
              );
                    }, 

                   child: Text("PROCEED",
                   style: GoogleFonts.inder(color:Colors.white),),)
                 ],
                             ),
              ) 
            ],
            
          ),
        ),
        
      ),
    );
  }
}