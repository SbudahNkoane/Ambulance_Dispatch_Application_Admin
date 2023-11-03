import 'package:admin_app/Models/paramedic.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ParamedicManager with ChangeNotifier {
  FirebaseFirestore db = FirebaseFirestore.instance;
  bool _showprogress = false;
  bool get showProgress => _showprogress;

  String _userprogresstext = "";
  String get userProgressText => _userprogresstext;
  List<Paramedic> _allParamedics = [];
  List<Paramedic> get allParamedics => _allParamedics;

  Future<List<Paramedic>> getAllParamedics() async {
    _showprogress = true;
    _userprogresstext = "loading Paramedics...";
    notifyListeners();
    try {
      final docRef = db.collection("Paramedic");
      await docRef.get().then((listOfParamedics) {
        if (listOfParamedics.docs.isNotEmpty) {
          _allParamedics = [];
          for (var paramedic in listOfParamedics.docs) {
            _allParamedics.add(
              Paramedic.fromJson(
                paramedic.data(),
              ),
            );
          }
        } else {
          _allParamedics = [];
        }
      });
    } finally {
      _showprogress = false;
      notifyListeners();
    }

    return _allParamedics;
  }
}
