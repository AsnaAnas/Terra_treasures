// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:intl/intl.dart';
// import 'package:terra_treasures/modules/user_module/screens/controller/order_controller.dart';
// import 'package:terra_treasures/modules/user_module/screens/controller/payment_controller.dart';
// import 'package:terra_treasures/modules/user_module/screens/orderplaced.dart';
// import 'package:terra_treasures/util/constants.dart';
// import 'package:upi_india/upi_app.dart';


// class PaymentMethod extends StatelessWidget {
//   final String productId;
//   final double price;
//    PaymentMethod({Key? key, required this.productId, required this.price}) : super(key: key);
//   OrderController controller = OrderController();
//    String date = DateFormat("dd/M/yyyy").format(DateTime.now());

   

//   @override
//   Widget build(BuildContext context) {
//     String id= FirebaseAuth.instance.currentUser!.uid;
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
//         title: Text(
//           "Payment",
//           style: GoogleFonts.inder(
//             fontSize: 18,
//           ),
//         ),
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.only(top: 30, left: 8, right: 8),
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
//                   const Icon(Icons.check_box, color: kPrimaryColor, size: 30),
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
//                 height: 70,
//                 thickness: 3,
//               ),
//               Align(
//                 alignment: Alignment.topLeft,
//                 child: Text(
//                   "Payment Method",
//                   style: GoogleFonts.inder(
//                     fontSize: 18,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 30),
//               FutureBuilder<UpiApp>(
//                 future:  PaymentController().appOpen(),
//                builder: (context,snapshot)
//                {
//                 return PaymentOption(
//                 title: "Wallet/UPI",
//                 selected: true,
//                 onTap: () {
//                   PaymentController().initiateTransaction(price: price, recievername: "logitrack");
//                 },
//               );
//                }),
              
//               const SizedBox(height: 25),
//               PaymentOption(
//                 title: "Netbanking",
//                 selected: false,
//                 onTap: () {},
//               ),
//               const SizedBox(height: 25),
//               PaymentOption(
//                 title: "Cash on delivery",
//                 selected: false,
//                 onTap: () {},
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(top: 150, left: 10, right: 10),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     const Row(
//                       children: [
//                         Icon(Icons.circle_outlined, color: Colors.grey),
//                         SizedBox(width: 5),
//                         Text("Total:"),
//                       ],
//                     ),
//                     FutureBuilder<DocumentSnapshot>(
//                       future: FirebaseFirestore.instance
//                           .collection('product')
//                           .doc(productId)
//                           .get(),
//                       builder: (context, snapshot) {
//                         if (snapshot.connectionState == ConnectionState.waiting) {
//                           return const Center(child: CircularProgressIndicator());
//                         } else if (snapshot.hasError) {
//                           return Center(child: Text('Error: ${snapshot.error}'));
//                         } else if (!snapshot.hasData || !snapshot.data!.exists) {
//                           return const Center(child: Text('Product not found'));
//                         } else {
//                           var productData = snapshot.data!.data() as Map<String, dynamic>;
//                           return Row(
//                             children: [
//                               const Icon(Icons.currency_rupee, size: 20),
//                               Text(
//                                 productData['price'].toString(),
//                                 style: GoogleFonts.inder(),
//                               ),
//                             ],
//                           );
//                         }
//                       },
//                     ),
//                     ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: kPrimaryColor,
//                       ),
//                       onPressed: () {
//                        controller.create(productId, id, date);
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (context) => const OrderPlaced()),
//                         );
//                       },
//                       child: Text(
//                         "PROCEED",
//                         style: GoogleFonts.inder(color: Colors.white),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class PaymentOption extends StatelessWidget {
//   final String title;
//   final bool selected;
//   final VoidCallback onTap;

