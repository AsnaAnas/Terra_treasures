


// import 'dart:developer';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:terra_treasures/model/order_model.dart';
// import 'package:terra_treasures/model/product_model.dart';
// import 'package:terra_treasures/util/constants.dart';

// class OrderDetails extends StatelessWidget {
//   final String productId;
//   OrderDetails({super.key, required this.productId});

//   @override
//   Widget build(BuildContext context) {
//     String userId = FirebaseAuth.instance.currentUser!.uid;
//     log(userId);
//     return Scaffold(
//       backgroundColor: bgColor,
//       appBar: AppBar(
//         backgroundColor: bgColor,
//         leading: IconButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             icon: const Icon(Icons.arrow_circle_left_outlined)),
//         title: Center(
//           child: Text(
//             "My Order",
//             style: GoogleFonts.inder(),
//           ),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.only(
//           top: 10,
//           left: 20,
//           right: 20,
//         ),
//         child: StreamBuilder<DocumentSnapshot>(
//           stream: FirebaseFirestore.instance.collection('product').doc(productId).snapshots(),
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return Center(child: CircularProgressIndicator());
//             }
//             if (snapshot.hasError) {
//               return Center(child: Text('Something went wrong'));
//             }
//             if (!snapshot.hasData || !snapshot.data!.exists) {
//               return Center(child: Text('Product not found'));
//             }

//             ProductModel productModel = ProductModel.fromMap(snapshot.data!.data() as Map<String, dynamic>);
//             return ListView(
//               children: [
//                 Image.network(productModel.imageUrl),
//                 Text(
//                   productModel.pname,
//                   style: GoogleFonts.inder(fontWeight: FontWeight.bold, fontSize: 22),
//                 ),
//                 Row(
//                   children: [
//                     const Icon(Icons.currency_rupee, size: 20),
//                     Text(
//                       productModel.price.toString(),
//                       style: GoogleFonts.inder(fontWeight: FontWeight.bold, fontSize: 22),
//                     ),
//                   ],
//                 ),
//                 const Divider(),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 20),
//                   child: Text(
//                     "Order Details",
//                     style: GoogleFonts.inder(fontSize: 20),
//                   ),
//                 ),
//                 StreamBuilder(stream:  
//                 FirebaseFirestore.instance
//               .collection("product")
//               .where("product_id", isEqualTo: productId)
//               .snapshots(),
//                  builder: ((context, snapshot) {
//                   log(productId);
//                   if (snapshot.connectionState == ConnectionState.waiting) {
//               return Center(child: CircularProgressIndicator());
//             }
//             if (snapshot.hasError) {
//               return Center(child: Text('Something went wrong'));
//             }
            

//                   //  OrderModel orderModel = OrderModel.fromMap(snapshot.data!());
//                   // var order = snapshot.data!.docs.map((doc) => OrderModel.fromMap(doc.data() as Map<String, dynamic>));
//                   var order = snapshot.data!.docs.first;
//                     OrderModel orderModel = OrderModel.fromMap(order.data() as Map<String, dynamic>);

//                    return ListTile(
//                   leading: Text(
//                     "Order Id",
//                     style: GoogleFonts.inder(fontSize: 16, color: Colors.grey),
//                   ),
//                   trailing: Text(
//                     orderModel.id.toString(),
//                     style: GoogleFonts.inder(fontSize: 16, color: Colors.grey),
//                   ),
//                 );
//                  })),
//                 StreamBuilder(stream:FirebaseFirestore.instance.collection('order').doc(productId).snapshots() ,
//                  builder: (context,snapshot){
//                    OrderModel orderModel = OrderModel.fromMap(snapshot.data!.data() as Map<String, dynamic>);
//                   return ListTile(
//                   leading: Text(
//                     "Order Date",
//                     style: GoogleFonts.inder(fontSize: 16, color: Colors.grey),
//                   ),
//                   trailing: Text(
//                    orderModel.date ,
//                     style: GoogleFonts.inder(fontSize: 16, color: Colors.grey),
//                   ),
//                 );
//                  }),
                
//                 ListTile(
//                   trailing: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: kPrimaryColor,
//                       fixedSize: const Size(150, 35),
//                     ),
//                     onPressed: () {},
//                     child: Text(
//                       "Cancel Order",
//                       style: GoogleFonts.inder(fontSize: 15, color: Colors.white),
//                     ),
//                   ),
//                 )
//               ],
//             );
//           },
//         ),
//       ),
//     );
//   }
// }




import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:terra_treasures/model/order_model.dart';
import 'package:terra_treasures/model/product_model.dart';
import 'package:terra_treasures/util/constants.dart';

class OrderDetails extends StatelessWidget {
  final String productId;
  OrderDetails({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    String userId = FirebaseAuth.instance.currentUser!.uid;
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_circle_left_outlined),
        ),
        title: Center(
          child: Text(
            "My Order",
            style: GoogleFonts.inder(),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 10,
          left: 20,
          right: 20,
        ),
        child: StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance.collection('product').doc(productId).snapshots(),
          builder: (context, productSnapshot) {
            if (productSnapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (productSnapshot.hasError) {
              return Center(child: Text('Something went wrong'));
            }
            if (!productSnapshot.hasData || !productSnapshot.data!.exists) {
              return Center(child: Text('Product not found'));
            }

            ProductModel productModel = ProductModel.fromMap(productSnapshot.data!.data() as Map<String, dynamic>);
            return ListView(
              children: [
                Image.network(productModel.imageUrl),
                Text(
                  productModel.pname,
                  style: GoogleFonts.inder(fontWeight: FontWeight.bold, fontSize: 22),
                ),
                Row(
                  children: [
                    const Icon(Icons.currency_rupee, size: 20),
                    Text(
                      productModel.price.toString(),
                      style: GoogleFonts.inder(fontWeight: FontWeight.bold, fontSize: 22),
                    ),
                  ],
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    "Order Details",
                    style: GoogleFonts.inder(fontSize: 20),
                  ),
                ),
                StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('order')
                      .where('product_id', isEqualTo: productId)
                      .snapshots(),
                  builder: (context, orderSnapshot) {
                    if (orderSnapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }
                    if (orderSnapshot.hasError) {
                      return Center(child: Text('Something went wrong'));
                    }
                    if (!orderSnapshot.hasData || orderSnapshot.data!.docs.isEmpty) {
                      return Center(child: Text('Order not found'));
                    }

                    var order = orderSnapshot.data!.docs.first;
                    OrderModel orderModel = OrderModel.fromMap(order.data() as Map<String, dynamic>);
                    log(orderModel.id.toString());

                    return Column(
                      children: [   
                        ListTile(
                          leading: Text(
                            "Order Id",
                            style: GoogleFonts.inder(fontSize: 16, color: Colors.grey),
                          ),
                          trailing: Text(
                            orderModel.id.toString(),
                            style: GoogleFonts.inder(fontSize: 16, color: Colors.grey),
                          ),
                        ),
                        ListTile(
                          leading: Text(
                            "Delivery Date",
                            style: GoogleFonts.inder(fontSize: 16, color: Colors.grey),
                          ),
                          trailing: Text(
                            orderModel.date,
                            style: GoogleFonts.inder(fontSize: 16, color: Colors.grey),
                          ),
                        ),
                      ],
                    );
                  },
                ),
                ListTile(
                  trailing: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kPrimaryColor,
                      fixedSize: const Size(150, 35),
                    ),
                    onPressed: () {},
                    child: Text(
                      "Cancel Order",
                      style: GoogleFonts.inder(fontSize: 15, color: Colors.white),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

