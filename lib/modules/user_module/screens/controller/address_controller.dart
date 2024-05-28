// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:terra_treasures/model/address_model.dart';

// class AddressController
// {
//   final db= FirebaseFirestore.instance;

//   Future<String> create(
//      String name,
//       String house,
//       String street,
//       String state,
//       String dist,
//       String city,
//       String phone,
//       String pincode,
//   ) async{
//      final collectionRef = db.collection('address');
//      final docRef = await collectionRef.add(
//       {
//         'name':name,
//         'house_no':house,
//         'street':street,
//         'city':city,
//         'district':dist,
//         'state':state,
//         'pincode':pincode,
//         'phone':phone
//       }
//      );
//      final id=FirebaseAuth.instance.currentUser!.uid;
//     final addressId=docRef.id;
//     await docRef.update({'id': addressId,'uid':id});
//   return id; 
//   }


//   List<AddressModel> listOfData = [];

//   Future<List<AddressModel>> fetchAllProducts() async {
//     final snapshot = await db.collection("address").get();
//     listOfData =
//         snapshot.docs.map((e) => AddressModel.fromMap(e.data())).toList();
//     print(listOfData);
//     return listOfData;
//   }

// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:terra_treasures/model/address_model.dart';

class AddressController {
  final db = FirebaseFirestore.instance;

  Future<String> create(
    String name,
    String phone,
    String pincode,
    String dist,
    String city,
    String state,
    String house,
    String street,
   ) async {
    final collectionRef = db.collection('address');
    final docRef = await collectionRef.add({
      'name': name,
      'phone': phone,
      'pincode': pincode,
       'district': dist,
       'city': city,
      'state': state,
      'house_no': house,
      'street': street,
      
     
      
    });
    final id = FirebaseAuth.instance.currentUser!.uid;
    final addressId = docRef.id;
    await docRef.update({'id': addressId, 'uid': id});
    return id;
  }

  Future<List<AddressModel>> fetchUserAddresses() async {
    final id = FirebaseAuth.instance.currentUser!.uid;
    final snapshot = await db.collection("address").where('uid', isEqualTo: id).get();
    return snapshot.docs.map((e) => AddressModel.fromMap(e.data())).toList();
  }
}