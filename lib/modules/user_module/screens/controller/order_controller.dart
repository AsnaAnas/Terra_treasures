

// import 'package:cloud_firestore/cloud_firestore.dart';

// class OrderController {
//   final db = FirebaseFirestore.instance;

//   Future<String> create(
//     String productId,
//     String userId,
//      String date,
//    String status,
   
//   ) async {
//     final collectionRef = db.collection('order');
//     final docRef = await collectionRef.add({
//       'product_id': productId,
//       'user_id': userId,
//       'date_of_order': date,
//       'status': status,
      
//     });

//     final orderId = docRef.id;
//     await docRef.update({'id': orderId, 'user_id': userId});
//     return orderId;
//   }

// }


import 'package:cloud_firestore/cloud_firestore.dart';

class OrderController {
  final db = FirebaseFirestore.instance;

  Future<String> create(
    String productId,
    String userId,
    String date,
    String status,
  ) async {
    final productRef = db.collection('product').doc(productId);
    final productSnapshot = await productRef.get();

    if (!productSnapshot.exists) {
      throw Exception("Product not found");
    }

    final productData = productSnapshot.data()!;
    final sellerId = productData['seller_id'];

    final collectionRef = db.collection('order');
    final docRef = await collectionRef.add({
      'product_id': productId,
      'user_id': userId,
      'date_of_order': date,
      'status': status,
      'seller_id': sellerId,
    });

    final orderId = docRef.id;
    await docRef.update({'order_id': orderId});
    return orderId;
  }
}
