// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:terra_treasures/util/constants.dart';

// class CartPage extends StatefulWidget {
//   const CartPage({super.key});

//   @override
//   _CartPageState createState() => _CartPageState();
// }

// class _CartPageState extends State<CartPage> {
  

//    String userId = FirebaseAuth.instance.currentUser!.uid;
//   Map<String, bool> checkedItems = {};
//   double totalPrice = 0;

//   Future<void> _updateTotalPrice() async {
//     double newTotalPrice = 0;
//     List<Future<void>> futures = [];

//     checkedItems.forEach((key, value) {
//       if (value) {
//         futures.add(FirebaseFirestore.instance.collection('product').doc(key).get().then((productSnapshot) {
//           double price = productSnapshot['price'];
//           return FirebaseFirestore.instance.collection('cart').doc(key).get().then((cartSnapshot) {
//             int quantity = cartSnapshot['quantity'];
//             newTotalPrice += price * quantity;
//           });
//         }));
//       }
//     });

//     await Future.wait(futures);
//     setState(() {
//       totalPrice = newTotalPrice;
//     });
//   }

//   Future<void> _incrementQuantity(String productId) async {
//     await FirebaseFirestore.instance.collection('cart').doc(productId).update({
//       'quantity': FieldValue.increment(1),
//     });
//     _updateTotalPrice();
//   }

//   Future<void> _decrementQuantity(String productId) async {
//     DocumentSnapshot doc = await FirebaseFirestore.instance.collection('cart').doc(productId).get();
//     if (doc['quantity'] > 1) {
//       await FirebaseFirestore.instance.collection('cart').doc(productId).update({
//         'quantity': FieldValue.increment(-1),
//       });
//       _updateTotalPrice();
//     }
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
//         title: const Text("Cart"),
//         centerTitle: true,
//       ),
//       body: StreamBuilder<QuerySnapshot>(
//         stream: FirebaseFirestore.instance.collection('cart').where('user_id', isEqualTo: userId).snapshots(),
//         builder: (context, snapshot) {
//           if (!snapshot.hasData) {
//             return Center(child: CircularProgressIndicator());
//           }
//           var cartItems = snapshot.data!.docs;
//           return SingleChildScrollView(
//             child: Column(
//               children: [
//                 ListView.builder(
//                   itemCount: cartItems.length,
//                   shrinkWrap: true,
//                   scrollDirection: Axis.vertical,
//                   physics: const NeverScrollableScrollPhysics(),
//                   itemBuilder: (context, index) {
//                     var cartItem = cartItems[index];
//                     String productId = cartItem['product_id'];
//                     int quantity = cartItem['quantity'];
//                     bool isChecked = checkedItems[productId] ?? false;

//                     return StreamBuilder<DocumentSnapshot>(
//                       stream: FirebaseFirestore.instance.collection('product').doc(productId).snapshots(),
//                       builder: (context, productSnapshot) {
//                         if (!productSnapshot.hasData) {
//                           return Center(child: CircularProgressIndicator());
//                         }
//                         var product = productSnapshot.data!;
//                         double price = product['price'];
//                         String imageUrl = product['imageUrl'];
//                         String productName = product['pname'];

