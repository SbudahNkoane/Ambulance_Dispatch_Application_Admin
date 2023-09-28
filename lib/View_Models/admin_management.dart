import 'package:admin_app/Models/admin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AdminManager with ChangeNotifier {
  FirebaseFirestore db = FirebaseFirestore.instance;
  late Admin _adminData;
  Admin get adminData => _adminData;

  Future<Admin> getCurrentAdminData(String userID) async {
    final docRef = db.collection("Admin").doc(userID);
    await docRef.get().then(
      (DocumentSnapshot doc) {
        _adminData = Admin.fromJson(doc.data() as Map<String, dynamic>);
      },
      onError: (e) => print("Error getting document: $e"),
    );
    return _adminData;
  }
}
