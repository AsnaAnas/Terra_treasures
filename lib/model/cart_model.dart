
class CartModel {
 // String cartId;
  String productId;
  String userId;

  CartModel({
   // required this.cartId,
    required this.productId,
    required this.userId,
  });

  Map<String, dynamic> toMap() {
    return {
      //'cart_id': cartId,
      'product_id': productId,
      'user_id': userId,
    };
  }
}