//                         return Container(
//                           margin: const EdgeInsets.symmetric(vertical: 20),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Checkbox(
//                                 splashRadius: 20,
//                                 activeColor: kPrimaryColor,
//                                 value: isChecked,
//                                 onChanged: (val) {
//                                   setState(() {
//                                     checkedItems[productId] = val!;
//                                     _updateTotalPrice();
//                                   });
//                                 },
//                               ),
//                               ClipRRect(
//                                 borderRadius: BorderRadius.circular(10),
//                                 child: Image.network(
//                                   imageUrl,
//                                   height: 80,
//                                   width: 80,
//                                   fit: BoxFit.cover,
//                                 ),
//                               ),
//                               Column(
//                                 mainAxisAlignment: MainAxisAlignment.end,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     productName,
//                                     style: GoogleFonts.inder(
//                                       fontWeight: FontWeight.w900,
//                                       fontSize: 16,
//                                     ),
//                                   ),
//                                   const SizedBox(height: 20),
//                                   Row(
//                                     children: [
//                                       const Icon(Icons.currency_rupee, size: 20, color: kPrimaryColor),
//                                       Text(
//                                         price.toString(),
//                                         style: GoogleFonts.inder(
//                                           color: kPrimaryColor,
//                                           fontSize: 16,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                               Row(
//                                 children: [
//                                   IconButton(
//                                     onPressed: () {
//                                       _decrementQuantity(productId);
//                                     },
//                                     icon: const Icon(Icons.remove, color: Colors.grey),
//                                   ),
//                                   Text(
//                                     quantity.toString(),
//                                     style: GoogleFonts.inder(
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.w700,
//                                     ),
//                                   ),
//                                   IconButton(
//                                     onPressed: () {
//                                       _incrementQuantity(productId);
//                                     },
//                                     icon: const Icon(Icons.add, color: Colors.grey),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         );
//                       },
//                     );
//                   },
//                 ),
//                 const SizedBox(height: 30),
//                 Padding(
//                   padding: const EdgeInsets.all(15),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         "Select All",
//                         style: GoogleFonts.inder(
//                           fontSize: 16,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                       Checkbox(
//                         splashRadius: 20,
//                         activeColor: kPrimaryColor,
//                         value: checkedItems.values.every((element) => element == true),
//                         onChanged: (val) {
//                           setState(() {
//                             checkedItems.updateAll((key, value) => val!);
//                             _updateTotalPrice();
//                           });
//                         },
//                       ),
//                     ],
//                   ),
//                 ),
//                 const Padding(
//                   padding: EdgeInsets.all(10),
//                   child: Divider(
//                     height: 20,
//                     thickness: 2,
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         "Total Payment",
//                         style: GoogleFonts.inder(
//                           fontSize: 16,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                       Row(
//                         children: [
//                           const Icon(Icons.currency_rupee, size: 20),
//                           Text(
//                             totalPrice.toString(),
//                             style: GoogleFonts.inder(
//                               fontSize: 16,
//                               fontWeight: FontWeight.w500,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 80),
//                 ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: kPrimaryColor,
//                     fixedSize: const Size(300, 35),
//                   ),
//                   onPressed: () {
//                     // Navigator.push(
//                     // context,
//                     // MaterialPageRoute(builder: (context) => const PaymentPage()),);
//                   },
//                   child: Padding(
//                     padding: const EdgeInsets.only(left: 60),
//                     child: Row(
//                       children: [
//                         Text(
//                           "Make Payment | ",
//                           style: GoogleFonts.inder(color: Colors.white, fontWeight: FontWeight.w600),
//                         ),
//                         const Icon(Icons.currency_rupee, size: 20, color: Colors.white),
//                         Text(
//                           totalPrice.toString(),
//                           style: GoogleFonts.inder(color: Colors.white, fontWeight: FontWeight.w600),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }



import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:terra_treasures/util/constants.dart';

class CartPage extends StatefulWidget {
  
  const CartPage({super.key});

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  String userId = FirebaseAuth.instance.currentUser!.uid;
  Map<String, bool> checkedItems = {};
  // double totalPrice = 0;

  // Future<void> _updateTotalPrice() async {
  //   double newTotalPrice = 0;
  //   List<Future<void>> futures = [];

  //   for (var entry in checkedItems.entries) {
  //     if (entry.value) {
  //       futures.add(
  //         FirebaseFirestore.instance.collection('product').doc(entry.key).get().then((productSnapshot) {
  //         double price = productSnapshot['price'];
  //         return FirebaseFirestore.instance
  //             .collection('cart')
  //             .doc(entry.key)
  //             .get()
  //             .then((cartSnapshot) {
  //           int quantity = cartSnapshot['quantity'];
  //           newTotalPrice += price * quantity;
  //         });
  //       }));
  //     }
  //   }

  //   await Future.wait(futures);
  //   setState(() {
  //     totalPrice = newTotalPrice;
  //   });
  // }

  // Future<void> _incrementQuantity(String productId) async {
  //   await FirebaseFirestore.instance.collection('cart').doc(productId).update({
  //     'quantity': FieldValue.increment(1),
  //   });
  //   _updateTotalPrice();
  // }

  // Future<void> _decrementQuantity(String productId) async {
  //   DocumentSnapshot doc = await FirebaseFirestore.instance.collection('cart').doc(productId).get();
  //   if (doc['quantity'] > 1) {
  //     await FirebaseFirestore.instance.collection('cart').doc(productId).update({
  //       'quantity': FieldValue.increment(-1),
  //     });
  //     _updateTotalPrice();
  //   }
  // }


double totalPrice = 0;

  Future<void> _updateTotalPrice() async {
    double newTotalPrice = 0;
    List<Future<void>> futures = [];

    for (var entry in checkedItems.entries) {
      if (entry.value) {
        futures.add(
          FirebaseFirestore.instance.collection('product').doc(entry.key).get().then((productSnapshot) {
            double price = productSnapshot['price'];
            return FirebaseFirestore.instance
                .collection('cart')
                .doc(entry.key)
                .get()
                .then((cartSnapshot) {
              int quantity = cartSnapshot['quantity'];
              newTotalPrice += price * quantity;
            });
          }));
      }
    }

    await Future.wait(futures);
    setState(() {
      totalPrice = newTotalPrice;
    });
  }

