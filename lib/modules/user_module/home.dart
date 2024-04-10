// import 'package:floating_bottom_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:terra_treasures/util/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFEF7EB),
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: const Color(0xffFEF7EB),
        leading: 
        IconButton(onPressed: (){}, icon: const Icon(Icons.account_circle,size: 50,)),
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
          IconButton(onPressed: (){}, icon: const Icon(Icons.notifications_none_outlined))
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
          margin: EdgeInsets.only(top: 30,left: 20,right: 20,),
         
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
                    backgroundColor: Color(0xffF9E3A4)
                  ),
                  onPressed: (){}, 
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
            child: Text("Eco friendly Alteratives",style: GoogleFonts.inder(fontSize:15),) ,
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
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset("assets/kitchen.png"),
                    ),
                    Text("Kitchen",style: GoogleFonts.inder(),),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset("assets/home.png"),
                    ),
                    Text("Home",style: GoogleFonts.inder(),),
                  ],
                ),
                
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset("assets/fashion.png"),
                    ),
                    Text("Fashion",style: GoogleFonts.inder(),),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset("assets/kitchen.png"),
                    ),
                    Text("Kitchen",style: GoogleFonts.inder(),),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset("assets/kitchen.png"),
                    ),
                    Text("Kitchen",style: GoogleFonts.inder(),),
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
          child: Image.asset('assets/sustainability.png'),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 10,left: 10,right: 10),
          child: Text("Sustainability boils down to one core reason: to ensure the well-being of both our planet and ourselves, now and for future generations. It's about striking a balance between meeting our needs while preserving the resources and ecosystems that support all life. ",
          textAlign: TextAlign.justify,),
        )
       
        ],
        
        
        
      ),
         ]
         
      
      
        )
        ),
        // bottomNavigationBar: BottomNavigationBar(items: const [
        //   BottomNavigationBarItem(icon:Icon(Icons.home) ,label: 'home'),
        //   BottomNavigationBarItem(icon: Icon(Icons.more_outlined),label: "more"),
        //   BottomNavigationBarItem(icon: Icon(Icons.people_alt_rounded),label: 'Community')
        // ]
        // ),
        
    );
  }
}