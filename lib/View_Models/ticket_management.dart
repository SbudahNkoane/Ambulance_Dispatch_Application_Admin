// ignore_for_file: empty_catches

import 'package:admin_app/Models/ambulance.dart';
import 'package:admin_app/Models/ticket.dart';
import 'package:admin_app/app_constants.dart';
import 'package:flutter/material.dart';

class TicketManager with ChangeNotifier {
  List<Ticket> _allTickets = [];
  List<Ticket> get allTickets => _allTickets;
  List<Ticket> _openTickets = [];
  List<Ticket> get openTickets => _openTickets;
  List<Ticket> _closedTickets = [];
  List<Ticket> get closedTickets => _closedTickets;
  List<Ticket> _pendingTickets = [];
  List<Ticket> get pendingTickets => _pendingTickets;
  int _clickedTicket = 0;
  int get clickedTicket => _clickedTicket;
  bool _showprogress = false;
  bool get showProgress => _showprogress;

  String _userprogresstext = "";
  String get userProgressText => _userprogresstext;

  Ticket? _ticketViewed;
  Ticket? get viewedTicket => _ticketViewed;
  Stream? _tickets;
  Stream ticketsStreamer() {
    _tickets = database.collection('Ticket').snapshots();

    return _tickets!;
  }

  Future<Ticket> openClickedTicket(Ticket ticket) async {
    _ticketViewed = ticket;
    return _ticketViewed!;
  }

  Future<String> dispatchAmbulance(
      String ticketID, Ambulance ambulance, String adminID) async {
    String state = 'OK';
    try {
      await database.collection('Dispatched Ambulance').doc(ticketID).set({
        'Ambulance': ambulance.toJson(),
        'Ticket_ID': ticketID,
      }).then((value) async {
        await database
            .collection('Dispatched Ambulance')
            .doc(ticketID)
            .get()
            .then(
          (dispatchedAmbulance) async {
            await database
                .collection('Ambulance')
                .where('Number_Plate', isEqualTo: ambulance.numberPlate)
                .get()
                .then((ambulance) {
              database.collection('Ambulance').doc(ambulance.docs[0].id).update(
                {
                  'Status': 'Dispatched',
                },
              );
            }).onError((error, stackTrace) => null);
            await database.collection('Ticket').doc(ticketID).update(
              {
                'Status': 'Dispatched',
                'Dispatched_Ambulance':
                    dispatchedAmbulance.data()!['Ambulance'],
                'Managed_By': adminID,
              },
            );
          },
        );
      }).onError((error, stackTrace) => null);
    } catch (e) {
      state = e.toString();
    }
    return state;
  }

  Future<List<Ticket>> getAllTickets() async {
    _showprogress = true;
    _userprogresstext = "Getting Tickets...";
    notifyListeners();
    try {
      final docRef = database.collection("Ticket");
      await docRef.get().then((listOfUsers) async {
        if (listOfUsers.docs.isNotEmpty) {
          _allTickets = [];
          for (var user in listOfUsers.docs) {
            _allTickets.add(
              Ticket.fromJson(
                user.data(),
              ),
            );
          }
        } else {
          _allTickets = [];
        }
      });
    } catch (error) {}
    _showprogress = false;
    notifyListeners();
    return _allTickets;
  }

  int setTicketIndex(int index) {
    _clickedTicket = index;
    notifyListeners();
    return _clickedTicket;
  }

  Future<List<Ticket>> getopenTickets() async {
    _showprogress = true;
    _userprogresstext = "loading Open Tickets...";
    notifyListeners();
    try {
      final docRef = database.collection("Ticket").where(
            'Status',
            isEqualTo: 'Searching for an Ambulance',
          );
      await docRef.get().then((listOfUsers) async {
        if (listOfUsers.docs.isNotEmpty) {
          _openTickets = [];
          for (var user in listOfUsers.docs) {
            _openTickets.add(
              Ticket.fromJson(
                user.data(),
              ),
            );
          }
        } else {
          _openTickets = [];
        }
      });
    } catch (error) {}
    _showprogress = false;
    notifyListeners();
    return _openTickets;
  }

  Future<List<Ticket>> getclosedTickets() async {
    _showprogress = true;
    _userprogresstext = "loading Closed Tickets...";
    notifyListeners();
    try {
      final docRef =
          database.collection("Ticket").where('Status', isEqualTo: 'Closed');
      await docRef.get().then((listOfUsers) async {
        if (listOfUsers.docs.isNotEmpty) {
          _closedTickets = [];
          for (var user in listOfUsers.docs) {
            _closedTickets.add(
              Ticket.fromJson(
                user.data(),
              ),
            );
          }
        } else {
          _closedTickets = [];
        }
      });
    } catch (error) {}
    _showprogress = false;
    notifyListeners();
    return _closedTickets;
  }

  Future<List<Ticket>> getpendingTickets() async {
    _showprogress = true;
    _userprogresstext = "loading Pending Tickets...";
    notifyListeners();
    try {
      final docRef = database.collection("Ticket").where(
        'Status',
        whereNotIn: [
          'Searching for an Ambulance',
          'Closed',
        ],
      );
      await docRef.get().then((listOfUsers) async {
        if (listOfUsers.docs.isNotEmpty) {
          _pendingTickets = [];
          for (var user in listOfUsers.docs) {
            _pendingTickets.add(
              Ticket.fromJson(
                user.data(),
              ),
            );
          }
        } else {
          _pendingTickets = [];
        }
      });
    } catch (error) {}
    _showprogress = false;
    notifyListeners();
    return _pendingTickets;
  }
}
