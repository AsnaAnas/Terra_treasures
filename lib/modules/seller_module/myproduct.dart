import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:terra_treasures/modules/seller_module/myproduct_details.dart';
import 'package:terra_treasures/modules/seller_module/seller_home.dart';
import 'package:terra_treasures/util/constants.dart';

class MyProductPage extends StatelessWidget {
   MyProductPage({super.key});
  static List<String> title=['Recycled Egg shell Vase','Earing from Plastic','yarn Bottle Lmap','Cocunut spoon Wood(5pc)'];
static List url=['assets/product1.png','assets/product2.png','assets/lamp.png','assets/spoon.png',];
static List<String> sub=['150','150','150','150',];
final List<ProductList> data=List.generate(title.length, (index) => ProductList('${title[index]}', '${url[index]}', '${sub[index]}'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        leading: IconButton(onPressed: (){
           Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  SellerHome()),);
        }, icon: const Icon(Icons.arrow_circle_left_outlined)),
        title: Center(child:  Text("Kitchen" ,style: GoogleFonts.inder(),)),
      ),
      body:   SafeArea(
        child: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MyProductDetails()),
              );
          },
          child: ListView.builder(
            itemCount: data.length,
            itemBuilder: (context,index)
            {
              return Card(
                color: bgColor,
                child: ListTile(
                
                  title: Text(data[index].name),
                  subtitle: Row(
                    children: [
                      const Icon(Icons.currency_rupee,size: 20,),
                      Text(data[index].desc),
                    ],
                  ),
                  leading: SizedBox(
                    width: 50,
                    height: 50,
                    child: Image.asset(data[index].ImageUrl),
                  ),
                  trailing:  Text("Edit",
                  style: GoogleFonts.inder(color:Colors.black45),),
                ),
              );
            }
            
            ),
        ),
      )
 
    );
  }
}

class ProductList
{
  final String name,ImageUrl,desc;
  ProductList(this.name,this.ImageUrl,this.desc);
}