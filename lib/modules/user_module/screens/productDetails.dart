// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:terra_treasures/model/product_model.dart';
// import 'package:terra_treasures/modules/user_module/screens/controller/cartcontroller.dart';
// import 'package:terra_treasures/modules/user_module/screens/home.dart';
// import 'package:terra_treasures/modules/user_module/screens/paymentpage.dart';
// import 'package:terra_treasures/util/button.dart';
// import 'package:terra_treasures/util/constants.dart';

// class ProductDetailsPage extends StatefulWidget {
//   final String productId;

//   const ProductDetailsPage({Key? key, required this.productId}) : super(key: key);

//   @override
//   State<ProductDetailsPage> createState() => _ProductDetailsPageState();
// }

// class _ProductDetailsPageState extends State<ProductDetailsPage> {
//   late Future<ProductModel> _productFuture;
//   CartController controller = CartController();

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
//     //String id = FirebaseAuth.instance.currentUser!.uid;
//     String? selectedItem;
//     final List<String> items = ['1','2', '3', '5'];

//     return Scaffold(
//       backgroundColor: bgColor,
//       appBar: AppBar(
//         backgroundColor: bgColor,
//         leading: IconButton(
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => const HomeScreen()),
//             );
//           },
//           icon: const Icon(Icons.arrow_circle_left_outlined),
//         ),
//         actions: const [
//           Padding(
//             padding: EdgeInsets.all(10),
//             child: Icon(Icons.shopping_bag_outlined),
//           ),
//         ],
//       ),
//       body: FutureBuilder<ProductModel>(
//         future: _productFuture,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else if (!snapshot.hasData) {
//             return const Center(child: Text('Product not found'));
//           } else {
//             ProductModel product = snapshot.data!;
//             return ListView(
//               children: [
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(left: 20, right: 20),
//                       child: Image.network(product.imageUrl),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Text(
//                         product.pname,
//                         style: const TextStyle(
//                             fontSize: 22, fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Row(
//                         children: [
//                           const Icon(Icons.currency_rupee_outlined),
//                           Text(
//                             product.price.toStringAsFixed(2),
//                             style: const TextStyle(
//                                 fontSize: 22, fontWeight: FontWeight.bold),
//                           ),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(height: 20),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 20),
//                       child: Container(
//                         height: 50,
//                         width: 200,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(17),
//                           border: Border.all(color: Colors.black),
//                         ),
//                         child: TextButton(
//                           onPressed: () {
//                             // Quantity selector logic can be added here
//                           },
//                           child: Padding(
//                             padding: const EdgeInsets.only(left: 50),
//                             child: Row(
//                               children: [
//                                 Center(
//                                   child: DropdownButton<String>(
//                                     hint: const Text('Quantity'),
//                                     value: selectedItem,
//                                     onChanged: (String? newValue) {
//                                       setState(() {
//                                         selectedItem = newValue;
//                                       });
//                                     },
//                                     items: items.map<DropdownMenuItem<String>>(
//                                         (String value) {
//                                       return DropdownMenuItem<String>(
//                                         value: value,
//                                         child: Text(value),
//                                       );
//                                     }).toList(),
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 20),
//                     Padding(
//                       padding: const EdgeInsets.only(top: 10, left: 50),
//                       child: Container(
//                         height: 40,
//                         width: 300,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(17),
//                           border: Border.all(color: kPrimaryColor),
//                         ),
//                         child: TextButton(
//                           onPressed: () {
//                             controller.addToCart(widget.productId);
//                             ScaffoldMessenger.of(context).showSnackBar(
//                               const SnackBar(
//                                 content: Text("Product added to cart"),
//                                 showCloseIcon: true,
//                                 backgroundColor: Color(0xff436850),
//                                 duration: Duration(seconds: 2),
//                                 behavior: SnackBarBehavior.floating,
//                                 margin: EdgeInsets.only(
//                                     bottom: 50, left: 50, right: 50),
//                               ),
//                             );
//                           },
//                           child: Align(
//                             alignment: Alignment.center,
//                             child: Text(" Add to Cart",
//                                 style: GoogleFonts.inder(color: kPrimaryColor)),
//                           ),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 20),
//                     Padding(
//                       padding: const EdgeInsets.only(top: 10, left: 50),
//                       child: PageButton(
//                         onPressed: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) =>  PaymentPage(productId:widget.productId)),
//                           );
//                         },
//                         text: "Buy Now",
//                       ),
//                     )
//                   ],
//                 ),
//                 const Divider(
//                   height: 80,
//                   thickness: 3,
//                   color: Color.fromARGB(255, 227, 224, 224),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Text("Product Details",
//                       style: GoogleFonts.inder(fontSize: 22)),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Text(
//                     product.pdetails,
//                     style: GoogleFonts.inder(fontSize: 15),
//                   ),
//                 ),
//                 const Divider(
//                   height: 80,
//                   thickness: 3,
//                   color: Color.fromARGB(255, 227, 224, 224),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Text("How it becomes eco friendly",
//                       style: GoogleFonts.inder(fontSize: 20)),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Text(
//                     product.eco,
//                     style: GoogleFonts.inder(),
//                   ),
//                 ),
//               ],
//             );
//           }
//         },
//       ),
//     );
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:terra_treasures/model/product_model.dart';
import 'package:terra_treasures/modules/user_module/screens/controller/cartcontroller.dart';
import 'package:terra_treasures/modules/user_module/screens/home.dart';
import 'package:terra_treasures/modules/user_module/screens/paymentpage.dart';
import 'package:terra_treasures/util/button.dart';
import 'package:terra_treasures/util/constants.dart';

