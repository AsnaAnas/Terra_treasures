
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:terra_treasures/model/product_model.dart';
import 'package:terra_treasures/modules/seller_module/seller_home.dart';
import 'package:terra_treasures/modules/user_module/screens/productDetails.dart';
import 'package:terra_treasures/util/constants.dart';

class ProductsPage extends StatelessWidget {
  //final String category;
 // final String productId;
  ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
   String sellerId = FirebaseAuth.instance.currentUser!.uid;

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  SellerHome()),
            );
          },
          icon: const Icon(Icons.arrow_circle_left_outlined),
        ),
        title: Center(
          child: Text("My Products", style: GoogleFonts.inder()),
        ),
        
      ),
      body: SafeArea(
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("product")
              .where("seller_id", isEqualTo: sellerId)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }

            if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return Center(child: Text("No products found."));
            }

           var products = snapshot.data!.docs.map((doc) => ProductModel.fromMap(doc.data() as Map<String, dynamic>)).toList();
            
            return ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                var product = products[index];
                return GestureDetector(
                  onTap: () {
                    log(products[index].id.toString());
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProductDetailsPage(productId: products[index].id.toString())),
                      
                    );
                  },
                  child: Card(
                    color: bgColor,
                    child: ListTile(
                      title: Text(product.pname),
                       
                      leading: SizedBox(
                        width: 50,
                        height: 50,
                        child: Image.network(product.imageUrl), // Use network image for better flexibility
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
