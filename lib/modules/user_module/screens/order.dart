
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:terra_treasures/model/orderProduct.dart';
import 'package:terra_treasures/modules/user_module/screens/controller/produc_controller.dart';
import 'package:terra_treasures/modules/user_module/screens/orderdetails.dart';
import 'package:terra_treasures/modules/user_module/screens/profile.dart';
import 'package:terra_treasures/util/constants.dart';

class MyOrderPage extends StatefulWidget {
  //final String productId;
  const MyOrderPage({Key? key}) : super(key: key);

  @override
  _MyOrderPageState createState() => _MyOrderPageState();
}

class _MyOrderPageState extends State<MyOrderPage> {
 ProductController productController = ProductController();
  late List<OrderProductModel> _orders = [];

   void initState() {
    super.initState();
    fetchOrders();
  }

 Future<void> fetchOrders() async {
  final userId = FirebaseAuth.instance.currentUser!.uid;
  final orders = await productController.getOrdersByUserId(userId);
  log(userId);
  setState(() {
    _orders = orders.cast<OrderProductModel>(); 
   print(_orders);// Cast to the new type
  });
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  ProfilePage()),
            );
          },
          icon: const Icon(Icons.arrow_circle_left_outlined),
        ),
        title: Center(child: Text("My Order", style: GoogleFonts.inder())),
      ),
      body: ListView.builder(
        itemCount: _orders.length,
        itemBuilder: (context, index) {
          final order = _orders[index];
          return Column(
            children: [
               const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  OrderDetails(productId: order.productId,)),
                  );
                },
                child: ListTile(
                 leading: Image.network(order.imageUrl), 
                  title: Text(order.productName, style: GoogleFonts.inder()),
                  subtitle: Row(
                    children: [
                      const Icon(Icons.currency_rupee, size: 15),
                      Text(order.price.toString(), style: GoogleFonts.inder()),
                    ],
                  ),
                ),
              ),
              const Divider(),
            ],
          );
        },
      ),
    );
  }
}

