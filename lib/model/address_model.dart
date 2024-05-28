// class AddressModel
// {
//   String name;
//  String house;
//  String street;
//  String city;
//  String? id;
//  String dist;
//  String state;
//  String pincode;
//  String phone;
//  String? uid;
 


//  AddressModel({
//   required this.name,
//   required this.house,
//   required this.street,
//   required this.city,
//   required this.dist,
//   required this.state,
//   required this.pincode,
//   required this.phone,
//   this.id,
//   this.uid,
// });

// Map<String, dynamic> toMap() => {
//         "name": name,
//         "house_no": house,
//         "street": street,
//         "city": city,
//         "district":dist,
//         "state":state,
//         "pincode":pincode,
//         "phone":phone,
//         "id":id,
//         "uid":uid
//       };

//   factory AddressModel.fromMap(Map<String, dynamic> data) {
//     return AddressModel(
//       name: data["name"],
//       house: data["house_no"] ,
//       street: data["street"],
//       city: data["city"],
//       id: data["id"],
//       dist: data["district"],
//       state: data["state"],
//       pincode: data["pincode"],
//       phone: data["phone"] ,
//       uid:  data['uid'],
//     );
//   }




// }


class AddressModel {
  String name;
  String house;
  String street;
  String city;
  String? id;
  String dist;
  String state;
  String pincode;
  String phone;
  String? uid;

  AddressModel({
    required this.name,
    required this.house,
    required this.street,
    required this.city,
    required this.dist,
    required this.state,
    required this.pincode,
    required this.phone,
    this.id,
    this.uid,
  });

  Map<String, dynamic> toMap() => {
        "name": name,
        "house_no": house,
        "street": street,
        "city": city,
        "district": dist,
        "state": state,
        "pincode": pincode,
        "phone": phone,
        "id": id,
        "uid": uid,
      };

  factory AddressModel.fromMap(Map<String, dynamic> data) {
    return AddressModel(
      name: data["name"],
      phone: data["phone"],
      pincode: data["pincode"],
      dist: data["district"],
      house: data["house_no"],
      street: data["street"],
      city: data["city"],
      state: data["state"],
      id: data["id"],
      uid: data["uid"],
    );
  }
}
