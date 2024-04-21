import 'package:floating_bottom_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:terra_treasures/modules/seller_module/add_details.dart';
import 'package:terra_treasures/modules/seller_module/add_product.dart';
import 'package:terra_treasures/modules/seller_module/myproduct.dart';
import 'package:terra_treasures/modules/user_module/moreinfo.dart';
import 'package:terra_treasures/modules/user_module/notification.dart';
import 'package:terra_treasures/modules/user_module/product.dart';
import 'package:terra_treasures/modules/user_module/profile.dart';
import 'package:terra_treasures/modules/user_module/sustain.dart';
import 'package:terra_treasures/util/constants.dart';

class SellerHome extends StatelessWidget {
  const SellerHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFEF7EB),
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: const Color(0xffFEF7EB),
        leading: 
        IconButton(onPressed: (){
           Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfilePage()),
              );
        }, icon: const Icon(Icons.account_circle,size: 50,)),
        title:  Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Column(
            children: [
              Text("Hi,Name",style: GoogleFonts.inder(),),
              Text("Welcome Back!",style: GoogleFonts.inder(color:Colors.grey,fontSize:16),),
            ],
          ),
        ),
        actions: [
           IconButton(onPressed: (){
             Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AddProductPage()),
              );
          }, icon: const Icon(Icons.add)),
          IconButton(onPressed: (){
             Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const NotificationPage()),
              );
          }, icon: const Icon(Icons.notifications_none_outlined))
        ],

      ),
      body: SafeArea(
        child: ListView(
         scrollDirection: Axis.vertical,
         children: [

          Column(
        
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30,left: 30,right: 30),
            child: TextFormField(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(10),
                border: OutlineInputBorder(
                  //borderSide: const BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(17)

                ),
                
                fillColor: Colors.white,
                filled: true,
                prefixIcon: const Icon(Icons.search),
                hintText: "Search",
                hintStyle: const TextStyle(color: Colors.grey)
              )
            ),
          ),
        Container(
          height: 200,
          width: double.maxFinite,
          margin: const EdgeInsets.only(top: 30,left: 20,right: 20,),
         
           decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
             color:kPrimaryColor,
           ),
           child:  Stack(
             children: [
              
              Padding(
                padding: const EdgeInsets.only(top: 10,left: 50,),
                child: Column(
                  children: [
                    Text("REDUCE\n REUSE \n RECYCLE",
                    style: GoogleFonts.irishGrover(color:const Color(0xffF3D98E),fontWeight:FontWeight.bold,fontSize:20),
                    textAlign: TextAlign.center,),
                    Text("Learn tips to apply these 3 steps ",
                style: GoogleFonts.inder(fontSize:13,fontWeight:FontWeight.bold),),
                const SizedBox(height: 10,),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xffF9E3A4)
                  ),
                  onPressed: (){
                    Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MoreInfo()),
              );
                  }, 
                  child: Text("More Information",style: GoogleFonts.inder(color:Colors.black,fontSize:11),))
                  ],
                ),
              ),
              
             ],
           ),
         
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10,top: 10,),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text("My Products",style: GoogleFonts.inder(fontSize:15),) ,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10,right: 20,left: 20),
          child: Container(
            height: 150,
            width: double.maxFinite,
            decoration: BoxDecoration(
                color:Colors.white,
                borderRadius: BorderRadius.circular(10),
            ),
            
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProductsPage()),
              );
                  },
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset("assets/product1.png"),
                      ),
                     
                    ],
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset("assets/product2.png"),
                    ),
                   
                  ],
                ),
                
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset("assets/fashion.png"),
                    ),
                   
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset("assets/kitchen.png"),
                    ),
                    
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset("assets/kitchen.png"),
                    ),
                    
                  ],
                ),

              ],
            ),
            
          ),
        ),
         Padding(
          padding: const EdgeInsets.only(top: 10,left: 10,),
          child: Align(
            alignment: Alignment.centerLeft,
            child:Text("Why Sustainability",style: GoogleFonts.inder(fontSize:15,),) ,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
               Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Sustainability()),);
            },
            child: Image.asset('assets/sustainability.png')),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 10,left: 10,right: 10),
          child: Text("Sustainability boils down to one core reason: to ensure the well-being of both our planet and ourselves, now and for future generations. It's about striking a balance between meeting our needs while preserving the resources and ecosystems that support all life. ",
          textAlign: TextAlign.justify,),
        ),
        
       
        ],
        
        
        
      ),
         ]

        ),

        ),

        bottomNavigationBar:  AnimatedBottomNavigationBar(
          barColor: kPrimaryColor,
          bottomBarCenterModel: BottomBarCenterModel(
            centerBackgroundColor: Colors.white,
            centerIcon: const FloatingCenterButton(
              child: Icon(Icons.move_up_rounded,color: kPrimaryColor,),), 
            centerIconChild: [
              FloatingCenterButtonChild(
                child: const Icon(Icons.auto_awesome_motion_rounded,color: kPrimaryColor,),
                onTap: () {
                  Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  MyProductPage()),
              );
                },
                ),
                FloatingCenterButtonChild(
                child: const Icon(Icons.cases_sharp,color:kPrimaryColor),
                onTap: () {
                  Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AddProductDetails()),
              );
                },
                ),

            ]), 
          bottomBar: const [
              BottomBarItem(
                icon: Icon(Icons.home,color: Colors.white,),
                 iconSelected: Icon(Icons.home),title: "Home",
                 titleStyle:TextStyle(color: AppColors.white),
                 dotColor: Colors.white
                 ),
                 BottomBarItem(
                icon: Icon(Icons.people_alt,color: Colors.white,),
                 iconSelected: Icon(Icons.people_alt),title: "Community",
                 titleStyle:TextStyle(color: AppColors.white),
                 dotColor: Colors.white)  
          ]),
        
    );
  }
}