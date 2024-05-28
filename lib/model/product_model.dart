import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel
{
 String pname;
 String pdetails;
 double price;
 String eco;
 String imageUrl;
 String? id;
 String brand;
 String category;
 String material;
 String method;
 String? uid;

ProductModel({
  required this.pname,
  required this.pdetails,
  required this.eco,
  required this.brand,
  required this.imageUrl,
  required this.category,
  required this.material,
  required this.method,
  required this.price,
  this.id,
  this.uid,
});

  Map<String, dynamic> toMap() => {
        "pname": pname,
        "pdetails": pdetails,
        "eco": eco,
        "imageUrl": imageUrl,
        "brand":brand,
        "material":material,
        "category":category,
        "method":method,
        "price":price,
        "pid":id,
        "uid":uid
      };

  factory ProductModel.fromMap(Map<String, dynamic> data) {
    return ProductModel(
      pname: data["pname"],
      pdetails: data["pdetails"] ,
      eco: data["eco"],
      imageUrl: data["imageUrl"] ?? 'https://via.placeholder.com/150',
      id: data["pid"],
      method: data["method"],
      material: data["material"],
      brand: data["brand"],
      category: data["category"] ?? 'Uncategorized',
      price:  data['price'],
    );
  }


  factory ProductModel.fromDocument(DocumentSnapshot doc) {
    return ProductModel(
      id: doc.id,
      imageUrl: doc["imageUrl"] ?? 'https://via.placeholder.com/150',
      pname: doc['pname'],
      pdetails: doc['pdetails'],
      price: doc['price'].toDouble(),
      eco: doc['eco'],
      category: doc["category"] ?? 'Uncategorized',
      method: doc["method"],
      material: doc["material"],
      brand: doc["brand"],
      
    );
  }


  
  static double _parsePrice(dynamic price) {
    if (price is int) {
      return price.toDouble();
    } else if (price is double) {
      return price;
    } else if (price is String) {
      return double.tryParse(price) ?? 0.0;
    } else {
      return 0.0;
    }
  }

}