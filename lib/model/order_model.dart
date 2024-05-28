class OrderModel
{
  String productId;
 // String addressId;
  String date;
  String? id;
  String? userId;

  OrderModel(
    {
      required this.productId,
     // required this.addressId,
      required this.date,
      this.id,
      this.userId
    }
  );

  Map<String,dynamic> toMap() => {
    "user_id":userId,
    // "address_id":addressId,
    "id":id,
    "date":date ,
    "product_id":productId
  };
}
