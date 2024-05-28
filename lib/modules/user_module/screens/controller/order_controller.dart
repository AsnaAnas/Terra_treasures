import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class OrderController
{
  final db=FirebaseFirestore.instance;

 
  Future<String> create(
    String productId,
    String userId,
   // String addressId,
    String date,
  ) async
  {
    final collectionRef = db.collection('order');
    final docRef = await collectionRef.add({
      'product_id':productId,
      'user_id':userId,
      //'address_id':addressId,
      'date_of_order':date
    });

    final id=FirebaseAuth.instance.currentUser!.uid;
    final orderId = docRef.id;
    await docRef.update({'id':orderId, 'user_id':id});
    return id;
  }
}
