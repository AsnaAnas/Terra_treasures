import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:terra_treasures/util/constants.dart';

class MyOrderPage extends StatelessWidget {
  const MyOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        leading: IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_circle_left_outlined)),
        title:  Center(child: Text("My Order",style: GoogleFonts.inder(),)),
      ),
      body: ListView.builder(
        itemCount: orderItems.length ,
        itemBuilder: (context,index)
      {
         final OrderItem=orderItems[index];
         return Column(
           children: [
            const SizedBox(
              height: 30,
            ),
           
             ListTile(
                 leading: Image.asset(OrderItem.imageUrl),
                 title: Text(OrderItem.name,style: GoogleFonts.inder(),),
                 subtitle: Row(
                   children: [
                    const Icon(Icons.currency_rupee,size: 15,),
                     Text(OrderItem.price.toString(),style: GoogleFonts.inder(),),
                   ],
                 ),
             ),
              const Divider(),
           ],
         );
      }),
    );
  }
}

class OrderItem {
  final String name;
  final String imageUrl;
  final double price;

  OrderItem({
    required this.name,
    required this.imageUrl,
    required this.price,
  });
}

List<OrderItem> orderItems = [
  OrderItem(
    name: 'Herbs & Spices Jar',
    imageUrl: 'assets/herbs_jar.png',
    price: 150,
  ),
  OrderItem(
    name: 'Coconut wooden Spoon',
    imageUrl: 'assets/spoon.png',
    price: 150,
  ),
];