class ProductDetailsPage extends StatefulWidget {
  final String productId;

  const ProductDetailsPage({Key? key, required this.productId})
      : super(key: key);

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  late Future<ProductModel> _productFuture;
  CartController controller = CartController();
  String? selectedItem;
  final List<String> items = ['1', '2', '3', '5'];

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
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  HomeScreen()),
            );
          },
          icon: const Icon(Icons.arrow_circle_left_outlined),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(10),
            child: Icon(Icons.shopping_bag_outlined),
          ),
        ],
      ),
      body: FutureBuilder<ProductModel>(
        future: _productFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('Product not found'));
          } else {
            ProductModel product = snapshot.data!;
            return ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Image.network(product.imageUrl),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        product.pname,
                        style: const TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          const Icon(Icons.currency_rupee_outlined),
                          Text(
                            product.price.toStringAsFixed(2),
                            style: const TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Container(
                        height: 50,
                        width: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(17),
           
                          border: Border.all(color: Colors.black),
                        ),
                        child: TextButton(
                          onPressed: () {
                            // Quantity selector logic can be added here

                            // Quantity selector logic can be added here
                            if (selectedItem != null) {
                              // Logic for when a quantity is selected
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content: Text(
                                        'Selected Quantity: $selectedItem')),
                              );
                            } else {
                              // Logic for when no quantity is selected
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Please select a quantity')),
                              );
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 50),
                            child: Row(
                              children: [
                                Center(
                                  child: DropdownButton<String>(
                                    hint: const Text('Quantity'),
                                    value: selectedItem,
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        selectedItem = newValue;
                                      });
                                    },
                                    items: items.map<DropdownMenuItem<String>>(
                                        (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 50),
                      child: Container(
                        height: 40,
                        width: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(17),
                          border: Border.all(color: kPrimaryColor),
                        ),
                        child: TextButton(
                          onPressed: () {
                            controller.addToCart(widget.productId);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Product added to cart"),
                                showCloseIcon: true,
                                backgroundColor: Color(0xff436850),
                                duration: Duration(seconds: 2),
                                behavior: SnackBarBehavior.floating,
                                margin: EdgeInsets.only(
                                    bottom: 50, left: 50, right: 50),
                              ),
                            );
                          },
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(" Add to Cart",
                                style: GoogleFonts.inder(color: kPrimaryColor)),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 50),
                      child: PageButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PaymentPage(
                                productId: widget.productId,
                                quantity: int.parse(selectedItem ?? '1'),
                              ),
                            ),
                          );
                        },
                        text: "Buy Now",
                      ),
                    )
                  ],
                ),
                const Divider(
                  height: 80,
                  thickness: 3,
                  color: Color.fromARGB(255, 227, 224, 224),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Product Details",
                      style: GoogleFonts.inder(fontSize: 22)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    product.pdetails,
                    style: GoogleFonts.inder(fontSize: 15),
                  ),
                ),
                const Divider(
                  height: 80,
                  thickness: 3,
                  color: Color.fromARGB(255, 227, 224, 224),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("How it becomes eco friendly",
                      style: GoogleFonts.inder(fontSize: 20)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    product.eco,
                    style: GoogleFonts.inder(),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
