import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:terra_treasures/model/cart_model.dart';

class CartController {
 

  String? getCurrentUserId() {
    User? user = FirebaseAuth.instance.currentUser;
    return user?.uid;
  }

  Future<void> addCart(String productId) async {
    String? userId = getCurrentUserId();
    if (userId == null) {
      print('User is not logged in');
      return;
    }
   int quantity=1;
    CartModel newCart = CartModel(
      productId: productId,
       userId: userId, 
    quantity:quantity );


    CollectionReference carts = FirebaseFirestore.instance.collection('cart');
    await carts.add(newCart.toMap()).then((_) {
      print('Cart added successfully');
    }).catchError((error) {
      print('Failed to add cart: $error');
    });
  }

  Future<void> addToCart(String productId) async {
    try {
      await addCart(productId);
      print('Product added to cart successfully');
    } catch (error) {
      print('Failed to add product to cart: $error');
    }
  }
}