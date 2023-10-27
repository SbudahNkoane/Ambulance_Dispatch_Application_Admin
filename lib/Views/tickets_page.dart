import 'package:admin_app/Models/ticket.dart';
import 'package:admin_app/Routes/routes.dart';
import 'package:admin_app/View_Models/ticket_management.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TicketsScreen extends StatefulWidget {
  final List<Ticket> tickets;
  const TicketsScreen({super.key, required this.tickets});

  @override
  State<TicketsScreen> createState() => _TicketsScreenState();
}

class _TicketsScreenState extends State<TicketsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: StreamBuilder(
      stream: context.read<TicketManager>().ticketsStreamer(),
      builder: (context, snapshot) {
        return Padding(
          padding: EdgeInsets.only(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text('Tickets'),
              Selector<TicketManager, List<Ticket>>(
                selector: (p0, p1) => widget.tickets,
                builder: (context, value, child) {
                  return Container(
                    height: MediaQuery.of(context).size.height / 1.2,
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
                                      SizedBox(
                                        height: 12,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                              'Requested at: ${value[index].bookedAt.year}-${value[index].bookedAt.month}-${value[index].bookedAt.day}'),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 12,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                              'Time: ${value[index].bookedAt.hour}h:${value[index].bookedAt.minute}m:${value[index].bookedAt.second}s'),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 12,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                              'Patient Condition: ${value[index].description}'),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 12,
                                      ),
                                      value[index].status ==
                                              'Searching for an Ambulance'
                                          ? ElevatedButton(
                                              onPressed: () {
                                                context
                                                    .read<TicketManager>()
                                                    .setTicketIndex(index);
                                                Navigator.of(context).pushNamed(
                                                    AppRouteManager
                                                        .assignAmbulancePage);
                                              },
                                              child: Text('Dispatch Ambulance'),
                                            )
                                          : Text(''),
                                      SizedBox(
                                        height: 12,
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          )
                        : Center(
                            child: Text('No Tickets Logged yet...'),
                          ),
                  );
                },
              ),
            ],
          ),
        );
      },
    ));
  }
}
