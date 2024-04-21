import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:terra_treasures/modules/seller_module/add_details.dart';
import 'package:terra_treasures/modules/seller_module/seller_home.dart';
import 'package:terra_treasures/util/constants.dart';

class AddProductPage extends StatelessWidget {
  const AddProductPage({super.key});

  @override
  Widget build(BuildContext context) {
   
    return  Scaffold(
      backgroundColor: bgColor,
       appBar: AppBar(
        backgroundColor: bgColor,
        leading: IconButton(onPressed: (){
           Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SellerHome()),
              );
        },
         icon: const Icon(Icons.arrow_circle_left_outlined)),
         title: Text("Product Details",
         style: GoogleFonts.inder(),),
         centerTitle: true,

       ),
       body: SingleChildScrollView(
        child: Column(
          children: [
             Padding(
               padding: const EdgeInsets.only(top: 20,),
               child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.looks_one,color: kPrimaryColor,size: 30,),
                    Container(
                    width: 50.0, 
                    height: 1.0, 
                    color: Colors.grey, 
                     ),
                     const Icon(Icons.looks_two_outlined,color: Color(0xffE8A125),size: 30,),
                   
                    
                  ],
                ),
             ),
             Padding(
               padding: const EdgeInsets.only(top: 40,right: 30,left: 30),
               child: 
                   TextFormField(
                    decoration: InputDecoration(
                      hintText: "Product Name",
                      hintStyle: GoogleFonts.inder(
                        color:Colors.grey
                      )
                    ),
                   ),
                 
               ),
             
             Padding(
               padding: const EdgeInsets.only(top: 40,right: 30,left: 30),
               child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Product Details",
                  hintStyle: GoogleFonts.inder(
                    color:Colors.grey
                  )
                ),
               ),
             ),Padding(
               padding: const EdgeInsets.only(top: 40,right: 30,left: 30),
               child: TextFormField(
                decoration: InputDecoration(
                  hintText: "How it become Eco friendly",
                  hintStyle: GoogleFonts.inder(
                    color:Colors.grey
                  )
                ),
               ),
             ),
             Padding(
               padding: const EdgeInsets.only(top: 30,right: 220,),
               child: SizedBox(
                height: 30,
                 child: Text("Category",
                 style:GoogleFonts.inder(
                        color:Colors.grey,
                      )),
               ),
             ),
            const Padding(
              padding: EdgeInsets.all(24.0),
              child: GridPage(),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: kPrimaryColor
              ),
              onPressed: (){
                 Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AddProductDetails()),
              );
              }, 
            child: Text("CONTINUE ADD PRODUCT",style: GoogleFonts.inder(color:Colors.white),))
          ],
          
        ),
        
        ),
    );
  }
}

class GridPage extends StatelessWidget {
  const GridPage({super.key});

  @override
  Widget build(BuildContext context) {
     final List<Map<String,dynamic>> gridMap=[
      {
        "title": "Kitchen",
        "image":"assets/kitchen.png"
      },
       {
        "title": "fashion",
        "image":"assets/fashion.png"
      },
       {
        "title": "Home",
        "image":"assets/home.png"
      },
       {
        "title": "Kitchen",
        "image":"assets/kitchen.png"
      },
    ];
    return GridView.builder (
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,crossAxisSpacing: 10.0,mainAxisSpacing: 10.0),
      itemCount: gridMap.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (_, index) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
           // border: Border.all(),
            color: Colors.white
            ),
         child: Column(
          children: [
            Image.asset("${gridMap.elementAt(index)['image']}"),
            Text(gridMap.elementAt(index)['title'],
            style: GoogleFonts.inder(),),

          ],
         ),
        );
      },
    );
  }
}