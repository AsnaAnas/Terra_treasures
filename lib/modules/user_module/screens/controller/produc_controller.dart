
import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:terra_treasures/model/orderProduct.dart';
import 'package:terra_treasures/model/product_model.dart';

class ProductController {
  final db = FirebaseFirestore.instance;
  
  Future<String> create(
      String pname,
      String pdetails,
      String eco,
      String imageUrl,
      String category,
      double price,
      String brand,
      String material,
      String method,
      ) async {
    final collectionRef = db.collection('product');
    final docRef=await collectionRef.add({
      'pname': pname,
      'pdetails': pdetails,
      'eco': eco,
      'imageUrl': imageUrl,
      'category': category,
      'price': price,
      'brand': brand,
      'material': material,
      'method': method,
      
    });
    
     final id=FirebaseAuth.instance.currentUser!.uid;
    final productId=docRef.id;
    await docRef.update({'pid': productId,'seller_id':id});
  return productId;
   
  }

  List<ProductModel> listOfData = [];

  Future<List<ProductModel>> fetchAllProducts() async {
    final snapshot = await db.collection("product").get();
    listOfData =
        snapshot.docs.map((e) => ProductModel.fromMap(e.data())).toList();
    print(listOfData);
    return listOfData;
  }

  ProductModel? singleProductData;

  Future<void> fetchSingleProductData(String id) async {
    final snapshot = await db.collection("product").doc(id).get();
    singleProductData = ProductModel.fromMap(snapshot.data()!);
  }

  Future<XFile?> pickImage() async {
    final imagePicker = ImagePicker();
    return await imagePicker.pickImage(
      source: ImageSource.gallery,
    );
  }

  Future<String> uploadImage(File imageFile) async {
    final storageRef =
        FirebaseStorage.instance.ref().child('images/${imageFile.path.split('/').last}');
    try {
      final uploadTask = storageRef.putFile(imageFile);
      final snapshot = await uploadTask.whenComplete(() => null);
      return await snapshot.ref.getDownloadURL();
    } on FirebaseException catch (e) {
      print(e.message);
      return '';
    }
  }

Future<List<OrderProductModel>> getOrdersByUserId(String userId) async {
  // Fetch orders for the user
  final orders = await FirebaseFirestore.instance
      .collection('order')
      .where('user_id', isEqualTo: userId)
      .get();

  // Create a list to hold OrderProductModel objects
 
  List<OrderProductModel> orderProductModels = [];



  // Loop through each order
  for (var order in orders.docs) {
    final orderId = order.id;
    final productId = order['product_id']; 

    // Fetch product details for the current order
    final productSnapshot = await FirebaseFirestore.instance
        .collection('product')
        .doc(productId)
        .get();

    // Check if product exists
    if (productSnapshot.exists) {
      final productData = productSnapshot.data();
      final productName = productData!['pname']; 
      final productPrice = productData['price']; 
      final imageUrl = productData['imageUrl']; 
      // Create an OrderProductModel object and add it to the list
      orderProductModels.add(
        OrderProductModel(
          orderId: orderId,
          userId: userId,
          productId: productId,
          productName: productName,
          price: productPrice,
          imageUrl: imageUrl,
        ),
      );
    } else {
      print("Product with ID $productId not found for order $orderId");
    }
  }
  print("=========hellooo======");
 return orderProductModels;
}


}