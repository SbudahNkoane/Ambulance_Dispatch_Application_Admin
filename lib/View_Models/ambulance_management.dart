import 'package:admin_app/Models/ambulance.dart';
import 'package:admin_app/app_constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class AmbulanceManager with ChangeNotifier {
  List<Ambulance> _allAmbulances = [];
  List<Ambulance> get allAmbulance => _allAmbulances;
  bool _isloading = false;
  bool get isLoading => _isloading;
  String _laodingtext = '';
  String get laodingText => _laodingtext;
  List<Ambulance> _availableAmbulances = [];
  List<Ambulance> get availableAmbulances => _availableAmbulances;
  List<Ambulance> _unAvailableAmbulances = [];
  List<Ambulance> get unAvailableAmbulances => _unAvailableAmbulances;
  List<Ambulance> _busyAmbulances = [];
  List<Ambulance> get busyAmbulances => _busyAmbulances;

  Future<String> registerAmbulance(Ambulance newAmbulance) async {
    String state = 'OK';
    _isloading = true;
    _laodingtext = 'Saving Ambulance info...';
    notifyListeners();
    try {
      final docRef = database.collection("Ambulances");
      await docRef
          .doc()
          .set(
            newAmbulance.toJson(),
          )
          .then((value) async {
        await docRef
            .where(
              'Number_Plate',
              isEqualTo: newAmbulance.numberPlate,
            )
            .get()
            .then((value) async {
          await docRef.doc(value.docs[0].id).update({
            'Ambulance_Id': value.docs[0].id,
          });
        });
      });
    } on FirebaseException catch (err) {
      state = err.message!;
    } catch (e) {
      state = e.toString();
    } finally {
      _isloading = false;
      notifyListeners();
    }
    return state;
  }

  Future<List<Ambulance>> getAllAmbulances() async {
    try {
      final docRef = database.collection("Ambulances");
      _isloading = true;
      _laodingtext = 'Getting Ambulance info...';
      //   notifyListeners();
      await docRef.get().then((listOfAmbulances) {
        if (listOfAmbulances.docs.isNotEmpty) {
          _allAmbulances = [];
          for (var ambulance in listOfAmbulances.docs) {
            _allAmbulances.add(
              Ambulance.fromJson(
                ambulance.data(),
              ),
            );
          }
          database.collection("Ambulances").snapshots().listen(
            (event) {
              _allAmbulances = [];
              for (var ambulance in event.docs) {
                _allAmbulances.add(
                  Ambulance.fromJson(
                    ambulance.data(),
                  ),
                );
              }
              notifyListeners();
            },
            onDone: () async {},
          );
        } else {
          _allAmbulances = [];
        }
      });
    } finally {
      _isloading = false;
      notifyListeners();
    }

    return _allAmbulances;
  }

  Future<List<Ambulance>> getAvailableAmbulances() async {
    _isloading = true;
    _laodingtext = 'Getting Available Ambulances...';
    notifyListeners();
    try {
      final docRef = database
          .collection("Ambulances")
          .where('Status', isEqualTo: 'Available');
      await docRef.get().then((listOfAmbulances) {
        if (listOfAmbulances.docs.isNotEmpty) {
          _availableAmbulances = [];
          for (var ambulance in listOfAmbulances.docs) {
            _availableAmbulances.add(
              Ambulance.fromJson(
                ambulance.data(),
              ),
            );
          }
          database
              .collection("Ambulances")
              .where('Status', isEqualTo: 'Available')
              .snapshots()
              .listen(
            (event) {
              _availableAmbulances = [];
              for (var ambulance in event.docs) {
                _availableAmbulances.add(
                  Ambulance.fromJson(
                    ambulance.data(),
                  ),
                );
              }
              notifyListeners();
            },
            onDone: () async {},
          );
        } else {
          _availableAmbulances = [];
        }
      });
    } finally {
      _isloading = false;
      notifyListeners();
    }

    return _availableAmbulances;
  }

  Future<List<Ambulance>> getUnAvailableAmbulances() async {
    _isloading = true;
    _laodingtext = 'getting UnAvailable Ambulances...';
    notifyListeners();
    try {
      final docRef =
          database.collection("Ambulances").where('Status', whereIn: [
        'Unavailable',
        'Unoccupied',
      ]);
      await docRef.get().then((listOfAmbulances) {
        if (listOfAmbulances.docs.isNotEmpty) {
          _unAvailableAmbulances = [];
          for (var ambulance in listOfAmbulances.docs) {
            _unAvailableAmbulances.add(
              Ambulance.fromJson(
                ambulance.data(),
              ),
            );
          }
          database
              .collection("Ambulances")
              .where('Status', whereIn: [
                'Unavailable',
                'Unoccupied',
              ])
              .snapshots()
              .listen(
                (event) {
                  _unAvailableAmbulances = [];
                  for (var ambulance in event.docs) {
                    _unAvailableAmbulances.add(
                      Ambulance.fromJson(
                        ambulance.data(),
                      ),
                    );
                  }
                  notifyListeners();
                },
                onDone: () async {},
              );
        } else {
          _unAvailableAmbulances = [];
        }
      });
    } finally {
      _isloading = false;
      notifyListeners();
    }

    return _unAvailableAmbulances;
  }

  Future<List<Ambulance>> getBusyAmbulances() async {
    _isloading = true;
    _laodingtext = 'Getting Dispatched Ambulances...';
    notifyListeners();
    try {
      final docRef = database
          .collection("Ambulances")
          .where('Status', isEqualTo: 'Dispatched');
      await docRef.get().then((listOfAmbulances) {
        if (listOfAmbulances.docs.isNotEmpty) {
          _busyAmbulances = [];
          for (var ambulances in listOfAmbulances.docs) {
            _busyAmbulances.add(
              Ambulance.fromJson(
                ambulances.data(),
              ),
            );
          }
          database
              .collection("Ambulances")
              .where('Status', isEqualTo: 'Dispatched')
              .snapshots()
              .listen(
            (event) {
              _busyAmbulances = [];
              for (var ambulances in event.docs) {
                _busyAmbulances.add(
                  Ambulance.fromJson(
                    ambulances.data(),
                  ),
                );
              }
              notifyListeners();
            },
            onDone: () async {},
          );
        } else {
          _busyAmbulances = [];
        }
      });
    } finally {
      _isloading = false;
      notifyListeners();
    }

    return _busyAmbulances;
  }
}
