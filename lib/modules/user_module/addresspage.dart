import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:terra_treasures/util/constants.dart';

class AddressPage extends StatelessWidget {
  const AddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        leading: IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_circle_left_outlined)),
        title: Text("Add delivery address",
        style: GoogleFonts.inder(fontSize:18,),),
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
                    const Icon(Icons.looks_one,color: kPrimaryColor,size: 30,),
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
                Column(
                  children: [
                  TextFormField(
                    cursorHeight: 20,
                    obscureText: false,
                    decoration: InputDecoration(
                  enabledBorder:  OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey),
                     borderRadius: BorderRadius.circular(17),
                   ),
                  fillColor: bgColor,
                  filled: true,
                  hintText: "First Name(Required)",
                  hintStyle: GoogleFonts.inder(color:Colors.grey)
                ),
                  ),
                  SizedBox(height: 10,),
                  TextFormField(
                    cursorHeight: 20,
                    obscureText: false,
                    decoration: InputDecoration(
                  enabledBorder:  OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey),
                     borderRadius: BorderRadius.circular(17),
                   ),
                  fillColor: bgColor,
                  filled: true,
                  hintText: "Phone Number(Required)",
                  hintStyle: GoogleFonts.inder(color:Colors.grey)
                ),
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 170,
                        child: TextFormField(
                          
                          cursorHeight: 20,
                          obscureText: false,
                          decoration: InputDecoration(
                        enabledBorder:  OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey),
                           borderRadius: BorderRadius.circular(17),
                           
                         ),
                        fillColor: bgColor,
                        filled: true,
                        hintText: "Pincode(Required)",
                        hintStyle: GoogleFonts.inder(color:Colors.grey),
                        
                         ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                       // width: 100,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: kPrimaryColor,
                          ),
                          onPressed: (){}, 
                        child:  Row(
                          children: [
                            const Icon(Icons.my_location_outlined,color: Colors.white,),
                            Text(
                              "Use my location",
                              style: GoogleFonts.inder(
                                color:Colors.white
                              ),),
                          ],
                        ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    children: [
                      SizedBox(
                        width: 170,
                        child: TextFormField(
                                
                                cursorHeight: 20,
                                obscureText: false,
                                decoration: InputDecoration(
                              enabledBorder:  OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.grey),
                                 borderRadius: BorderRadius.circular(17),
                                 
                               ),
                              fillColor: bgColor,
                              filled: true,
                              hintText: "City(Required)",
                              hintStyle: GoogleFonts.inder(color:Colors.grey),
                              
                               ),
                              ),
                      ),
                      SizedBox(width: 20,),

                      SizedBox(
                    width: 170,
                    child: TextFormField(
                            
                            cursorHeight: 20,
                            obscureText: false,
                            decoration: InputDecoration(
                          enabledBorder:  OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.grey),
                             borderRadius: BorderRadius.circular(17),
                             
                           ),
                          fillColor: bgColor,
                          filled: true,
                          hintText: "State(Required)",
                          hintStyle: GoogleFonts.inder(color:Colors.grey),
                          
                           ),
                          ),
                  ),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  TextFormField(
                          
                          cursorHeight: 20,
                          obscureText: false,
                          decoration: InputDecoration(
                        enabledBorder:  OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey),
                           borderRadius: BorderRadius.circular(17),
                           
                         ),
                        fillColor: bgColor,
                        filled: true,
                        hintText: "House No:,Building name(Required)",
                        hintStyle: GoogleFonts.inder(color:Colors.grey),
                        
                         ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                                
                                cursorHeight: 20,
                                obscureText: false,
                                decoration: InputDecoration(
                              enabledBorder:  OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.grey),
                                 borderRadius: BorderRadius.circular(17),
                                 
                               ),
                              fillColor: bgColor,
                              filled: true,
                              hintText: "Road name,Area, Colony(Required)",
                              hintStyle: GoogleFonts.inder(color:Colors.grey),
                              
                               ),
                              ),
                              const SizedBox(height: 30,),
                              SizedBox(
                                width: 300,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                  backgroundColor: kPrimaryColor
                                  ),
                                  onPressed: (){}, 
                                child:  Text(
                                  "SAVE ADDRESS",
                                  style: GoogleFonts.inder(color:Colors.white),)),
                              )
                  ],
                )
            ],
          ),
        ),
      ),
    );
  }
}