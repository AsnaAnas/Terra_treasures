

// import 'dart:io';

// import 'package:cloud_firestore/cloud_firestore.dart';

// class UserModel{
//   String name;
//   String email;
//   String phone;
//   File? image;
//   String? id;

//   UserModel({
//     required this.name,
//     required this.email,
//    required this.phone,
//   required this.image,
//     this.id
//   });

//   Map<String,dynamic> data(docId)=>
//   {
//     "name":name,"email":email,"id":docId,"phone_nummber":phone,"imageUrl":image
//   };

//   factory UserModel.fromData(Map<String,dynamic> i)
//   {
//     return UserModel(
//       name: i["name"], 
//       email:  i["email"], 
//       phone:  i["phone"],
//      image: i["image"],
//      );
//   }


 
// }



class SellerModel {
  String name;
  String email;
  String phone;
  String? imageUrl;
  String? id;
  String city;
  String state;
  String house;
  String street;

 SellerModel({
   required this.name,
   required this.email,
   required this.phone,
   required this.city,
   required this.state,
   required this.street,
   required this.house,
   required this.imageUrl,
   this.id
 });

  Map<String, dynamic> toMap() => {
        "name": name,
        "email": email,
        "id": id,
        "phone": phone,
        "imageUrl": imageUrl,
        "city":city,
        "state":state,
        "house":house,
        "street":street
      };

  factory SellerModel.fromMap(Map<String, dynamic> data) {
    return SellerModel
    (
      name: data["name"],
      email: data["email"],
      phone: data["phone"],
      imageUrl: data["imageUrl"],
      id: data["id"],
      city: data["city"],
      state: data["state"],
      street: data["street"],
      house: data["house"],
    );
  }
}