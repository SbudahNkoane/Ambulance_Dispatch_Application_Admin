import 'package:admin_app/Models/paramedic.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ParamedicManager with ChangeNotifier {
  FirebaseFirestore db = FirebaseFirestore.instance;

  List<Paramedic> _allParamedics = [];
  List<Paramedic> get allParamedics => _allParamedics;

  Future<List<Paramedic>> getAllParamedics() async {
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
    } catch (error) {
      print(error);
    }
    notifyListeners();
    return _allParamedics;
  }
}
