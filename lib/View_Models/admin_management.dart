import 'package:admin_app/Models/admin.dart';
import 'package:admin_app/app_constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AdminManager with ChangeNotifier {
  late Admin _adminData;
  Admin get adminData => _adminData;
  bool _showprogress = false;
  bool get showProgress => _showprogress;
  String _userprogresstext = "";
  String get userProgressText => _userprogresstext;

  Future<Admin> getCurrentAdminData(String userID) async {
    _showprogress = true;
    _userprogresstext = 'Getting Data...';
    notifyListeners();
    final docRef = database.collection("Admin").doc(userID);
    await docRef.get().then(
      (DocumentSnapshot doc) {
        _adminData = Admin.fromJson(doc.data() as Map<String, dynamic>);
      },
    );
    docRef.snapshots().listen(
      (event) {
        _adminData = Admin.fromJson(event.data());
      },
    );
    return _adminData;
  }
}
