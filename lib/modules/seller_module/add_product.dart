import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:terra_treasures/modules/seller_module/add_details.dart';
import 'package:terra_treasures/modules/seller_module/seller_home.dart';
import 'package:terra_treasures/util/constants.dart';

class AddProductPage extends StatefulWidget {
   AddProductPage({super.key});

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {


  File? selectedImage;
  int tappedIndex=0;
  final _auth=FirebaseAuth.instance;

  final _pnameController=TextEditingController();

  final _prodetailController=TextEditingController();

   final _ecoController=TextEditingController();
   final _priceController=TextEditingController();

  final _brandController=TextEditingController();

  final _meterialController=TextEditingController();

  final _methodController=TextEditingController();



  Future addDetails(Map<String,dynamic> productInfo, String userId)async
{
   return FirebaseFirestore.instance
   .collection('product')
   .doc(userId)
   .set(productInfo);
}

addProduct() async
{
   String uid= _auth.currentUser!.uid;
            Map<String,dynamic> productInfo = {
              "prod_name": _pnameController.text,
              "details": _prodetailController.text,
              "eco":_ecoController.text,
              "category" : tappedIndex,
              "price":_priceController,
              "brand":_brandController,
              "material":_meterialController,
              "method":_methodController,
               "id":uid,
            };
            await addDetails(productInfo, uid);
            //const SnackBar(content: Text("Details added to firebase Succesfully"));
}

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

      List<Color> containerColors = [
    Colors.white,
    Colors.white,
    Colors.white,
   
  ];



  @override
  Widget build(BuildContext context) {
   
    return  Scaffold(
      backgroundColor: bgColor,
       appBar: AppBar(
        backgroundColor: bgColor,
        leading: IconButton(onPressed: (){
           Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  SellerHome()),
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
              padding: const EdgeInsets.only(top: 40,right: 200 ),
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
               padding: const EdgeInsets.only(top: 40,right: 30,left: 30),
               child: 
                   TextFormField(
                    controller: _pnameController,
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
                controller: _prodetailController,
                decoration: InputDecoration(
                  hintText: "Product Details",
                  hintStyle: GoogleFonts.inder(
                    color:Colors.grey
                  )
                ),
               ),
             ),
             Padding(
               padding: const EdgeInsets.only(top: 40,right: 30,left: 30),
               child: TextFormField(
                controller: _ecoController,
                decoration: InputDecoration(
                  hintText: "How it become Eco friendly",
                  hintStyle: GoogleFonts.inder(
                    color:Colors.grey
                  )
                ),
               ),
             ),
              Padding(
              padding: const EdgeInsets.only(left: 28,right: 28,top: 40),
              child: TextFormField(
                controller: _priceController,
                decoration: InputDecoration(
                  hintText: "Price(Rs)",
                  hintStyle:  GoogleFonts.inder(
                    color:Colors.black38
                  ),
                ),
              ),
            ),Padding(
              padding:const EdgeInsets.only(left: 28,right: 28,top: 40),
              child: TextFormField(
                 controller: _brandController,
                decoration: InputDecoration(
                  hintText: "Brand",
                  hintStyle:  GoogleFonts.inder(
                    color:Colors.black38
                  ),
                ),
              ),
            ),Padding(
              padding: const EdgeInsets.only(left: 28,right: 28,top: 40),
              child: TextFormField(
                 controller: _meterialController,
                decoration: InputDecoration(
                  hintText: "Material",
                  hintStyle:  GoogleFonts.inder(
                    color:Colors.black38
                  ),
                ),
              ),
            ),Padding(
              padding: const EdgeInsets.only(left: 28,right: 28,top: 40,),
              child: TextFormField(
                 controller: _methodController,
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
                MaterialPageRoute(builder: (context) =>  AddProductPage()),
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
           
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20,right: 20),

                  
        child: Column(
            children: [
                  Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(
              3,
              (index) => GestureDetector(
                onTap: () {
                  // Set the tappedIndex to the index of the tapped container
                  setState(() {
                    tappedIndex = index;
                    
                  });
                },
                child: Container(
                  width: 100,
                  height: 100,
                  color: tappedIndex == index ? Colors.grey : Colors.white,
                  child: Column(
                    children: [
                      Image.asset("${gridMap.elementAt(index)['image']}"),
                      Text("${gridMap.elementAt(index)['title']}")
                    ],
                  ),
                ),
              ),
            ),
          ),

            ],
            
          ),
          
            ),
            const SizedBox(height: 30,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: kPrimaryColor
              ),
              onPressed: (){
                addProduct();
                 
                 Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  AddProductDetails()),
              );
              }, 
            child: Text("CONTINUE ADD PRODUCT",style: GoogleFonts.inder(color:Colors.white),))
          ],
          
        ),
        
        ),
          ]
        )
       )
    );
  }

void showImagePickerOption(BuildContext context)
  {
      Future<void> _pickedImageGallery()async{
      final pickedImage= await ImagePicker().pickImage(source: ImageSource.gallery);
      if(pickedImage==null) return;
      setState(() {
        selectedImage=File(pickedImage.path);
      });
    }
      Future<void> _pickedImageCamera()async{
      final pickedImage= await ImagePicker().pickImage(source: ImageSource.camera);
      if(pickedImage==null) return;
      setState(() {
        selectedImage=File(pickedImage.path);
      });
    }
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
                          IconButton(onPressed: (){
                            _pickedImageGallery();
                          }, 
                          icon: const Icon(Icons.image,size: 50,)),
                          //const Icon(Icons.image,size: 50,),
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
                          IconButton(onPressed: (){
                            _pickedImageCamera();
                          },
                           icon:const Icon(Icons.camera_alt,size: 50,),),
                         // const Icon(Icons.camera_alt,size: 50,),
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

 