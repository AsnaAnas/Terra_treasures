


import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:terra_treasures/model/address_model.dart';
import 'package:terra_treasures/model/order_model.dart';
import 'package:terra_treasures/model/product_model.dart';
import 'package:terra_treasures/model/user_model.dart';
import 'package:terra_treasures/modules/seller_module/seller_order.dart';
import 'package:terra_treasures/util/constants.dart';

class SellerOrderDetails extends StatefulWidget {
  final String productId;
  const SellerOrderDetails({super.key, required this.productId});

  @override
  State<SellerOrderDetails> createState() => _SellerOrderDetailsState();
}

class _SellerOrderDetailsState extends State<SellerOrderDetails> {
  late String selectedStatus;
  String? selectedItem;
  final List<String> items = ['Pending', 'Processing', 'Cancelled', 'Completed'];

  @override
  void initState() {
    super.initState();
    selectedStatus = 'Pending'; // Initial status
  }

  Future<OrderModel> fetchOrderDetails(String productId) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('order')
        .where('product_id', isEqualTo: productId)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      var data = querySnapshot.docs.first.data() as Map<String, dynamic>;
      return OrderModel.fromMap(data);
    } else {
      throw Exception('Order not found');
    }
  }

  Future<ProductModel> fetchProductDetails(String productId) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('product')
        .where('pid', isEqualTo: productId)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      var data = querySnapshot.docs.first.data() as Map<String, dynamic>;
      return ProductModel.fromMap(data);
    } else {
      throw Exception('Product not found');
    }
  }

  Future<UserModel> fetchUserDetails(String userId) async {
    DocumentSnapshot docSnapshot = await FirebaseFirestore.instance
        .collection('register')
        .doc(userId)
        .get();

    if (docSnapshot.exists) {
      var data = docSnapshot.data() as Map<String, dynamic>;
      return UserModel.fromMap(data);
    } else {
      throw Exception('User not found');
    }
  }

  Future<AddressModel> fetchAddress(String userId) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('address')
        .where('uid', isEqualTo: userId)
        .get();
    if (querySnapshot.docs.isNotEmpty) {
      var data = querySnapshot.docs.first.data() as Map<String, dynamic>;
      return AddressModel.fromMap(data);
    } else {
      throw Exception('Address not found');
    }
  }

  Future<void> updateOrderStatus(String orderId, String newStatus) async {
    try {
      await FirebaseFirestore.instance
          .collection('order')
          .doc(orderId)
          .update({'status': newStatus});
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Order status updated to $newStatus')),
      );
    } catch (e) {
      log('Failed to update order status: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to update order status')),
      );
    }
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
                MaterialPageRoute(builder: (context) => SellerOrderPage()),
              );
            },
            icon: const Icon(Icons.arrow_circle_left_outlined)),
        title: FutureBuilder(
            future: fetchOrderDetails(widget.productId),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (!snapshot.hasData) {
                return Text('Order not found');
              } else {
                var order = snapshot.data!;
                return Row(
                  children: [
                    Text(
                      "Order ",
                      style: GoogleFonts.inder(color: Colors.black),
                    ),
                    Text(order.id.toString(),
                        style: GoogleFonts.inder(
                            color: Colors.black, fontSize: 14)),
                  ],
                );
              }
            }),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: fetchOrderDetails(widget.productId),
          builder: (context, orderSnapshot) {
            if (orderSnapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (orderSnapshot.hasError) {
              return Center(child: Text('Error: ${orderSnapshot.error}'));
            } else if (!orderSnapshot.hasData) {
              return Center(child: Text('Order not found'));
            } else {
              var order = orderSnapshot.data!;
              print("Order user ID: ${order.userId}"); // Debug statement
              return FutureBuilder(
                future: fetchUserDetails(order.userId.toString()),
                builder: (context, userSnapshot) {
                  if (userSnapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (userSnapshot.hasError) {
                    return Center(child: Text('Error: ${userSnapshot.error}'));
                  } else if (!userSnapshot.hasData) {
                    return Center(child: Text('User not found'));
                  } else {
                    var user = userSnapshot.data!;
                    return Column(
                      children: [
                        const Divider(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Order Status",
                                style: GoogleFonts.inder(color: Colors.black),
                              ),
                              Container(
                                height: 30,
                                width: 200,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(color: Colors.red)),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Center(
                                        child: DropdownButton<String>(
                                          hint: Text(
                                            'Update status',
                                            style: GoogleFonts.inder(),
                                          ),
                                          value: selectedItem,
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              selectedItem = newValue;
                                            });
                                          },
                                          items: items
                                              .map<DropdownMenuItem<String>>(
                                                  (String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(value),
                                            );
                                          }).toList(),
                                        ),
                                      )
                                    ]),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 200, top: 10),
                          child: Container(
                            height: 30,
                            width: 150,
                            decoration: BoxDecoration(
                                color: const Color(0xff1877F2),
                                borderRadius: BorderRadius.circular(10)),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(order.status,
                                  style: GoogleFonts.inder(
                                      color: Colors.white, fontSize: 16)),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Order date",
                                  style: GoogleFonts.inder(
                                      color: Colors.black, fontSize: 16)),
                              Text(order.date,
                                  style: GoogleFonts.inder(
                                      color: Colors.black, fontSize: 16))
                            ],
                          ),
                        ),
                        const Divider(),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, right: 200),
                          child: Text("Customer Details",
                              style: GoogleFonts.inder(
                                  color: Colors.black, fontSize: 18)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Name",
                                  style: GoogleFonts.inder(
                                      color: Colors.black, fontSize: 16)),
                              Text(user.name,
                                  style: GoogleFonts.inder(
                                      color: Colors.black, fontSize: 16)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Phone Number",
                                  style: GoogleFonts.inder(
                                      color: Colors.black, fontSize: 16)),
                              Text(user.phone,
                                  style: GoogleFonts.inder(
                                      color: Colors.black, fontSize: 16)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Email Address",
                                  style: GoogleFonts.inder(
                                      color: Colors.black, fontSize: 16)),
                              Text(user.email,
                                  style: GoogleFonts.inder(
                                      color: Colors.black, fontSize: 16)),
                            ],
                          ),
                        ),
                        FutureBuilder(
                            future: fetchAddress(order.userId.toString()),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Center(
                                    child: CircularProgressIndicator());
                              } else if (snapshot.hasError) {
                                return Center(
                                    child: Text('Error: ${snapshot.error}'));
                              } else if (!snapshot.hasData) {
                                return Center(
                                    child: Text('Address not found'));
                              } else {
                                var address = snapshot.data!;
                                return Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Delivery address",
                                          style: GoogleFonts.inder(
                                              color: Colors.black,
                                              fontSize: 16)),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(address.house,
                                              style: GoogleFonts.inder(
                                                  color: Colors.black,
                                                  fontSize: 16)),
                                          Text(address.street,
                                              style: GoogleFonts.inder(
                                                  color: Colors.black,
                                                  fontSize: 16)),
                                          Text(address.city,
                                              style: GoogleFonts.inder(
                                                  color: Colors.black,
                                                  fontSize: 16)),
                                          Text(address.state,
                                              style: GoogleFonts.inder(
                                                  color: Colors.black,
                                                  fontSize: 16)),
                                          Text(address.pincode,
                                              style: GoogleFonts.inder(
                                                  color: Colors.black,
                                                  fontSize: 16)),
                                        ],
                                      )
                                    ],
                                  ),
                                );
                              }
                            }),
                        const Divider(),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 10,
                            right: 240,
                          ),
                          child: Text("Product",
                              style: GoogleFonts.inder(
                                  color: Colors.black, fontSize: 18)),
                        ),
                        FutureBuilder(
                            future: fetchProductDetails(widget.productId),
                            builder: (context, productSnapshot) {
                              if (productSnapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return CircularProgressIndicator();
                              } else if (productSnapshot.hasError) {
                                return Text(
                                    'Error: ${productSnapshot.error}');
                              } else if (!productSnapshot.hasData) {
                                return Text('Product not found');
                              } else {
                                var product = productSnapshot.data!;
                                return ListTile(
                                  leading: Image.network(product.imageUrl),
                                  title: Text(product.pname,
                                      style: GoogleFonts.inder(
                                          color: Colors.black, fontSize: 16)),
                                  subtitle: Row(
                                    children: [
                                      const Icon(
                                        Icons.currency_rupee_sharp,
                                        size: 20,
                                        color: Colors.grey,
                                      ),
                                      Text(product.price.toString(),
                                          style: GoogleFonts.inder(
                                            color: Colors.grey,
                                          )),
                                    ],
                                  ),
                                );
                              }
                            }),
                        const SizedBox(
                          height: 40,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 200,
                          ),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: kPrimaryColor,
                                fixedSize: const Size(150, 35)),
                            onPressed: () {
                              if (selectedItem != null) {
                                updateOrderStatus(order.id.toString(), selectedItem!);
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text('Please select a status')),
                                );
                              }
                            },
                            child: Text("SET",
                                style: GoogleFonts.inder(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                          ),
                        )
                      ],
                    );
                  }
                },
              );
            }
          },
        ),
      ),
    );
  }
}

