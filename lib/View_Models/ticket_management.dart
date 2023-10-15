import 'package:admin_app/Models/ticket.dart';
import 'package:admin_app/app_constants.dart';
import 'package:flutter/material.dart';

class TicketManager with ChangeNotifier {
  List<Ticket> _allTickets = [];
  List<Ticket> _openTickets = [];
  List<Ticket> get openTickets => _openTickets;
  List<Ticket> _closedTickets = [];
  List<Ticket> get closedTickets => _closedTickets;
  List<Ticket> _pendingTickets = [];
  List<Ticket> get pendingTickets => _pendingTickets;
  Future<List<Ticket>> getAllUsers() async {
    try {
      final docRef = database.collection("Ticket");
      await docRef.get().then((listOfUsers) async {
        _allTickets = [];
        for (var user in listOfUsers.docs) {
          _allTickets.add(
            await Ticket.fromJson(
              user.data(),
            ),
          );
        }
      });
    } catch (error) {
      print(error);
    }
    notifyListeners();
    return _allTickets;
  }

  Future<List<Ticket>> getopenTickets() async {
    try {
      final docRef = database.collection("Ticket").where(
            'Status',
            isEqualTo: 'Searching for an Ambulance',
          );
      await docRef.get().then((listOfUsers) async {
        _openTickets = [];
        for (var user in listOfUsers.docs) {
          _openTickets.add(
            await Ticket.fromJson(
              user.data(),
            ),
          );
        }
      });
    } catch (error) {
      print(error);
    }
    notifyListeners();
    return _openTickets;
  }

  Future<List<Ticket>> getclosedTickets() async {
    try {
      final docRef =
          database.collection("Ticket").where('Status', isEqualTo: 'Closed');
      await docRef.get().then((listOfUsers) async {
        _closedTickets = [];
        for (var user in listOfUsers.docs) {
          _closedTickets.add(
            await Ticket.fromJson(
              user.data(),
            ),
          );
        }
      });
    } catch (error) {
      print(error);
    }
    notifyListeners();
    return _closedTickets;
  }

  Future<List<Ticket>> getpendingTickets() async {
    try {
      final docRef = database.collection("Ticket").where(
        'Status',
        whereNotIn: [
          'Searching for an Ambulance',
          'Closed',
        ],
      );
      await docRef.get().then((listOfUsers) async {
        _pendingTickets = [];
        for (var user in listOfUsers.docs) {
          _pendingTickets.add(
            await Ticket.fromJson(
              user.data(),
            ),
          );
        }
      });
    } catch (error) {
      print(error);
    }
    notifyListeners();
    return _pendingTickets;
  }
}