//   const PaymentOption({
//     super.key,
//     required this.title,
//     required this.selected,
//     required this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20),
//       child: Container(
//         height: 60,
//         width: double.infinity,
//         decoration: BoxDecoration(
//           color: selected ? kPrimaryColor : Colors.white,
//           borderRadius: BorderRadius.circular(15),
//           border: Border.all(color: selected ? Colors.transparent : Colors.grey),
//         ),
//         child: TextButton(
//           onPressed: onTap,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 title,
//                 style: GoogleFonts.inder(
//                   color: selected ? Colors.white : Colors.black,
//                 ),
//               ),
//               Icon(
//                 selected ? Icons.check_circle : Icons.circle_outlined,
//                 color: selected ? Colors.white : Colors.grey,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }




import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:terra_treasures/modules/user_module/screens/controller/order_controller.dart';
import 'package:terra_treasures/modules/user_module/screens/controller/payment_controller.dart';
import 'package:terra_treasures/modules/user_module/screens/orderplaced.dart';
import 'package:terra_treasures/util/constants.dart';
import 'package:upi_india/upi_app.dart';

class PaymentMethod extends StatelessWidget {
  final String productId;
  final double price;

  PaymentMethod({Key? key, required this.productId, required this.price}) : super(key: key);

  final OrderController controller = OrderController();
  final String date = DateFormat("dd/M/yyyy").format(DateTime.now());
  final PaymentController paymentController = PaymentController();

  @override
  Widget build(BuildContext context) {
    String id = FirebaseAuth.instance.currentUser!.uid;
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
        title: Text(
          "Payment",
          style: GoogleFonts.inder(fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 30, left: 8, right: 8),
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
                  const Icon(Icons.check_box, color: kPrimaryColor, size: 30),
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
              const Divider(height: 70, thickness: 3),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Payment Method",
                  style: GoogleFonts.inder(fontSize: 18),
                ),
              ),
              const SizedBox(height: 30),
              FutureBuilder<UpiApp>(
                future: paymentController.appOpen(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData) {
                    return const Center(child: Text('No UPI app found'));
                  } else {
                    return PaymentOption(
                      title: "Wallet/UPI",
                      selected: true,
                      onTap: () {
                        paymentController.initiateTransaction(
                          price: price,
                          receiverName: "logitrack",
                        );
                      },
                    );
                  }
                },
              ),
              const SizedBox(height: 25),
              PaymentOption(
                title: "Netbanking",
                selected: false,
                onTap: () {},
              ),
              const SizedBox(height: 25),
              PaymentOption(
                title: "Cash on delivery",
                selected: false,
                onTap: () {},
              ),
              Padding(
                padding: const EdgeInsets.only(top: 150, left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Row(
                      children: [
                        Icon(Icons.circle_outlined, color: Colors.grey),
                        SizedBox(width: 5),
                        Text("Total:"),
                      ],
                    ),
                    FutureBuilder<DocumentSnapshot>(
                      future: FirebaseFirestore.instance
                          .collection('product')
                          .doc(productId)
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
                          return Row(
                            children: [
                              const Icon(Icons.currency_rupee, size: 20),
                              Text(
                                productData['price'].toString(),
                                style: GoogleFonts.inder(),
                              ),
                            ],
                          );
                        }
                      },
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: kPrimaryColor),
                      onPressed: () {
                        controller.create(productId, id, date);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const OrderPlaced()),
                        );
                      },
                      child: Text(
                        "PROCEED",
                        style: GoogleFonts.inder(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PaymentOption extends StatelessWidget {
  final String title;
  final bool selected;
  final VoidCallback onTap;

  const PaymentOption({
    Key? key,
    required this.title,
    required this.selected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
          color: selected ? kPrimaryColor : Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: selected ? Colors.transparent : Colors.grey),
        ),
        child: TextButton(
          onPressed: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: GoogleFonts.inder(color: selected ? Colors.white : Colors.black),
              ),
              Icon(
                selected ? Icons.check_circle : Icons.circle_outlined,
                color: selected ? Colors.white : Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}