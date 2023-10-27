import 'package:admin_app/Models/ambulance.dart';
import 'package:admin_app/View_Models/admin_management.dart';
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
                  trailing: ElevatedButton(
                    onPressed: () {
                      context.read<TicketManager>().dispatchAmbulance(
                          context
                              .read<TicketManager>()
                              .openTickets[
                                  context.read<TicketManager>().clickedTicket]
                              .ticketId!,
                          widget.ambulances[index],
                          context.read<AdminManager>().adminData.userId!);
                      // context.read<TicketManager>().getopenTickets();
                      Navigator.of(context).pop();
                      setState(() {});
                    },
                    child: Text('Assign now'),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
