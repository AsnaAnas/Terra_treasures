import 'package:cloud_firestore/cloud_firestore.dart';

class PaymentModel
{
  final db = FirebaseFirestore.instance;
  String productId;
  double price;
  String userId;
  String? id;
  PaymentModel({
    required this.productId,
    required this.price,
    required this.userId,
    this.id
  });


  Map<String,dynamic> toMap() => {
    "user_id":userId,
    // "address_id":addressId,
    "id":id,
    "price":price ,
    "product_id":productId
  };
}