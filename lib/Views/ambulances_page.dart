import 'package:admin_app/Models/ambulance.dart';

import 'package:flutter/material.dart';

class AmbulancesScreen extends StatefulWidget {
  final List<Ambulance> ambulances;
  const AmbulancesScreen({super.key, required this.ambulances});

  @override
  State<AmbulancesScreen> createState() => _AmbulancesScreenState();
}

class _AmbulancesScreenState extends State<AmbulancesScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: MediaQuery.of(context).size.height / 1.3,
      child: Center(
        child: ListView.builder(
          itemCount: widget.ambulances.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title:
                    Text('Ambulance ${widget.ambulances[index].numberPlate}'),
                subtitle: Text('Status: ${widget.ambulances[index].status}'),
              ),
            );
          },
        ),
      ),
    );
  }
}
