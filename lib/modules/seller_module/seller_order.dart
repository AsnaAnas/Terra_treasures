import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:terra_treasures/model/order_model.dart';
import 'package:terra_treasures/model/product_model.dart';
import 'package:terra_treasures/modules/seller_module/sellerorder_details.dart';
import 'package:terra_treasures/util/constants.dart';

class SellerOrderPage extends StatelessWidget {
  const SellerOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    String id = FirebaseAuth.instance.currentUser!.uid;
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          title: Text(
            "Orders",
            style: GoogleFonts.inder(color: Colors.white),
          ),
          centerTitle: true,
          bottom: const TabBar(
            labelColor: Colors.yellow,
            unselectedLabelColor: Colors.white,
            tabs: [
              Tab(text: 'All'),
              Tab(text: 'Cancelled'),
              Tab(text: 'Pending'),
              Tab(text: 'Completed'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            OrdersTab(sellerId: id, status: 'All'),
            OrdersTab(sellerId: id, status: 'Cancelled'),
            OrdersTab(sellerId: id, status: 'Pending'),
            OrdersTab(sellerId: id, status: 'Completed'),
          ],
        ),
      ),
    );
  }
}

class OrdersTab extends StatelessWidget {
  final String sellerId;
  final String status;

  const OrdersTab({super.key, required this.sellerId, required this.status});

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: TextFormField(
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(10),
              border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(17),
              ),
              fillColor: Colors.white,
              filled: true,
              prefixIcon: const Icon(Icons.search),
              hintText: "Search for an order",
              hintStyle: GoogleFonts.inder(color: Colors.grey),
            ),
          ),
        ),
        Text(
          "$status Orders",
          style: GoogleFonts.inder(color: Colors.black),
        ),
        Expanded(
          child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('order')
                .where("seller_id", isEqualTo: sellerId)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                return const Center(child: Text("No orders found."));
              }

              var orders = snapshot.data!.docs
                  .map((doc) => OrderModel.fromMap(doc.data() as Map<String, dynamic>))
                  .toList();

              if (status != 'All') {
                orders = orders.where((order) => order.status == status).toList();
              }

              return ListView.builder(
                itemCount: orders.length,
                itemBuilder: (context, index) {
                  var order = orders[index];
                  return FutureBuilder<DocumentSnapshot>(
                    future: FirebaseFirestore.instance
                        .collection('product')
                        .doc(order.productId)
                        .get(),
                    builder: (context, productSnapshot) {
                      if (!productSnapshot.hasData) {
                        return const ListTile(
                          leading: CircularProgressIndicator(),
                          title: Text('Loading...'),
                        );
                      }

                      var productData = productSnapshot.data!.data() as Map<String, dynamic>;
                      var product = ProductModel.fromMap(productData);

                      return
                       GestureDetector(
                        onTap: () {
                           Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  SellerOrderDetails(productId:order.productId)),
              );
                        },
                         child: ListTile(
                          leading: const Icon(Icons.notes),
                          title: Text(
                            product.pname,
                            style: GoogleFonts.inder(color: Colors.black),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Order date: ${order.date}",
                                  style: GoogleFonts.inder(color: Colors.grey)),
                              // Text("Status: ${order.status}",
                              //     style: GoogleFonts.inder(color: Colors.grey)),
                            ],
                          ),
                          trailing: Text(
                            order.id!,
                            style: GoogleFonts.inder(color: Colors.black, fontSize: 12),
                          ),
                                               ),
                       );
                    },
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
