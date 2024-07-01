import 'package:admin_app/Models/ambulance.dart';
import 'package:admin_app/Routes/routes.dart';
import 'package:admin_app/View_Models/ambulance_management.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
                height: MediaQuery.of(context).size.height / 1.5,
                child: Selector<AmbulanceManager, List<Ambulance>>(
                  selector: (p0, p1) => p1.allAmbulance,
                  builder: (context, ambulances, child) {
                    return ListView.builder(
                      itemCount: ambulances.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            title: Text(
                                'Ambulance plate: ${ambulances[index].numberPlate}'),
                            subtitle: Column(
                              children: [
                                Text('Status: ${ambulances[index].status}'),
                                Row(
                                  children: [
                                    const Icon(Icons.person_pin),
                                    Text(
                                        "${ambulances[index].paramedics.length}")
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                )),
          ],
        ),
      ),
    );
  }
}
