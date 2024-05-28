// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:terra_treasures/model/address_model.dart';
// import 'package:terra_treasures/model/product_model.dart';
// import 'package:terra_treasures/modules/user_module/screens/controller/address_controller.dart';
// import 'package:terra_treasures/modules/user_module/screens/paymentmethod.dart';
// import 'package:terra_treasures/util/constants.dart';

// class OrderSummary extends StatefulWidget {
//   final String productId;
//   final int quantity;
//   //OrderSummary({super.key, required this.productId, required int quantity});
//   OrderSummary({Key? key, required this.productId, required this.quantity}) : super(key: key);


//   @override
//   State<OrderSummary> createState() => _OrderSummaryState();
// }

// class _OrderSummaryState extends State<OrderSummary> {
//   AddressController addressController = AddressController();
//   late Future<ProductModel> _productFuture;

//   @override
//   void initState() {
//     super.initState();
//     _productFuture = _fetchProductDetails(widget.productId);
//   }

//   Future<ProductModel> _fetchProductDetails(String productId) async {
//     DocumentSnapshot doc = await FirebaseFirestore.instance
//         .collection('product')
//         .doc(productId)
//         .get();
//     return ProductModel.fromDocument(doc);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: bgColor,
//       appBar: AppBar(
//         backgroundColor: bgColor,
//         leading: IconButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           icon: const Icon(Icons.arrow_circle_left_outlined),
//         ),
//         title: const Text("Order Summary"),
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.only(top: 30, right: 8, left: 8),
//           child: Column(
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   const Icon(Icons.check_box, color: kPrimaryColor, size: 30),
//                   Container(
//                     width: 50.0,
//                     height: 1.0,
//                     color: Colors.grey,
//                   ),
//                   const Icon(Icons.check_box, color: kPrimaryColor, size: 30),
//                   Container(
//                     width: 50.0,
//                     height: 1.0,
//                     color: Colors.grey,
//                   ),
//                   const Icon(Icons.looks_3_outlined, color: kPrimaryColor, size: 30),
//                 ],
//               ),
//               const Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text("Address"),
//                   Text("Order Summary"),
//                   Text("Payment"),
//                 ],
//               ),
//               const Divider(
//                 height: 50,
//                 thickness: 3,
//               ),
//               FutureBuilder<List<AddressModel>>(
//                 future: addressController.fetchUserAddresses(),
//                 builder: (context, snapshot) {
//                   if (snapshot.connectionState == ConnectionState.waiting) {
//                     return const Center(child: CircularProgressIndicator());
//                   } else if (snapshot.hasError) {
//                     return Center(child: Text('Error: ${snapshot.error}'));
//                   } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//                     return const Center(child: Text('Please add an address'));
//                   } else {
//                     var address = snapshot.data!.first;
//                     return Padding(
//                       padding: const EdgeInsets.only(left: 20),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(address.name, style: GoogleFonts.inder(fontSize: 16)),
//                               Text(address.house, style: GoogleFonts.inder(fontSize: 16)),
//                               Text(address.street, style: GoogleFonts.inder(fontSize: 16)),
//                               Text(address.city, style: GoogleFonts.inder(fontSize: 16)),
//                               Text(address.dist, style: GoogleFonts.inder(fontSize: 16)),
//                               Text(address.pincode, style: GoogleFonts.inder(fontSize: 16)),
//                             ],
//                           ),
//                           Row(
//                             children: [
//                               Text("Delivery Address", style: GoogleFonts.inder(color: Colors.grey)),
//                               const Icon(Icons.check_circle, color: Color(0xff0FA779)),
//                             ],
//                           ),
//                         ],
//                       ),
//                     );
//                   }
//                 },
//               ),
//               const Divider(
//                 height: 70,
//                 thickness: 3,
//               ),
//               Text(
//                 "Order Summary",
//                 style: GoogleFonts.inder(fontSize: 18),
//               ),
//               const Divider(
//                 height: 30,
//                 color: Colors.white,
//               ),
//               FutureBuilder<DocumentSnapshot>(
//                 future: FirebaseFirestore.instance
//                     .collection('product')
//                     .doc(widget.productId)
//                     .get(),
//                 builder: (context, snapshot) {
//                   if (snapshot.connectionState == ConnectionState.waiting) {
//                     return const Center(child: CircularProgressIndicator());
//                   } else if (snapshot.hasError) {
//                     return Center(child: Text('Error: ${snapshot.error}'));
//                   } else if (!snapshot.hasData || !snapshot.data!.exists) {
//                     return const Center(child: Text('Product not found'));
//                   } else {
//                     var productData = snapshot.data!.data() as Map<String, dynamic>;
//                     return Padding(
//                       padding: const EdgeInsets.symmetric(vertical: 8.0),
//                       child: Column(
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text("Product", style: GoogleFonts.inder(fontSize: 16)),
//                               Text("Quantity", style: GoogleFonts.inder(fontSize: 16)),
//                               Text("Price", style: GoogleFonts.inder(fontSize: 16)),

