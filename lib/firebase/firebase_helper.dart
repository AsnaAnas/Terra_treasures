 import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class firebasehelper{

   final _auth = FirebaseAuth.instance;

  final _firebasefirestore = FirebaseFirestore.instance;



  Future<Stream<QuerySnapshot>> getuser()async{
    String id = _auth.currentUser!.uid;
    return  await _firebasefirestore.collection('register').where('userid',isEqualTo: id).snapshots();
  }


}