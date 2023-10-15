import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geocoding/geocoding.dart';

class Ticket {
  final String? ticketId;
  final String userId;
  final Placemark pickUpLocation;
  final String description;
  final int? emergencyLevel;
  final String? dispatchedAmbulance;
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

  static Future<Placemark> getAddress(GeoPoint geoPoint) async {
    final address =
        await placemarkFromCoordinates(geoPoint.latitude, geoPoint.longitude);
    return address[0];
  }

  static Future<Ticket> fromJson(Map<dynamic, dynamic>? json) async => Ticket(
        bookedAt: (json!['Booked_At'] as Timestamp).toDate(),
        description: json['Description'] as String,
        pickUpLocation: await getAddress(json['PickUp_Location'] as GeoPoint),
        //  await placemarkFromCoordinates(
        //     json['PickUp_Location'] + {'latitude'},
        //     json['PickUp_Location']['longitude']),
        //json['PickUp_Location'] as GeoPoint,
        status: json['Status'] as String,
        ticketId: json['Ticket_Id'] as String?,
        userId: json['User_Id'] as String,
        dispatchedAmbulance: json['Dispatched_Ambulance'] as String?,
        closedAt: json['Closed_At'] == null
            ? json['Closed_At'] as DateTime?
            : (json['Closed_At'] as Timestamp?)!.toDate(),
        managedBy: json['Managed_By'] as String?,
      );
}
