import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:terra_treasures/modules/user_module/screens/order.dart';
import 'package:terra_treasures/util/constants.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        leading: IconButton(onPressed: (){
          Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MyOrderPage()),
              );
        }, icon: const Icon(Icons.arrow_circle_left_outlined)),
        title: Center(child: Text("My Order",style: GoogleFonts.inder(),)),
      ),
      body:
       Padding(
         padding: const EdgeInsets.only(top: 10,left: 20,right: 20,),
         child: ListView(
          children: [
            Image.asset('assets/spoon1.png'),
             Text('Coconut Wooden Spoon(5pc)',style: GoogleFonts.inder(fontWeight:FontWeight.bold,fontSize:22),),
             Row(
              children: [
                const Icon(Icons.currency_rupee,size: 20,),
                Text("150",style: GoogleFonts.inder(fontWeight:FontWeight.bold,fontSize:22),),
              ],
             ),
             const Divider(),
             Padding(
               padding: const EdgeInsets.only(top: 20),
               child: Text("Order Details",
               style: GoogleFonts.inder(fontSize:20,)
               ),
             ),
              ListTile(
              leading: Text("Order Id",style: GoogleFonts.inder(fontSize:16,color:Colors.grey),),
              trailing: Text("#4562718",style: GoogleFonts.inder(fontSize:16,color:Colors.grey),),
             ),
              ListTile(
              leading: Text("Delivery Date",style: GoogleFonts.inder(fontSize:16,color:Colors.grey),),
              trailing: Text("22nd Feb,2024",style: GoogleFonts.inder(fontSize:16,color:Colors.grey),),
             ),
             ListTile(
              trailing: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: kPrimaryColor,
                fixedSize: const Size(150, 35),
              ),
              onPressed: (){}
             , child: Text("Cancel Order",style: GoogleFonts.inder(fontSize:15,color:Colors.white),)),
         
             )
             
          ],
               ),
       ),
    );
  }
}

// class ItemDetails
// {
//   final String name;
//   final String imageUrl;
//   final double price;

//    ItemDetails({
//     required this.name,
//     required this.imageUrl,
//     required this.price,
//   });
// }

// List<ItemDetails> orderItems = [
//   ItemDetails(
//     name: 'Herbs & Spices Jar',
//     imageUrl: 'assets/herbs_jar.png',
//     price: 150,
//   ),
// ];