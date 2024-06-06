
class OrderModel {
  String productId;
   String? userId;
  String date;
   String status;
  String? id;
 

  OrderModel({
    required this.productId,
    required this.date,
    required this.status,
    this.id,
    this.userId,
  });

  Map<String, dynamic> toMap() => {
        "user_id": userId,
        "order_id": id,
        "date": date,
        "product_id": productId,
         "status": status,
         
      };

      factory OrderModel.fromMap(Map<String, dynamic> data) {
    return OrderModel(
      id: data["order_id"],
      userId: data["user_id"],
      productId: data["product_id"],
      date: data["date_of_order"],
      status: data["status"],
    );
  }
}
