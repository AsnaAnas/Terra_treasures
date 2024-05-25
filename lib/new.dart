// class ProductModel {
//   final String pname;
//   final double price;
//   final String imageUrl;
//   final String category;

//   ProductModel({
//     required this.pname,
//     required this.price,
//     required this.imageUrl,
//     required this.category,
//   });

//   factory ProductModel.fromMap(Map<String, dynamic> data) {
//     return ProductModel(
//       pname: data['pname'] ?? 'Unknown Product',
//       price: _parsePrice(data['price']),
//       imageUrl: data['imageUrl'] ?? 'https://via.placeholder.com/150',
//       category: data['category'] ?? 'Uncategorized',
//     );
//   }

//   static double _parsePrice(dynamic price) {
//     if (price is int) {
//       return price.toDouble();
//     } else if (price is double) {
//       return price;
//     } else if (price is String) {
//       return double.tryParse(price) ?? 0.0;
//     } else {
//       return 0.0;
//     }
//   }
// }
// Step 2: Update ProductsPage
// Ensure your ProductsPage uses the updated ProductModel to handle null and incorrect types gracefully.

// dart
// Copy code
// class ProductsPage extends StatelessWidget {
//   final String category;

//   ProductsPage({super.key, required this.category});

//   @override
//   Widget build(BuildContext context) {
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
//         title: Center(
//           child: Text(category, style: GoogleFonts.inder()),
//         ),
//         actions: [
//           Padding(
//             padding: const EdgeInsets.all(20),
//             child: IconButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => const CartPage()),
//                 );
//               },
//               icon: const Icon(Icons.shopping_bag_outlined),
//             ),
//           ),
//         ],
//       ),
//       body: SafeArea(
//         child: StreamBuilder<QuerySnapshot>(
//           stream: FirebaseFirestore.instance
//               .collection("product")
//               .where("category", isEqualTo: category)
//               .snapshots(),
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return Center(child: CircularProgressIndicator());
//             }

//             if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//               return Center(child: Text("No products found."));
//             }

//             var products = snapshot.data!.docs.map((doc) {
//               var data = doc.data() as Map<String, dynamic>;
//               return ProductModel.fromMap(data);
//             }).toList();

//             return ListView.builder(
//               itemCount: products.length,
//               itemBuilder: (context, index) {
//                 var product = products[index];
//                 return GestureDetector(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => ProductDetailsPage(product: product)),
//                     );
//                   },
//                   child: Card(
//                     color: bgColor,
//                     child: ListTile(
//                       title: Text(product.pname),
//                       subtitle: Row(
//                         children: [
//                           const Icon(Icons.currency_rupee, size: 20),
//                           Text(product.price.toString()),
//                         ],
//                       ),
//                       leading: SizedBox(
//                         width: 50,
//                         height: 50,
//                         child: Image.network(product.imageUrl),
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
// Summary
// ProductModel: The ProductModel now includes a _parsePrice method to handle different types of inputs (int, double, string) for the price field.
// ProductsPage: Uses the updated ProductModel to ensure the price field is parsed correctly.
// By following these steps, you should be able to handle the price field correctly regardless of its type in your Firestore documents, preventing the "toDouble" error.









// Message ChatGPT

// Chat