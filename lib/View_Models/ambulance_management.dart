import 'package:admin_app/Models/ambulance.dart';
import 'package:admin_app/app_constants.dart';
import 'package:flutter/material.dart';

class AmbulanceManager with ChangeNotifier {
  List<Ambulance> _allAmbulances = [];
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

  Future<List<Ambulance>> getAllAmbulances() async {
    try {
      final docRef = database.collection("Ambulance");
      _isloading = true;
      _laodingtext = 'Getting Ambulance info...';
      notifyListeners();
      await docRef.get().then((listOfUsers) {
        _allAmbulances = [];
        for (var user in listOfUsers.docs) {
          _allAmbulances.add(
            Ambulance.fromJson(
              user.data(),
            ),
          );
        }
      });
    } catch (error) {
      print(error);
    } finally {
      _isloading = false;
      notifyListeners();
    }

    return _allAmbulances;
  }

  Future<List<Ambulance>> getAvailableAmbulances() async {
    try {
      final docRef = database
          .collection("Ambulance")
          .where('Status', isEqualTo: 'Available');
      await docRef.get().then((listOfUsers) {
        _availableAmbulances = [];
        for (var user in listOfUsers.docs) {
          _availableAmbulances.add(
            Ambulance.fromJson(
              user.data(),
            ),
          );
        }
      });
    } catch (error) {
      print(error);
    }
    notifyListeners();
    return _availableAmbulances;
  }

  Future<List<Ambulance>> getUnAvailableAmbulances() async {
    try {
      final docRef = database
          .collection("Ambulance")
          .where('Status', isEqualTo: 'Unavailable');
      await docRef.get().then((listOfUsers) {
        _unAvailableAmbulances = [];
        for (var user in listOfUsers.docs) {
          _unAvailableAmbulances.add(
            Ambulance.fromJson(
              user.data(),
            ),
          );
        }
      });
    } catch (error) {
      print(error);
    }
    notifyListeners();
    return _unAvailableAmbulances;
  }

  Future<List<Ambulance>> getBusyAmbulances() async {
    try {
      final docRef =
          database.collection("Ambulance").where('Status', isEqualTo: 'Busy');
      await docRef.get().then((listOfUsers) {
        _busyAmbulances = [];
        for (var user in listOfUsers.docs) {
          _busyAmbulances.add(
            Ambulance.fromJson(
              user.data(),
            ),
          );
        }
      });
    } catch (error) {
      print(error);
    }
    notifyListeners();
    return _busyAmbulances;
  }
}
