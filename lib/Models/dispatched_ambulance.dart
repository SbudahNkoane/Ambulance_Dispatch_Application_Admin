class DispatchedAmbulance {
  final String ticketID;
  final String ambulance;

  DispatchedAmbulance({
    required this.ticketID,
    required this.ambulance,
  });
  Map<String, Object?> toJson() => {
        'Ticket_ID': ticketID,
        'Ambulance': ambulance,
      };
  static DispatchedAmbulance fromJson(Map<dynamic, dynamic>? json) =>
      DispatchedAmbulance(
        ticketID: json!['Ticket_ID'] as String,
        ambulance: json['Ambulance'] as String,
      );
}
