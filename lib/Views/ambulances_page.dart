import 'package:admin_app/Models/ambulance.dart';
import 'package:admin_app/Routes/routes.dart';

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
      padding: const EdgeInsets.all(10),
      height: MediaQuery.of(context).size.height / 1.3,
      child: Center(
        child: Column(
          children: [
            Row(
              children: [
                OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(
                      AppRouteManager.registerAmbulancePage,
                    );
                  },
                  child: const Text('Register New Ambulance'),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 3,
              child: ListView.builder(
                itemCount: widget.ambulances.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(
                          'Ambulance ${widget.ambulances[index].numberPlate}'),
                      subtitle:
                          Text('Status: ${widget.ambulances[index].status}'),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
