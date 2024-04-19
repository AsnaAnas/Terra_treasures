

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:terra_treasures/modules/user_module/home.dart';
import 'package:terra_treasures/modules/user_module/paymentpage.dart';
import 'package:terra_treasures/util/button.dart';
import 'package:terra_treasures/util/constants.dart';

class ProductDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
       backgroundColor: bgColor,
        leading:  IconButton(onPressed: (){
           Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),);
        }, 
        icon: Icon(Icons.arrow_circle_left_outlined)),
        actions: const [
         Padding(
           padding: EdgeInsets.all(10),
           child: Icon(Icons.shopping_bag_outlined),
         ),
        ]
      ),
      body: ListView(
        
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20),
                child: Image.asset('assets/spoon1.png'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  product.name,
                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
              
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Icon(Icons.currency_rupee_outlined),
                    Text(
                      product.price.toStringAsFixed(2),
                      style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
          
              const SizedBox(height: 20,),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Container(
                        height: 35,
                        width: 200,
                        decoration:  BoxDecoration(
                          borderRadius: BorderRadius.circular(17),
                          border: Border.all(color: Colors.black),
                                    
                        ),
                        child:  TextButton(
                          onPressed: (){
                           // Navigator.push(context,MaterialPageRoute(builder: (context) =>  RegisterScreen()) );
                                
                        }, 
                        child:  Padding(
                          padding: const EdgeInsets.only(left: 50),
                          child: Row(
                            children: [
                               Text(" Quantity:5",style: GoogleFonts.inder(color:Colors.black),),
                              
                               const Icon(Icons.arrow_drop_down,color: Colors.black,)
                            ],
                          ),
                        )
                        )
                        ),
                      ),
          
                      const SizedBox(
                        height:20,
                      ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10,left: 50,),
                      child: Container(
                        height: 40,
                        width: 300,
                        decoration:  BoxDecoration(
                          borderRadius: BorderRadius.circular(17),
                          border: Border.all(color: kPrimaryColor),
                                    
                        ),
                        child:  TextButton(
                          
                          onPressed: (){
                          // Navigator.push(context,MaterialPageRoute(builder: (context) =>  const CartPage()) );
                          ScaffoldMessenger.of(context).showSnackBar(const 
            SnackBar(content: Text("Product added to cart"),
            showCloseIcon: true,
            backgroundColor: Color(0xff436850),
            duration: Duration(seconds: 2),
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.only(bottom:50,left: 50,right: 50),));
                                
                        }, 
                        
                        child:  Align(
                          alignment: Alignment.center,
                          child: Text(" Add to Cart",style: GoogleFonts.inder(color:kPrimaryColor),),
                        )
                        )
                                
                      ),
                    ),
                              const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10,left: 50),
                      child: PageButton(onPressed: (){
                        Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PaymentPage()),
              );
                      }, text: "Buy Now"),
                    )
            ],
          ),
          const Divider(
            height:80,
            thickness: 3,
            color: Color.fromARGB(255, 227, 224, 224),
          
          ),
         
          Padding(
           padding: const EdgeInsets.all(8.0),
           child: Text("Product Details",style: GoogleFonts.inder(fontSize:22),),
         ),
          Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  product.description,
                  style:  GoogleFonts.inder(fontSize:15,),
                ),
              ),
          const Divider(
            height:80,
            thickness: 3,
            color: Color.fromARGB(255, 227, 224, 224),
          
          ),  
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("How it become eco friendly",style: GoogleFonts.inder(fontSize:20),),
          ) ,
           Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("crafted from 100% natural coconut shells, they are biodegradable and compostable. After they are disposed of, they will break down into organic materials naturally.",
            style: GoogleFonts.inder(),),
          )
          //  Padding(
          //       padding: const EdgeInsets.all(8.0),
          //       child: Text(
          //        product.subdesc,
          //         style: const TextStyle(fontSize: 15,),
          //       ),
          //     ),           
        ], 
      
      ),
      
    );
  }
}



class Product {
  final String imageUrl;
  final String name;
  final String description;
  final double price;
  final String subdesc;
  


  Product({required this.imageUrl, required this.name, required this.description, required this.price,required this.subdesc });
  

}

Product product = Product(
  imageUrl: 'assets/spoon1.png',
  name: 'Coconut Wood Spoon(5pcs) ',
  description: 'Care Instructions:\nWash it with our untesil scrubber and soapy water.\nDo not put it in the dishwasher.',
  
  subdesc:'crafted from 100% natural coconut shells, they are biodegradable and compostable. After they are disposed of, they will break down into organic materials naturally.',
  price: 150,
);