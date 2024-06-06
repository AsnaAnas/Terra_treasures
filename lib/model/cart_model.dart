
class CartModel {
 // String cartId;
  String productId;
  String userId;
  int quantity;

  CartModel({
   
    required this.productId,
    required this.userId,
    required this.quantity,
  });

  Map<String, dynamic> toMap() {
    return {
      //'cart_id': cartId,
      'product_id': productId,
      'user_id': userId,
      'quantity':quantity
    };
  }
}