// ignore_for_file: use_build_context_synchronously

import 'package:admin_app/Models/ticket.dart';
import 'package:admin_app/Routes/routes.dart';
import 'package:admin_app/View_Models/ambulance_management.dart';
import 'package:admin_app/View_Models/ticket_management.dart';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class PendingTicketsPage extends StatefulWidget {
  final List<Ticket> tickets;
  const PendingTicketsPage({super.key, required this.tickets});

  @override
  State<PendingTicketsPage> createState() => _PendingTicketsPageState();
}

class _PendingTicketsPageState extends State<PendingTicketsPage> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pending tickets'),
      ),
      body: SafeArea(
          child: StreamBuilder(
        stream: context.read<TicketManager>().ticketsStreamer(),
        builder: (context, snapshot) {
          return Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              // mainAxisAlignment: MainAxisAlignment.center,
              //  crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Selector<TicketManager, List<Ticket>>(
                  selector: (p0, p1) => p1.openTickets,
                  builder: (context, value, child) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height / 1.3,
                      child: value.isNotEmpty
                          ? ListView.builder(
                              itemCount: value.length,
                              itemBuilder: (context, index) {
                                return Card(
                                  child: ListTile(
                                    title: Text(value[index].status),
                                    subtitle: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        const SizedBox(
                                          height: 12,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                                'Requested at: ${value[index].bookedAt.year}-${value[index].bookedAt.month}-${value[index].bookedAt.day}'),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 12,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                                'Time: ${value[index].bookedAt.hour}h:${value[index].bookedAt.minute}m:${value[index].bookedAt.second}s'),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 12,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                                'Patient Condition: ${value[index].description}'),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 12,
                                        ),
                                        ElevatedButton(
                                          onPressed: () async {
                                            context
                                                .read<TicketManager>()
                                                .setTicketIndex(index);
                                            await context
                                                .read<AmbulanceManager>()
                                                .getAvailableAmbulances();
                                            Navigator.of(context).pushNamed(
                                                AppRouteManager
                                                    .assignAmbulancePage);
                                          },
                                          child:
                                              const Text('Dispatch Ambulance'),
                                        ),
                                        const SizedBox(
                                          height: 12,
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            )
                          : const Center(
                              child: Text('No pending Tickets...'),
                            ),
                    );
                  },
                )
              ],
            ),
          );
        },
      )),
    );
  }
}
