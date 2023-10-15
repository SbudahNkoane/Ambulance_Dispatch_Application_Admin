import 'package:admin_app/Models/ticket.dart';
import 'package:admin_app/View_Models/ticket_management.dart';
import 'package:admin_app/View_Models/user_management.dart';
import 'package:admin_app/Views/users_table.dart';
import 'package:admin_app/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:provider/provider.dart';

class PendingTicketsPage extends StatefulWidget {
  const PendingTicketsPage({super.key});

  @override
  State<PendingTicketsPage> createState() => _PendingTicketsPageState();
}

class _PendingTicketsPageState extends State<PendingTicketsPage> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Selector<TicketManager, List<Ticket>>(
          selector: (p0, p1) => p1.openTickets,
          builder: (context, value, child) {
            return Padding(
              padding: EdgeInsets.only(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                //  crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  //  const Text('Users'),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text('Users'),
                  Selector<TicketManager, List<Ticket>>(
                    selector: (p0, p1) => p1.closedTickets,
                    builder: (context, value, child) {
                      return Container(
                        color: Colors.amber,
                        height: MediaQuery.of(context).size.height / 1.2,
                        child: ListView.builder(
                          itemCount: value.length,
                          itemBuilder: (context, index) {
                            return Card(
                              child: ListTile(
                                title: Text(value[index].description),
                                subtitle: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                            'Requested at: ${value[index].bookedAt.year}-${value[index].bookedAt.month}-${value[index].bookedAt.day}'),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                            'Time: ${value[index].bookedAt.hour}h-${value[index].bookedAt.minute}m-${value[index].bookedAt.second}s'),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                            'Time: ${value[index].pickUpLocation}'),
                                      ],
                                    ),
                                    Text('${value[index].bookedAt.hour} '),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  )
                  // AppTable(
                  //   future: ,
                  // ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