  Future<void> _incrementQuantity(String productId) async {
    await FirebaseFirestore.instance.collection('cart').doc(productId).update({
      'quantity': FieldValue.increment(1),
    });
    _updateTotalPrice();
  }

  Future<void> _decrementQuantity(String productId) async {
    DocumentSnapshot doc = await FirebaseFirestore.instance.collection('cart').doc(productId).get();
    if (doc['quantity'] > 1) {
      await FirebaseFirestore.instance.collection('cart').doc(productId).update({
        'quantity': FieldValue.increment(-1),
      });
      _updateTotalPrice();
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
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_circle_left_outlined),
        ),
        title: const Text("Cart"),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('cart').where('user_id', isEqualTo: userId).snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          var cartItems = snapshot.data!.docs;
          return SingleChildScrollView(
            child: Column(
              children: [
                ListView.builder(
                  itemCount: cartItems.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    var cartItem = cartItems[index];
                    String productId = cartItem['product_id'];
                    int quantity = cartItem['quantity'];
                    bool isChecked = checkedItems[productId] ?? false;

                    return StreamBuilder<DocumentSnapshot>(
                      stream: FirebaseFirestore.instance.collection('product').doc(productId).snapshots(),
                      builder: (context, productSnapshot) {
                        if (!productSnapshot.hasData) {
                          return Center(child: CircularProgressIndicator());
                        }
                        var product = productSnapshot.data!;
                        double price = product['price'];
                        String imageUrl = product['imageUrl'];
                        String productName = product['pname'];

                        return Container(
                          margin: const EdgeInsets.symmetric(vertical: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Checkbox(
                                splashRadius: 20,
                                activeColor: kPrimaryColor,
                                value: isChecked,
                                onChanged: (val) {
                                  setState(() {
                                    checkedItems[productId] = val!;
                                    _updateTotalPrice();
                                  });
                                },
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  imageUrl,
                                  height: 80,
                                  width: 80,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    productName,
                                    style: GoogleFonts.inder(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Row(
                                    children: [
                                      const Icon(Icons.currency_rupee, size: 20, color: kPrimaryColor),
                                      Text(
                                        price.toString(),
                                        style: GoogleFonts.inder(
                                          color: kPrimaryColor,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      _decrementQuantity(productId);
                                    },
                                    icon: const Icon(Icons.remove, color: Colors.grey),
                                  ),
                                  Text(
                                    quantity.toString(),
                                    style: GoogleFonts.inder(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      _incrementQuantity(productId);
                                    },
                                    icon: const Icon(Icons.add, color: Colors.grey),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Select All",
                        style: GoogleFonts.inder(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Checkbox(
                        splashRadius: 20,
                        activeColor: kPrimaryColor,
                        value: checkedItems.values.every((element) => element == true),
                        onChanged: (val) {
                          setState(() {
                            checkedItems.updateAll((key, value) => val!);
                            //_updateTotalPrice();
                          });
                        },
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(10),
                  child: Divider(
                    height: 20,
                    thickness: 2,
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  // child: Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     Text(
                  //       "Total Payment",
                  //       style: GoogleFonts.inder(
                  //         fontSize: 16,
                  //         fontWeight: FontWeight.w500,
                  //       ),
                  //     ),
                  //     Row(
                  //       children: [
                  //         const Icon(Icons.currency_rupee, size: 20),
                  //         Text(
                  //          // totalPrice.toString(), 
                  //          "total price",
                  //           style: GoogleFonts.inder(
                  //             fontSize: 16,
                  //             fontWeight: FontWeight.w500,
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ],
                  // ),
                ),
                const SizedBox(height: 80),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kPrimaryColor,
                    fixedSize: const Size(300, 35),
                  ),
                  onPressed: () {
                    // Navigator.push(
                    // context,
                    // MaterialPageRoute(builder: (context) => const PaymentPage()),);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 60),
                    child: Row(
                      children: [
                        Text(
                          "Make Payment  ",
                          style: GoogleFonts.inder(color: Colors.white, fontWeight: FontWeight.w600),
                        ),
                        //const Icon(Icons.currency_rupee, size: 20, color: Colors.white),
                        // Text(
                        //   totalPrice.toString(),
                        //  //"100",
                        //   style: GoogleFonts.inder(color: Colors.white, fontWeight: FontWeight.w600),
                        // ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
