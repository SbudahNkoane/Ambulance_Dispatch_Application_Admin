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
    _tickets = database.collection('Tickets').snapshots();

    return _tickets!;
  }

  Future<Ticket> openClickedTicket(Ticket ticket) async {
    _ticketViewed = ticket;
    return _ticketViewed!;
  }

  void listenToTicketsUpdate() {
    database.collection("Tickets").snapshots().listen((event) {
      if (event.docs.isNotEmpty) {
        _allTickets = [];
        _openTickets = [];
        _closedTickets = [];
        _pendingTickets = [];
        for (var ticket in event.docs) {
          _allTickets.add(
            Ticket.fromJson(
              ticket.data(),
            ),
          );
          if (ticket.data()['Status'] == 'Searching for an Ambulance') {
            _openTickets.add(
              Ticket.fromJson(
                ticket.data(),
              ),
            );
          } else if (ticket.data()['Status'] == 'Closed') {
            _closedTickets.add(
              Ticket.fromJson(
                ticket.data(),
              ),
            );
          } else {
            _pendingTickets.add(
              Ticket.fromJson(
                ticket.data(),
              ),
            );
          }
        }
      } else {
        _allTickets = [];
      }

      notifyListeners();
    });
  }

  Future<String> dispatchAmbulance(
      String ticketID, Ambulance ambulance, String adminID) async {
    String state = 'OK';
    try {
      await database.collection('Dispatched Ambulances').doc(ticketID).set({
        'Ambulance': ambulance.toJson(),
        'Ticket_ID': ticketID,
      }).then((value) async {
        await database
            .collection('Dispatched Ambulances')
            .doc(ticketID)
            .get()
            .then(
          (dispatchedAmbulance) async {
            await database
                .collection('Ambulances')
                .where('Number_Plate', isEqualTo: ambulance.numberPlate)
                .get()
                .then((ambulance) async {
              await database
                  .collection('Ambulances')
                  .doc(ambulance.docs[0].id)
                  .update(
                {
                  'Status': 'Dispatched',
                },
              );
            }).onError((error, stackTrace) => null);
            await database.collection('Tickets').doc(ticketID).update(
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
    //  notifyListeners();
    try {
      final docRef = database.collection("Tickets");
      await docRef.get().then((listOfTickets) async {
        if (listOfTickets.docs.isNotEmpty) {
          _allTickets = [];
          for (var ticket in listOfTickets.docs) {
            _allTickets.add(
              Ticket.fromJson(
                ticket.data(),
              ),
            );
          }
          listenToTicketsUpdate();
          // database.collection("Tickets").snapshots().listen((event) {
          //   if (event.docs.isNotEmpty) {
          //     _allTickets = [];
          //     for (var ticket in event.docs) {
          //       _allTickets.add(
          //         Ticket.fromJson(
          //           ticket.data(),
          //         ),
          //       );
          //     }
          //   } else {
          //     _allTickets = [];
          //   }

          //   notifyListeners();
          // });
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
      final docRef = database.collection("Tickets").where(
            'Status',
            isEqualTo: 'Searching for an Ambulance',
          );
      await docRef.get().then((listOfTickets) async {
        if (listOfTickets.docs.isNotEmpty) {
          _openTickets = [];
          for (var ticket in listOfTickets.docs) {
            _openTickets.add(
              Ticket.fromJson(
                ticket.data(),
              ),
            );
          }
          // database
          //     .collection("Tickets")
          //     .where(
          //       'Status',
          //       isEqualTo: 'Searching for an Ambulance',
          //     )
          //     .snapshots()
          //     .listen((event) {
          //   if (event.docs.isNotEmpty) {
          //     _openTickets = [];
          //     for (var ticket in event.docs) {
          //       _openTickets.add(
          //         Ticket.fromJson(
          //           ticket.data(),
          //         ),
          //       );
          //     }
          //   } else {
          //     _openTickets = [];
          //   }

          //   notifyListeners();
          // });
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
          database.collection("Tickets").where('Status', isEqualTo: 'Closed');
      await docRef.get().then((listOfTickets) async {
        if (listOfTickets.docs.isNotEmpty) {
          _closedTickets = [];
          for (var ticket in listOfTickets.docs) {
            _closedTickets.add(
              Ticket.fromJson(
                ticket.data(),
              ),
            );
          }
          // database
          //     .collection("Tickets")
          //     .where(
          //       'Status',
          //       isEqualTo: 'Closed',
          //     )
          //     .snapshots()
          //     .listen((event) {
          //   if (event.docs.isNotEmpty) {
          //     _closedTickets = [];
          //     for (var ticket in event.docs) {
          //       _closedTickets.add(
          //         Ticket.fromJson(
          //           ticket.data(),
          //         ),
          //       );
          //     }
          //   } else {
          //     _closedTickets = [];
          //   }

          //   notifyListeners();
          // });
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
      final docRef = database.collection("Tickets").where(
        'Status',
        whereNotIn: [
          'Searching for an Ambulance',
          'Closed',
        ],
      );
      await docRef.get().then((listOfTickets) async {
        if (listOfTickets.docs.isNotEmpty) {
          _pendingTickets = [];
          for (var ticket in listOfTickets.docs) {
            _pendingTickets.add(
              Ticket.fromJson(
                ticket.data(),
              ),
            );
          }
          // database
          //     .collection("Tickets")
          //     .where(
          //       'Status',
          //       whereNotIn: [
          //         'Searching for an Ambulance',
          //         'Closed',
          //       ],
          //     )
          //     .snapshots()
          //     .listen((event) {
          //       if (event.docs.isNotEmpty) {
          //         _pendingTickets = [];
          //         for (var ticket in event.docs) {
          //           _pendingTickets.add(
          //             Ticket.fromJson(
          //               ticket.data(),
          //             ),
          //           );
          //         }
          //       } else {
          //         _pendingTickets = [];
          //       }

          //       notifyListeners();
          //     });
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
