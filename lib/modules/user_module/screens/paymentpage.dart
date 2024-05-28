import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:terra_treasures/model/address_model.dart';
import 'package:terra_treasures/model/product_model.dart';
import 'package:terra_treasures/modules/user_module/screens/addresspage.dart';
import 'package:terra_treasures/modules/user_module/screens/cartpage.dart';
import 'package:terra_treasures/modules/user_module/screens/controller/address_controller.dart';
import 'package:terra_treasures/modules/user_module/screens/orderpage.dart';
import 'package:terra_treasures/util/constants.dart';

class PaymentPage extends StatefulWidget {
  final String productId;
  final int quantity;

  //PaymentPage({super.key, required this.productId, required int quantity});
  
  PaymentPage({Key? key, required this.productId, required this.quantity})
      : super(key: key);

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
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
    final AddressController addressController = AddressController();
    final String userId = FirebaseAuth.instance.currentUser!.uid;

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CartPage()),
            );
          },
          icon: const Icon(Icons.arrow_circle_left_outlined),
        ),
        title: const Text("Payment"),
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
                  const Icon(Icons.looks_two_outlined,
                      color: kPrimaryColor, size: 30),
                  Container(
                    width: 50.0,
                    height: 1.0,
                    color: Colors.grey,
                  ),
                  const Icon(Icons.looks_3_outlined,
                      color: kPrimaryColor, size: 30),
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
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddressPage()),
                  );
                },
                child: Row(
                  children: [
                    const Icon(Icons.add, color: Color(0xff0FA779)),
                    Text(
                      "Add an address",
                      style: GoogleFonts.inder(color: const Color(0xff0FA779)),
                    ),
                  ],
                ),
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
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              address.name,
                              style: GoogleFonts.inder(fontSize: 16),
                            ),
                            Text(
                              address.house,
                              style: GoogleFonts.inder(fontSize: 16),
                            ),
                            Text(
                              address.street,
                              style: GoogleFonts.inder(fontSize: 16),
                            ),
                            Text(
                              address.city,
                              style: GoogleFonts.inder(fontSize: 16),
                            ),
                            Text(
                              address.dist,
                              style: GoogleFonts.inder(fontSize: 16),
                            ),
                            Text(
                              address.pincode,
                              style: GoogleFonts.inder(fontSize: 16),
                            ),
                          ],
                        ),
                        const SizedBox(width: 50),
                        Container(
                          height: 35,
                          width: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: kPrimaryColor),
                          ),
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AddressPage()),
                              );
                            },
                            child: Text(
                              "CHANGE",
                              style: GoogleFonts.inder(
                                  color: kPrimaryColor, fontWeight: FontWeight.w800),
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                },
              ),
              const Divider(
                height: 50,
                thickness: 3,
              ),
              StreamBuilder<DocumentSnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('product')
                    .doc(widget.productId)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || !snapshot.data!.exists) {
                    return const Center(child: Text('Product not found'));
                  } else {
                    var productData = snapshot.data!.data() as Map<String, dynamic>;
                    return Padding(
                      padding: const EdgeInsets.only(left: 50, right: 30),
                      child: Row(
                        children: [
                          Container(
                            width: 100,
                            height: 100,
                            child: Image.network(productData['imageUrl']),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  productData['pname'],
                                  style: GoogleFonts.inder(),
                                ),
                                Text(
                                  productData['material'],
                                  style: GoogleFonts.inder(),
                                ),
                                Row(
                                  children: [
                                    const Icon(Icons.currency_rupee, size: 20),
                                    Text(
                                      productData['price'].toString(),
                                      style: GoogleFonts.inder(),
                                    ),
                                  ],
                                ),
                                const Row(
                                  children: [
                                    Icon(Icons.star, color: Colors.amber),
                                    Icon(Icons.star, color: Colors.amber),
                                    Icon(Icons.star, color: Colors.amber),
                                    Icon(Icons.star, color: Colors.amber),
                                    Icon(Icons.star,
                                        color: Color.fromARGB(255, 213, 213, 213)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                },
              ),
              const Divider(
                height: 50,
                thickness: 3,
              ),
              StreamBuilder<DocumentSnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('product')
                    .doc(widget.productId)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || !snapshot.data!.exists) {
                    return const Center(child: Text('Product not found'));
                  } else {
                    var productData = snapshot.data!.data() as Map<String, dynamic>;
                    return Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        children: [
                          Text(
                            "Price Details",
                            style: GoogleFonts.inder(fontSize: 18),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Total Price",
                                style: GoogleFonts.inder(fontSize: 16),
                              ),
                              Row(
                                children: [
                                  const Icon(Icons.currency_rupee, size: 20),
                                  Text(
                                    productData['price'].toString(),
                                    style: GoogleFonts.inder(),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Delivery Charge",
                                style: GoogleFonts.inder(fontSize: 16),
                              ),
                              Text(
                                "FREE",
                                style: GoogleFonts.inder(
                                    fontSize: 16, color: const Color(0xff34A853)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }
                },
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(200, 35),
                    backgroundColor: kPrimaryColor,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OrderSummary(
                                productId: widget.productId,
                                quantity:widget.quantity
                              )),
                    );
                  },
                  child: Text(
                    "CONTINUE",
                    style: GoogleFonts.inder(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}