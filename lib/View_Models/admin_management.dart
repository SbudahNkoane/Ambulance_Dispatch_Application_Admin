import 'package:admin_app/Models/admin.dart';
import 'package:admin_app/app_constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AdminManager with ChangeNotifier {
  late Admin _adminData;
  Admin get adminData => _adminData;

  Future<Admin> getCurrentAdminData(String userID) async {
    final docRef = database.collection("Admin").doc(userID);
    await docRef.get().then(
      (DocumentSnapshot doc) {
        _adminData = Admin.fromJson(doc.data() as Map<String, dynamic>);
      },
      onError: (e) => print("Error getting document: $e"),
    );
    docRef.snapshots().listen(
      (event) {
        _adminData = Admin.fromJson(event.data());
      },
      onError: (e) {},
    );
    return _adminData;
  }

  Future<String> updateProfilePicture() async {
    return '';
  }
}
