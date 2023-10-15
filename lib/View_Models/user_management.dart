import 'package:admin_app/Models/admin.dart';
import 'package:admin_app/Models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/material.dart';

class UserManager with ChangeNotifier {
  auth.FirebaseAuth authentication = auth.FirebaseAuth.instance;
  //============All Users on the System==========
  List<User> _allUsers = [];
  List<User> get allUsers => _allUsers;

  int _clickedUser = 0;
  int get clickedUser => _clickedUser;

  //============All Verified Users on the System==========
  List<User> _allVerifiedUsers = [];
  List<User> get allVerifiedUsers => _allVerifiedUsers;
  //============All Unverified Users on the System==========
  List<User> _allUnverifiedUsers = [];
  List<User> get allUnverifiedUsers => _allUnverifiedUsers;

  FirebaseFirestore db = FirebaseFirestore.instance;

  Future<List<User>> getVerifiedUsers() async {
    try {
      await db
          .collection('User')
          .where('Account_Status', isEqualTo: 'Verified')
          .get()
          .then((querySnapshot) {
        _allVerifiedUsers = [];
        for (var user in querySnapshot.docs) {
          _allVerifiedUsers.add(
            User.fromJson(
              user.data(),
            ),
          );
        }
      });
    } catch (e) {
      print(e);
    }
    return _allVerifiedUsers;
  }

  Future<List<User>> getUnverifiedUsers() async {
    try {
      await db
          .collection('User')
          .where('Account_Status', isEqualTo: 'Unverified')
          .get()
          .then((querySnapshot) {
        _allUnverifiedUsers = [];
        for (var user in querySnapshot.docs) {
          _allUnverifiedUsers.add(
            User.fromJson(
              user.data(),
            ),
          );
        }
      });
    } catch (e) {
      print(e);
    }
    notifyListeners();
    return _allUnverifiedUsers;
  }

  int viewUser(int index) {
    _clickedUser = index;
    notifyListeners();
    return index;
  }

  Future<String> updateUserAccountStatus(
      {required String userID,
      required Admin verifyer,
      required String status}) async {
    String state = 'OK';

    await db.collection('User').doc(userID).set({
      'Account_Status': status,
      'Verified_By': verifyer.emailaddress,
    }, SetOptions(merge: true)).onError((error, stackTrace) {
      state = error.toString();
    });
    notifyListeners();
    return state;
  }

  Future<List<User>> getAllUsers() async {
    try {
      final docRef = db.collection("User");
      await docRef.get().then((listOfUsers) {
        _allUsers = [];
        for (var user in listOfUsers.docs) {
          _allUsers.add(
            User.fromJson(
              user.data(),
            ),
          );
        }
      });
    } catch (error) {
      print(error);
    }
    notifyListeners();
    return _allUsers;
  }
}
