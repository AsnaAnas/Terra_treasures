import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:terra_treasures/modules/user_module/home.dart';
import 'package:terra_treasures/modules/user_module/paymentpage.dart';
import 'package:terra_treasures/util/constants.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    List imageList=[
      'assets/spoon.png',
      'assets/herbs_jar.png',
      'assets/herbs_jar.png',
      'assets/herbs_jar.png',
    ];
    List productTitle=[
      'Coconut Spoon',
      'Herbs & Spice Jar',
      'Herbs & Spice Jar',
      'Herbs & Spice Jar'
    ];
    List price=[
      '150',
      '300',
      '300',
      '300'
    ];
    return  Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        leading: IconButton(onPressed: (){
           Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),);
        }, icon: const Icon(Icons.arrow_circle_left_outlined)),
        title: const Text("Cart"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: ListView.builder(
                itemCount: imageList.length,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context,index)
              {
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    Checkbox(
                      splashRadius: 20,
                      activeColor: kPrimaryColor,
                      value: true, 
                      onChanged: (val){}),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          imageList[index],
                          height: 80,
                          width: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                       Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            productTitle[index],
                            style: GoogleFonts.inder(
                              fontWeight:FontWeight.w900,
                              fontSize:16,
                            ),
                            ),
                           const SizedBox(height:20 ,),
                            Row(
                              children: [
                                const Icon(Icons.currency_rupee,size: 20,color: kPrimaryColor,),
                                Text(
                                  price[index],
                                  style: GoogleFonts.inder(
                                    color:kPrimaryColor,
                                    fontSize:16,
                                  ),
                                ),
                              ],
                            )
                        ],
                      ),
                       Row(
                        children: [
                          IconButton(onPressed: (){}, icon:const Icon(Icons.minimize_sharp,color: Colors.grey,) ),
                          //const SizedBox(width: 20,),
                          Text(
                            "1",
                            style: GoogleFonts.inder(
                              fontSize:16,
                              fontWeight:FontWeight.w700,
                            ),
                          ),
                          //const SizedBox(width: 5,),
                          IconButton(onPressed: (){}, icon:const Icon(Icons.add,color: Colors.grey,) )
                         
                        ],
                                             )
                  ],),
                  
                );
              }),
            ),
            const SizedBox(
              height: 30,
            ),
             Padding(
               padding: const EdgeInsets.all(15),
               child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   Text(
                    "Select All",
                    style: GoogleFonts.inder(
                      fontSize:16,
                      fontWeight:FontWeight.w500
                    ),
                  ),
                  Checkbox(
                    splashRadius: 20,
                    activeColor: kPrimaryColor,
                    value: false,
                     onChanged: (val){})
                ],
                ),       
             ),
             const Padding(
               padding: EdgeInsets.all(10),
               child: Divider(
                height: 20,
                thickness: 2,
               ),
             ),
             const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                  Text(
                    "Total Payment",
                    style: GoogleFonts.inder(
                        fontSize:16,
                        fontWeight:FontWeight.w500
                      ),),
                      Row(
                        children: [
                          const Icon(Icons.currency_rupee,size: 20,),
                          Text(
                            "450",
                             style: GoogleFonts.inder(
                            fontSize:16,
                            fontWeight:FontWeight.w500
                          ),),
                        ],
                      )
                 ],
                 ),
              ),
              const SizedBox(height: 80,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: kPrimaryColor,
                  fixedSize: const Size(300, 35)
                ),
                onPressed: (){
                   Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PaymentPage()),);
                },
               child: Padding(
                 padding: const EdgeInsets.only(left: 60),
                 child: Row(
                   children: [
                     Text("Make Payment | ",
                     style: GoogleFonts.inder(color:Colors.white,fontWeight:FontWeight.w600),),
                     const Icon(Icons.currency_rupee,size: 20,color: Colors.white,),
                     Text("450",
                     style: GoogleFonts.inder(color:Colors.white,fontWeight:FontWeight.w600))
                   ],
                 ),
               ) )
          ],
        ),
      ),
    );
  }
}
