import 'package:cloud_firestore/cloud_firestore.dart';

class Ticket {
  final String? ticketId;
  final String userId;
  final GeoPoint pickUpLocation;
  final String description;
  final int? emergencyLevel;
  final Map? dispatchedAmbulance;
  final DateTime bookedAt;
  final DateTime? closedAt;
  final String status;
  final String? managedBy;

  Ticket({
    this.ticketId,
    required this.userId,
    required this.pickUpLocation,
    required this.description,
    this.emergencyLevel,
    this.dispatchedAmbulance,
    required this.bookedAt,
    this.closedAt,
    required this.status,
    this.managedBy,
  });

  static Ticket fromJson(Map<dynamic, dynamic>? json) => Ticket(
        bookedAt: (json!['Booked_At'] as Timestamp).toDate(),
        description: json['Description'] as String,
        pickUpLocation: json['PickUp_Location'] as GeoPoint,
        status: json['Status'] as String,
        ticketId: json['Ticket_Id'] as String?,
        userId: json['User_Id'] as String,
        dispatchedAmbulance: json['Dispatched_Ambulance'] as Map?,
        closedAt: json['Closed_At'] == null
            ? json['Closed_At'] as DateTime?
            : (json['Closed_At'] as Timestamp?)!.toDate(),
        managedBy: json['Managed_By'] as String?,
      );
}
