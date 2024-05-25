

// import 'dart:io';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:terra_treasures/model/user_model.dart';

// class Controller{

// final db=FirebaseFirestore.instance;


// Future addUser(UserModel userModel,uid) async
// {
//   final docRef= db.collection("register").doc(uid);
//   docRef.set(userModel.data(docRef.id));
//   fetchAllUser();
// }

//  Future<void> create(String name, String email, String phoneNumber, String imageUrl) async {
//   final collectionRef = FirebaseFirestore.instance.collection('register');
//   await collectionRef.add({
//     'name': name,
//     'email': email,
//     'phoneNumber': phoneNumber,
//     'imageUrl': imageUrl, // Add image URL here
//     //'id':id
//   });
// }

// List<UserModel> listOfData=[];

// Future<List<UserModel>> fetchAllUser() async {
//   final snapshot = await db.collection("register").get();
//   listOfData = snapshot.docs.map((e) {
//     return UserModel.fromData(e.data());
    
//   }).toList();
//   print(listOfData);
//   return listOfData;
// }

// UserModel? singleUserData;

// Future fetchSingleUserData(id) async
// {
//   final snapshot = await db.collection("register").doc(id).get();

//   singleUserData = UserModel.fromData(snapshot.data()!);
// }

//  Future<XFile?> pickImage() async {
//   final imagePicker = ImagePicker();
//   final pickedImageFile = await imagePicker.pickImage(
//     source: ImageSource.gallery, // Or ImageSource.camera
//   );
//   return pickedImageFile;
// }


// Future<String> uploadImage(XFile imageFile) async {
//   final storage = FirebaseStorage.instance;
//   final storageRef = storage.ref().child('images/${imageFile.name}');

//   try {
//     final uploadTask = storageRef.putFile(File(imageFile.path));
//     final snapshot = await uploadTask.whenComplete(() => null);
//     final downloadUrl = await snapshot.ref.getDownloadURL();
//     return downloadUrl;
//   } on FirebaseException catch (e) {
//     // Handle errors (e.g., network issues, permission denied)
//     print(e.message);
//     return ''; // Or throw an exception
//   }
// }


// }


import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:terra_treasures/model/seller_model.dart';
import 'package:terra_treasures/model/user_model.dart';

class SellerController {
  final db = FirebaseFirestore.instance;

  Future<void> addUser(SellerModel sellerModel, String uid) async {
    final docRef = db.collection("seller").doc(uid);
    await docRef.set(sellerModel.toMap());
    fetchAllUser();
  }

  Future<void> create(String name, String email, String phoneNumber, String imageUrl,String city,String state,String house,String street) async {
    final collectionRef = FirebaseFirestore.instance.collection('seller');
    await collectionRef.add({
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'imageUrl': imageUrl,
      'city':city,
      'state':state,
      'house':house,
      'street':street
    });
    
  }

  List<UserModel> listOfData = [];

  Future<List<UserModel>> fetchAllUser() async {
    final snapshot = await db.collection("seller").get();
    listOfData = snapshot.docs.map((e) => UserModel.fromMap(e.data())).toList();
    print(listOfData);
    return listOfData;
  }

  SellerModel? singleUserData;

  Future<void> fetchSingleUserData(String id) async {
    final snapshot = await db.collection("seller").doc(id).get();
    singleUserData = SellerModel.fromMap(snapshot.data()!);
  }

  Future<XFile?> pickImage() async {
    final imagePicker = ImagePicker();
    return await imagePicker.pickImage(
      source: ImageSource.gallery,
    );
  }


  Future<String> uploadImage(XFile imageFile) async {
    final storageRef = FirebaseStorage.instance.ref().child('images/${imageFile.name}');
    try {
      final uploadTask = storageRef.putFile(File(imageFile.path));
      final snapshot = await uploadTask.whenComplete(() => null);
      return await snapshot.ref.getDownloadURL();
    } on FirebaseException catch (e) {
      print(e.message);
      return '';
    }
  }
}
