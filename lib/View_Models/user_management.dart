import 'package:admin_app/Models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as user;
import 'package:flutter/material.dart';

class UserManager with ChangeNotifier {
  //============All Users on the System==========
  List<User> _allUsers = [];
  List<User> get allUsers => _allUsers;

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
    return _allVerifiedUsers;
  }

  Future<List<User>> getAllUsers() async {
    // final credential = await authentication
    //       .createUserWithEmailAndPassword(
    //     email: email,
    //     password: password,
    //   )
    //       .then((registeredUser) async {
    //     await db
    //         .collection('User')
    //         .doc(registeredUser.user!.uid)
    //         .set(userInfo.toJson()).then((value) {
    // registeredUser.user!.sendEmailVerification();
    // })
    //         .onError((error, stackTrace) {
    //       print(error);
    //     });
    //   });
    try {
      final docRef = db.collection("User");
      await docRef.get().then((listOfUsers) {
        //   _allUsers = [];
        for (var user in listOfUsers.docs) {
          print(user.data());
          _allUsers.add(
            User.fromJson(
              user.data(),
            ),
          );
        }
      });
    } on user.FirebaseException catch (error) {
      print(error);
    }

    return _allUsers;
  }
}
