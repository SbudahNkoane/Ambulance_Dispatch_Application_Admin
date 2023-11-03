import 'package:flutter/material.dart';
// ignore: library_prefixes
import 'package:firebase_auth/firebase_auth.dart' as fireBaseAuth;
import 'package:cloud_firestore/cloud_firestore.dart';

class Authentication with ChangeNotifier {
  fireBaseAuth.User? _currentUser;
  fireBaseAuth.User? get currentUser => _currentUser;
  bool _showprogress = false;
  bool get showProgress => _showprogress;

  String _userprogresstext = "";
  String get userProgressText => _userprogresstext;

  fireBaseAuth.FirebaseAuth authentication = fireBaseAuth.FirebaseAuth.instance;
  FirebaseFirestore db = FirebaseFirestore.instance;

  //========= LOGIN USER ==========
  Future<String> loginAdmin(String email, String password) async {
    String state = 'OK';
    _showprogress = true;
    _userprogresstext = "Signing in...";
    notifyListeners();
    try {
      await fireBaseAuth.FirebaseAuth.instance
          .signInWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((value) {
        if (value.user!.emailVerified != false) {
          state = 'Confirm Your email to sign in';
        } else {
          _currentUser = value.user;
        }

        return value;
      });
    } on fireBaseAuth.FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        state = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        state = 'Wrong password provided for that user.';
      }
    } finally {
      _showprogress = false;
      notifyListeners();
    }

    return state;
  }

//========= LOG OUT USER ==========
  Future<String> logoutUser() async {
    String state = 'OK';
    _showprogress = true;
    _userprogresstext = "Signing out...";
    notifyListeners();
    try {
      authentication.signOut();
      _currentUser = null;
    } catch (e) {
      state = e.toString();
    } finally {
      _showprogress = false;
      notifyListeners();
    }
    return state;
  }
}
