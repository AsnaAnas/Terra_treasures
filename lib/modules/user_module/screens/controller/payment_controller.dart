import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:upi_india/upi_india.dart';

class PaymentController with ChangeNotifier {
  final db = FirebaseFirestore.instance;
  UpiIndia _upiIndia = UpiIndia();
  UpiApp app = UpiApp.googlePay;

  Future<UpiApp> appOpen() async {
    // You can list available UPI apps and return the selected one
    List<UpiApp>? apps = await _upiIndia.getAllUpiApps();
    return apps!.isNotEmpty ? apps.first : UpiApp.googlePay;
  }

  Future<void> initiateTransaction({
    required double price,
    required String receiverName,
  }) async {
    try {
      UpiResponse response = await _upiIndia.startTransaction(
        app: app,
        receiverUpiId: 'receiver_upi_id@upi',
        receiverName: receiverName,
        transactionRefId: 'Testing',
        transactionNote: 'Test Transaction',
        amount: price,
      );

      // Handle different response statuses
      switch (response.status) {
        case UpiPaymentStatus.SUCCESS:
          print('Transaction Successful');
          break;
        case UpiPaymentStatus.SUBMITTED:
          print('Transaction Submitted');
          break;
        case UpiPaymentStatus.FAILURE:
          print('Transaction Failed');
          break;
        default:
          print('Unknown response');
          break;
      }
    } catch (e) {
      print('Error initiating transaction: $e');
    }
  }


   Future<String> create(
    String productId,
    String userId,
    double price,
    String paymentMethod,
  ) async {
    final collectionRef = db.collection('payment');
    final docRef = await collectionRef.add({
      'product_id': productId,
      'user_id': userId,
      'price': price,
      'payment_method':paymentMethod
    });
     final orderId = docRef.id;
    await docRef.update({'id': orderId, 'user_id': userId});
    return orderId;
}
}