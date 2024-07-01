import 'package:admin_app/Models/ambulance.dart';
import 'package:admin_app/View_Models/admin_management.dart';
import 'package:admin_app/View_Models/ambulance_management.dart';
import 'package:admin_app/View_Models/ticket_management.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AssignAmbulancePage extends StatefulWidget {
  final List<Ambulance> ambulances;
  const AssignAmbulancePage({super.key, required this.ambulances});

  @override
  State<AssignAmbulancePage> createState() => _AssignAmbulancePageState();
}

class _AssignAmbulancePageState extends State<AssignAmbulancePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
            'TicketID: ${context.read<TicketManager>().openTickets[context.read<TicketManager>().clickedTicket].ticketId}'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        height: MediaQuery.of(context).size.height / 3,
        child: Center(
            child: Selector<AmbulanceManager, List<Ambulance>>(
          selector: (p0, p1) => p1.availableAmbulances,
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
                            Text("${ambulances[index].paramedics.length}")
                          ],
                        )
                      ],
                    ),
                    trailing: ElevatedButton(
                      onPressed: () {
                        context.read<TicketManager>().dispatchAmbulance(
                            context
                                .read<TicketManager>()
                                .openTickets[
                                    context.read<TicketManager>().clickedTicket]
                                .ticketId!,
                            ambulances[index],
                            context.read<AdminManager>().adminData.userId!);
                        // context.read<TicketManager>().getopenTickets();
                        Navigator.of(context).pop();
                        setState(() {});
                      },
                      child: const Text('Assign now'),
                    ),
                  ),
                );
              },
            );
          },
        )),
      ),
    );
  }
}