//                             ],
//                           ),
//                           const Divider(),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text(productData['pname'], style: GoogleFonts.inder(fontSize: 16)),
//                               Text(widget.quantity.toString(), style: GoogleFonts.inder(fontSize: 18)),
//                               Row(
//                                 children: [
//                                   const Icon(Icons.currency_rupee, size: 20),
//                                   Text(productData['price'].toString(), style: GoogleFonts.inder(fontSize: 18)),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     );
//                   }
//                 },
//               ),
//               const SizedBox(height: 100,),
//               Align(
//                 alignment: Alignment.bottomRight,
//                 child: SizedBox(
//                   width: 200,
//                   child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: kPrimaryColor,
//                     ),
//                     onPressed: () {
//                       var price = snapshot.data!['price'] * widget.quantity;
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => PaymentMethod(productId: widget.productId)),
//                       );
//                     },
//                     child: Padding(
//                       padding: const EdgeInsets.all(15),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text("CONFIRM", style: GoogleFonts.inder(fontSize: 18, color: Colors.white)),
//                           const SizedBox(width: 8),
//                           const Icon(Icons.check, color: Colors.white),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }



import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:terra_treasures/model/address_model.dart';
import 'package:terra_treasures/model/product_model.dart';
import 'package:terra_treasures/modules/user_module/screens/controller/address_controller.dart';
import 'package:terra_treasures/modules/user_module/screens/paymentmethod.dart';
import 'package:terra_treasures/util/constants.dart';

class OrderSummary extends StatefulWidget {
  final String productId;
  final int quantity;

  OrderSummary({Key? key, required this.productId, required this.quantity}) : super(key: key);

  @override
  State<OrderSummary> createState() => _OrderSummaryState();
}

class _OrderSummaryState extends State<OrderSummary> {
  AddressController addressController = AddressController();
  late Future<ProductModel> _productFuture;

  @override
  void initState() {
    super.initState();
    _productFuture = _fetchProductDetails(widget.productId);
  }

  Future<ProductModel> _fetchProductDetails(String productId) async {
    DocumentSnapshot doc = await FirebaseFirestore.instance
        .collection('product')
        .doc(productId)
        .get();
    return ProductModel.fromDocument(doc);
  }

  @override
  Widget build(BuildContext context) {
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
        title: const Text("Order Summary"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 30, right: 8, left: 8),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.check_box, color: kPrimaryColor, size: 30),
                  Container(
                    width: 50.0,
                    height: 1.0,
                    color: Colors.grey,
                  ),
                  const Icon(Icons.check_box, color: kPrimaryColor, size: 30),
                  Container(
                    width: 50.0,
                    height: 1.0,
                    color: Colors.grey,
                  ),
                  const Icon(Icons.looks_3_outlined, color: kPrimaryColor, size: 30),
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Address"),
                  Text("Order Summary"),
                  Text("Payment"),
                ],
              ),
              const Divider(
                height: 50,
                thickness: 3,
              ),
              FutureBuilder<List<AddressModel>>(
                future: addressController.fetchUserAddresses(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('Please add an address'));
                  } else {
                    var address = snapshot.data!.first;
                    return Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(address.name, style: GoogleFonts.inder(fontSize: 16)),
                              Text(address.house, style: GoogleFonts.inder(fontSize: 16)),
                              Text(address.street, style: GoogleFonts.inder(fontSize: 16)),
                              Text(address.city, style: GoogleFonts.inder(fontSize: 16)),
                              Text(address.dist, style: GoogleFonts.inder(fontSize: 16)),
                              Text(address.pincode, style: GoogleFonts.inder(fontSize: 16)),
                            ],
                          ),
                          Row(
                            children: [
                              Text("Delivery Address", style: GoogleFonts.inder(color: Colors.grey)),
                              const Icon(Icons.check_circle, color: Color(0xff0FA779)),
                            ],
                          ),
                        ],
                      ),
                    );
                  }
                },
              ),
              const Divider(
                height: 70,
                thickness: 3,
              ),
              Text(
                "Order Summary",
                style: GoogleFonts.inder(fontSize: 18),
              ),
              const Divider(
                height: 30,
                color: Colors.white,
              ),
              FutureBuilder<DocumentSnapshot>(
                future: FirebaseFirestore.instance
                    .collection('product')
                    .doc(widget.productId)
                    .get(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || !snapshot.data!.exists) {
                    return const Center(child: Text('Product not found'));
                  } else {
                    var productData = snapshot.data!.data() as Map<String, dynamic>;
                    double price = productData['price'] * widget.quantity;
                    //log(price);
                    print(price);
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Product", style: GoogleFonts.inder(fontSize: 16)),
                              Text("Quantity", style: GoogleFonts.inder(fontSize: 16)),
                              Text("Price", style: GoogleFonts.inder(fontSize: 16)),
                            ],
                          ),
                          const Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(productData['pname'], style: GoogleFonts.inder(fontSize: 16)),
                              Text(widget.quantity.toString(), style: GoogleFonts.inder(fontSize: 18)),
                              Row(
                                children: [
                                  const Icon(Icons.currency_rupee, size: 20),
                                  Text(price.toString(), style: GoogleFonts.inder(fontSize: 18)),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }
                },
              ),
              const SizedBox(height: 100),
              StreamBuilder(stream: FirebaseFirestore.instance
                    .collection('product')
                    .doc(widget.productId)
                    .snapshots(),
               builder: (context,snapshot)
               {
                return Align(
                alignment: Alignment.bottomRight,
                child: SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kPrimaryColor,
                    ),
                    onPressed: () {
                      
                      double price = snapshot.data!['price'] * widget.quantity;
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PaymentMethod(productId: widget.productId, price: price)),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("CONFIRM", style: GoogleFonts.inder(fontSize: 18, color: Colors.white)),
                          const SizedBox(width: 8),
                          const Icon(Icons.check, color: Colors.white),
                        ],
                      ),
                    ),
                  ),
                ),
              );
               })
              
            ],
          ),
        ),
      ),
    );
  }
}

