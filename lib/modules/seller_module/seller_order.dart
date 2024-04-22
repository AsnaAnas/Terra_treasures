import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:terra_treasures/util/constants.dart';

class SellerOrderPage extends StatelessWidget {
  const SellerOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4 ,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: kPrimaryColor,
            title:  Text(
              "Orders",
               style: GoogleFonts.inder(color:Colors.white),
            ),
            centerTitle: true,
            bottom: const TabBar(
              labelColor: Colors.yellow,
              unselectedLabelColor: Colors.white,
                tabs: [
                Tab(text: 'All',),
                Tab(text: 'Cancel',),
                Tab(text: 'Pending',),
                Tab(text: 'Completed',)
              ],
            ),
          ),
          body:  TabBarView(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: TextFormField(
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.all(10),
                                    border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(17)
                    
                                    ),
                                    
                                    fillColor: Colors.white,
                                    filled: true,
                                    prefixIcon: const Icon(Icons.search),
                                    hintText: "Search for an order",
                                    hintStyle: GoogleFonts.inder(color:Colors.grey)
                                  )
                                ),
                  ),
                  const Text("All Orders (7)"),
                 Container(
                  child: Column(
                    children: [
                      ListTile(
                        leading: const Icon(Icons.notes),
                        title: Text("Earnings from Plastic",
                        style: GoogleFonts.inder(color:Colors.black),
                        ),
                        subtitle: Text("#452789 . 26th Feb 2024",
                        style:GoogleFonts.inder(color:Colors.grey) ,),
                        trailing: Text("N231450",style:GoogleFonts.inder(color:Colors.black,fontSize:16) ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 200,),
                        child: Container(
                          height: 35,
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
                      
                    ],
                  ),
                  
                 ),
                 Container(
                  child: Column(
                    children: [
                      ListTile(
                        leading: const Icon(Icons.notes),
                        title: Text("Earnings from Plastic",
                        style: GoogleFonts.inder(color:Colors.black),
                        ),
                        subtitle: Text("#452789 . 26th Feb 2024",
                        style:GoogleFonts.inder(color:Colors.grey) ,),
                        trailing: Text("N231450",style:GoogleFonts.inder(color:Colors.black,fontSize:16) ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 200,),
                        child: Container(
                          height: 35,
                          width: 150,
                          decoration: BoxDecoration(
                            color: const Color(0xff0FA779),
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text("Completed",
                            style:GoogleFonts.inder(color:Colors.white,fontSize:16))),
                        ),
                      ),
                      
                    ],
                  ),
                  
                 ),Container(
                  child: Column(
                    children: [
                      ListTile(
                        leading: const Icon(Icons.notes),
                        title: Text("Earnings from Plastic",
                        style: GoogleFonts.inder(color:Colors.black),
                        ),
                        subtitle: Text("#452789 . 26th Feb 2024",
                        style:GoogleFonts.inder(color:Colors.grey) ,),
                        trailing: Text("N231450",style:GoogleFonts.inder(color:Colors.black,fontSize:16) ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 200,),
                        child: Container(
                          height: 35,
                          width: 150,
                          decoration: BoxDecoration(
                            color: const Color(0xffE8A125),
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text("Pending",
                            style:GoogleFonts.inder(color:Colors.white,fontSize:16))),
                        ),
                      ),
                      
                    ],
                  ),
                  
                 ),Container(
                  child: Column(
                    children: [
                      ListTile(
                        leading: const Icon(Icons.notes),
                        title: Text("Earnings from Plastic",
                        style: GoogleFonts.inder(color:Colors.black),
                        ),
                        subtitle: Text("#452789 . 26th Feb 2024",
                        style:GoogleFonts.inder(color:Colors.grey) ,),
                        trailing: Text("N231450",style:GoogleFonts.inder(color:Colors.black,fontSize:16) ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 200,),
                        child: Container(
                          height: 35,
                          width: 150,
                          decoration: BoxDecoration(
                            color: const Color(0xffEB4335),
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text("Cancelled",
                            style:GoogleFonts.inder(color:Colors.white,fontSize:16))),
                        ),
                      ),
                      
                    ],
                  ),
                  
                 ),Container(
                  child: Column(
                    children: [
                      ListTile(
                        leading: const Icon(Icons.notes),
                        title: Text("Earnings from Plastic",
                        style: GoogleFonts.inder(color:Colors.black),
                        ),
                        subtitle: Text("#452789 . 26th Feb 2024",
                        style:GoogleFonts.inder(color:Colors.grey) ,),
                        trailing: Text("N231450",style:GoogleFonts.inder(color:Colors.black,fontSize:16) ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 200,),
                        child: Container(
                          height: 35,
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
                      
                    ],
                  ),
                  
                 )
                ],
              ),
                Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: TextFormField(
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.all(10),
                                    border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(17)
                    
                                    ),
                                    
                                    fillColor: Colors.white,
                                    filled: true,
                                    prefixIcon: const Icon(Icons.search),
                                    hintText: "Search for an order",
                                    hintStyle: GoogleFonts.inder(color:Colors.grey)
                                  )
                                ),
                  ),
                  const Text("Cancelled Orders (3)"),
                 Container(
                  child: Column(
                    children: [
                      ListTile(
                        leading: const Icon(Icons.notes),
                        title: Text("Earnings from Plastic",
                        style: GoogleFonts.inder(color:Colors.black),
                        ),
                        subtitle: Text("#452789 . 26th Feb 2024",
                        style:GoogleFonts.inder(color:Colors.grey) ,),
                        trailing: Text("N231450",style:GoogleFonts.inder(color:Colors.black,fontSize:16) ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 200,),
                        child: Container(
                          height: 35,
                          width: 150,
                          decoration: BoxDecoration(
                            color: const Color(0xffEB4335),
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text("cancelled",
                            style:GoogleFonts.inder(color:Colors.white,fontSize:16))),
                        ),
                      ),
                      
                    ],
                  ),
                  
                 ),
                 Container(
                  child: Column(
                    children: [
                      ListTile(
                        leading: const Icon(Icons.notes),
                        title: Text("Earnings from Plastic",
                        style: GoogleFonts.inder(color:Colors.black),
                        ),
                        subtitle: Text("#452789 . 26th Feb 2024",
                        style:GoogleFonts.inder(color:Colors.grey) ,),
                        trailing: Text("N231450",style:GoogleFonts.inder(color:Colors.black,fontSize:16) ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 200,),
                        child: Container(
                          height: 35,
                          width: 150,
                          decoration: BoxDecoration(
                            color: const Color(0xffEB4335),
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text("cancelled",
                            style:GoogleFonts.inder(color:Colors.white,fontSize:16))),
                        ),
                      ),
                      
                    ],
                  ),
                  
                 ),Container(
                  child: Column(
                    children: [
                      ListTile(
                        leading: const Icon(Icons.notes),
                        title: Text("Earnings from Plastic",
                        style: GoogleFonts.inder(color:Colors.black),
                        ),
                        subtitle: Text("#452789 . 26th Feb 2024",
                        style:GoogleFonts.inder(color:Colors.grey) ,),
                        trailing: Text("N231450",style:GoogleFonts.inder(color:Colors.black,fontSize:16) ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 200,),
                        child: Container(
                          height: 35,
                          width: 150,
                          decoration: BoxDecoration(
                            color: const Color(0xffEB4335),
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text("Cancelled",
                            style:GoogleFonts.inder(color:Colors.white,fontSize:16))),
                        ),
                      ),
                      
                    ],
                  ),
                  
                 ),
                ],
              ),
                 Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: TextFormField(
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.all(10),
                                    border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(17)
                    
                                    ),
                                    
                                    fillColor: Colors.white,
                                    filled: true,
                                    prefixIcon: const Icon(Icons.search),
                                    hintText: "Search for an order",
                                    hintStyle: GoogleFonts.inder(color:Colors.grey)
                                  )
                                ),
                  ),
                  const Text("Pending Orders (3)"),
                 Container(
                  child: Column(
                    children: [
                      ListTile(
                        leading: const Icon(Icons.notes),
                        title: Text("Earnings from Plastic",
                        style: GoogleFonts.inder(color:Colors.black),
                        ),
                        subtitle: Text("#452789 . 26th Feb 2024",
                        style:GoogleFonts.inder(color:Colors.grey) ,),
                        trailing: Text("N231450",style:GoogleFonts.inder(color:Colors.black,fontSize:16) ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 200,),
                        child: Container(
                          height: 35,
                          width: 150,
                          decoration: BoxDecoration(
                            color: const Color(0xffE8A125),
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text("Pending",
                            style:GoogleFonts.inder(color:Colors.white,fontSize:16))),
                        ),
                      ),
                      
                    ],
                  ),
                  
                 ),
                 Container(
                  child: Column(
                    children: [
                      ListTile(
                        leading: const Icon(Icons.notes),
                        title: Text("Earnings from Plastic",
                        style: GoogleFonts.inder(color:Colors.black),
                        ),
                        subtitle: Text("#452789 . 26th Feb 2024",
                        style:GoogleFonts.inder(color:Colors.grey) ,),
                        trailing: Text("N231450",style:GoogleFonts.inder(color:Colors.black,fontSize:16) ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 200,),
                        child: Container(
                          height: 35,
                          width: 150,
                          decoration: BoxDecoration(
                            color: const Color(0xffE8A125),
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text("Pending",
                            style:GoogleFonts.inder(color:Colors.white,fontSize:16))),
                        ),
                      ),
                      
                    ],
                  ),
                  
                 ),Container(
                  child: Column(
                    children: [
                      ListTile(
                        leading: const Icon(Icons.notes),
                        title: Text("Earnings from Plastic",
                        style: GoogleFonts.inder(color:Colors.black),
                        ),
                        subtitle: Text("#452789 . 26th Feb 2024",
                        style:GoogleFonts.inder(color:Colors.grey) ,),
                        trailing: Text("N231450",style:GoogleFonts.inder(color:Colors.black,fontSize:16) ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 200,),
                        child: Container(
                          height: 35,
                          width: 150,
                          decoration: BoxDecoration(
                            color: const Color(0xffE8A125),
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text("Pending",
                            style:GoogleFonts.inder(color:Colors.white,fontSize:16))),
                        ),
                      ),
                      
                    ],
                  ),
                  
                 ),
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: TextFormField(
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.all(10),
                                    border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(17)
                    
                                    ),
                                    
                                    fillColor: Colors.white,
                                    filled: true,
                                    prefixIcon: const Icon(Icons.search),
                                    hintText: "Search for an order",
                                    hintStyle: GoogleFonts.inder(color:Colors.grey)
                                  )
                                ),
                  ),
                  const Text("Completed Orders (3)"),
                 Container(
                  child: Column(
                    children: [
                      ListTile(
                        leading: const Icon(Icons.notes),
                        title: Text("Earnings from Plastic",
                        style: GoogleFonts.inder(color:Colors.black),
                        ),
                        subtitle: Text("#452789 . 26th Feb 2024",
                        style:GoogleFonts.inder(color:Colors.grey) ,),
                        trailing: Text("N231450",style:GoogleFonts.inder(color:Colors.black,fontSize:16) ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 200,),
                        child: Container(
                          height: 35,
                          width: 150,
                          decoration: BoxDecoration(
                            color: const Color(0xff0FA779),
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text("Completed",
                            style:GoogleFonts.inder(color:Colors.white,fontSize:16))),
                        ),
                      ),
                      
                    ],
                  ),
                  
                 ),
                 Container(
                  child: Column(
                    children: [
                      ListTile(
                        leading: const Icon(Icons.notes),
                        title: Text("Earnings from Plastic",
                        style: GoogleFonts.inder(color:Colors.black),
                        ),
                        subtitle: Text("#452789 . 26th Feb 2024",
                        style:GoogleFonts.inder(color:Colors.grey) ,),
                        trailing: Text("N231450",style:GoogleFonts.inder(color:Colors.black,fontSize:16) ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 200,),
                        child: Container(
                          height: 35,
                          width: 150,
                          decoration: BoxDecoration(
                            color: const Color(0xff0FA779),
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text("Completed",
                            style:GoogleFonts.inder(color:Colors.white,fontSize:16))),
                        ),
                      ),
                      
                    ],
                  ),
                  
                 ),Container(
                  child: Column(
                    children: [
                      ListTile(
                        leading: const Icon(Icons.notes),
                        title: Text("Earnings from Plastic",
                        style: GoogleFonts.inder(color:Colors.black),
                        ),
                        subtitle: Text("#452789 . 26th Feb 2024",
                        style:GoogleFonts.inder(color:Colors.grey) ,),
                        trailing: Text("N231450",style:GoogleFonts.inder(color:Colors.black,fontSize:16) ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 200,),
                        child: Container(
                          height: 35,
                          width: 150,
                          decoration: BoxDecoration(
                            color: const Color(0xff0FA779),
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text("Completed",
                            style:GoogleFonts.inder(color:Colors.white,fontSize:16))),
                        ),
                      ),
                      
                    ],
                  ),
                  
                 ),
                ],
              ),
             
            ],
          ),
      ),
    );
  }
}