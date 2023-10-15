import 'package:admin_app/Models/paramedic.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ParamedicManager with ChangeNotifier {
  FirebaseFirestore db = FirebaseFirestore.instance;

  List<Paramedic> _allParamedics = [];
  List<Paramedic> get allParamedics => _allParamedics;

  int _clickedUser = 0;
  int get clickedUser => _clickedUser;

  Future<List<Paramedic>> getAllParamedics() async {
    try {
      final docRef = db.collection("Paramedic");
      await docRef.get().then((listOfParamedics) {
        _allParamedics = [];
        for (var user in listOfParamedics.docs) {
          _allParamedics.add(
            Paramedic.fromJson(
              user.data(),
            ),
          );
        }
      });
    } catch (error) {
      print(error);
    }
    notifyListeners();
    return _allParamedics;
  }
}
