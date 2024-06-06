class OrderProductModel {
  final String orderId;
  final String userId;
  final String productId;
  final String productName;
  final double price;
  final String imageUrl; 
 

  OrderProductModel({
    required this.orderId,
    required this.userId,
    required this.productId,
    required this.productName,
    required this.price,
    required this.imageUrl,
 
  });
}