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
  bool _showprogress = false;
  bool get showProgress => _showprogress;

  String _userprogresstext = "";
  String get userProgressText => _userprogresstext;
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
    _showprogress = true;
    _userprogresstext = "loading Verified users...";
    notifyListeners();
    try {
      await db
          .collection('User')
          .where('Account_Status', isEqualTo: 'Verified')
          .get()
          .then((querySnapshot) {
        db
            .collection('User')
            .where('Account_Status', isEqualTo: 'Verified')
            .snapshots()
            .listen((event) {
          if (event.docs.isNotEmpty) {
            _allVerifiedUsers = [];
            for (var user in event.docs) {
              _allVerifiedUsers.add(
                User.fromJson(
                  user.data(),
                ),
              );
            }
          } else {
            _allVerifiedUsers = [];
          }

          notifyListeners();
        });
        if (querySnapshot.docs.isNotEmpty) {
          _allVerifiedUsers = [];
          for (var user in querySnapshot.docs) {
            _allVerifiedUsers.add(
              User.fromJson(
                user.data(),
              ),
            );
          }
        } else {
          _allVerifiedUsers = [];
        }
      });
    } finally {
      _showprogress = false;
      notifyListeners();
    }
    return _allVerifiedUsers;
  }

  Future<List<User>> getUnverifiedUsers() async {
    _showprogress = true;
    _userprogresstext = "loading Unverified users...";
    notifyListeners();
    try {
      await db
          .collection('User')
          .where('Account_Status', isEqualTo: 'Not Verified')
          .get()
          .then((querySnapshot) {
        _allUnverifiedUsers = [];
        db
            .collection('User')
            .where('Account_Status', isEqualTo: 'Not Verified')
            .snapshots()
            .listen((event) {
          _allUnverifiedUsers = [];
          for (var user in event.docs) {
            _allUnverifiedUsers.add(
              User.fromJson(
                user.data(),
              ),
            );
          }
          notifyListeners();
        });
        for (var user in querySnapshot.docs) {
          _allUnverifiedUsers.add(
            User.fromJson(
              user.data(),
            ),
          );
        }
      });
    } finally {
      _showprogress = false;
      notifyListeners();
    }

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
    _showprogress = true;
    _userprogresstext = "Updating User Status...";
    notifyListeners();
    await db.collection('User').doc(userID).update(
      {
        'Account_Status': status,
        'Verified_By': verifyer.emailaddress,
      },
    ).onError((error, stackTrace) {
      state = error.toString();
    });
    _showprogress = false;
    notifyListeners();
    return state;
  }

  Future<List<User>> getAllUsers() async {
    _showprogress = true;
    _userprogresstext = "Loading Users...";
    notifyListeners();
    try {
      final docRef = db.collection("User");
      await docRef.get().then((listOfUsers) {
        _allUsers = [];
        docRef.snapshots().listen((event) {
          _allUsers = [];
          for (var user in event.docs) {
            _allUsers.add(
              User.fromJson(
                user.data(),
              ),
            );
          }
          notifyListeners();
        });
        for (var user in listOfUsers.docs) {
          _allUsers.add(
            User.fromJson(
              user.data(),
            ),
          );
        }
      });
    } finally {
      _showprogress = false;
      notifyListeners();
    }

    return _allUsers;
  }
}
