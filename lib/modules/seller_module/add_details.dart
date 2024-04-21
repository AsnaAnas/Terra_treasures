import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:terra_treasures/modules/seller_module/add_product.dart';
import 'package:terra_treasures/util/constants.dart';

class AddProductDetails extends StatelessWidget {
  const AddProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: bgColor,
       appBar: AppBar(
        backgroundColor: bgColor,
        leading: IconButton(onPressed: (){
           Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AddProductPage()),
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
              padding: const EdgeInsets.only(top: 40,right: 200,),
              child: Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black26),
                  borderRadius: BorderRadius.circular(17)
                ),
                child:  Positioned(
                  child:IconButton(onPressed: (){
                    showImagePickerOption(context);
                  }, 
                  icon: const Icon(Icons.camera_alt_outlined)) ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 28,right: 28,top: 20),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Product Name",
                  hintStyle:  GoogleFonts.inder(
                    color:Colors.black38
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 28,right: 28,top: 15),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Price(Rs)",
                  hintStyle:  GoogleFonts.inder(
                    color:Colors.black38
                  ),
                ),
              ),
            ),Padding(
              padding:const EdgeInsets.only(left: 28,right: 28,top: 15),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Brand",
                  hintStyle:  GoogleFonts.inder(
                    color:Colors.black38
                  ),
                ),
              ),
            ),Padding(
              padding: const EdgeInsets.only(left: 28,right: 28,top: 15),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Material",
                  hintStyle:  GoogleFonts.inder(
                    color:Colors.black38
                  ),
                ),
              ),
            ),Padding(
              padding: const EdgeInsets.only(left: 28,right: 28,top: 15,),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Method of production",
                  hintStyle:  GoogleFonts.inder(
                    color:Colors.black38
                  ),
                ),
              ),
            ),
             Padding(
               padding: const EdgeInsets.all(20),
               child: InkWell(
                onTap: () {
                   Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AddProductPage()),
              );
                },
                 child: Row(
                  children: [
                    const Icon(Icons.add,color: kPrimaryColor,),
                    Text("Add more products",
                    style: GoogleFonts.inder(
                      color:kPrimaryColor
                    ),)
                  ],
                               ),
               ),
             ),
             const SizedBox(height: 30,),
             ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: kPrimaryColor
              ),
              onPressed: (){
                  ScaffoldMessenger.of(context).showSnackBar(const 
            SnackBar(content: Text("Product Posted Successfully"),
            showCloseIcon: true,
            backgroundColor: Color(0xff436850),
            duration: Duration(seconds: 2),
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.only(bottom:50,left: 50,right: 50),));
              },
              child: Text("POST NOW",
              style: GoogleFonts.inder(
                    color:Colors.white
                  ),))
          ],
        ),
       ),
    );
  }
  void showImagePickerOption(BuildContext context)
  {
    showModalBottomSheet(context: context,
     builder: (builder){
        return  Padding(
          padding: const EdgeInsets.only(top: 50,),
          child: SizedBox(
            height: 200,
            width: 500,
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {},
                    child:  SizedBox(
                      child: Column(
                        children: [
                          const Icon(Icons.image,size: 50,),
                          Text("Gallery",style: GoogleFonts.inder(),)
                        ],
                      ),
                    ),
                  ),
                ),
                 Expanded(
                   child: InkWell(
                    onTap: () {},
                    child:  SizedBox(
                      child: Column(
                        children: [
                          const Icon(Icons.camera_alt,size: 50,),
                          Text("Camera",style: GoogleFonts.inder(),)
                        ],
                      ),
                    ),
                                 ),
                 )
              ],
            ),
          ),
        );
     }
     );
  }
}