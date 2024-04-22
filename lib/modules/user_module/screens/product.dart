import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:terra_treasures/modules/user_module/screens/cartpage.dart';
import 'package:terra_treasures/modules/user_module/screens/home.dart';
import 'package:terra_treasures/modules/user_module/screens/productDetails.dart';
import 'package:terra_treasures/util/constants.dart';

class ProductsPage extends StatelessWidget {
  ProductsPage({super.key});

static List<String> title=['Cocunut spoon Wood(5pc)','Cocunut spoon Wood(5pc)','Cocunut spoon Wood(5pc)','Cocunut spoon Wood(5pc)'];
static List url=['assets/spoon.png','assets/spoon.png','assets/spoon.png','assets/spoon.png',];
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
                MaterialPageRoute(builder: (context) => const HomeScreen()),);
        }, icon: const Icon(Icons.arrow_circle_left_outlined)),
        title: Center(child:  Text("Kitchen" ,style: GoogleFonts.inder(),)),
        actions:  [
          Padding(
            padding: const EdgeInsets.all(20),
            child:IconButton(onPressed: (){
               Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CartPage()),);
            }, icon: const Icon(Icons.shopping_bag_outlined)),
          )
        ],
      ),
      body:   SafeArea(
        child: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProductDetailsPage()),
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
                      Icon(Icons.currency_rupee,size: 20,),
                      Text(data[index].desc),
                    ],
                  ),
                  leading: SizedBox(
                    width: 50,
                    height: 50,
                    child: Image.asset(data[index].ImageUrl),
                  ),
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