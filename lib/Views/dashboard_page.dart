import 'package:admin_app/Routes/routes.dart';
import 'package:admin_app/View_Models/ambulance_management.dart';
import 'package:admin_app/View_Models/paramedic_management.dart';
import 'package:admin_app/View_Models/ticket_management.dart';
import 'package:admin_app/View_Models/user_management.dart';
import 'package:admin_app/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(right: 6, left: 6, top: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text('Welcome Back Admin!'),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 140,
                    width: MediaQuery.of(context).size.width / 6,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      color: AppConstants().appDarkWhite,
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FutureBuilder(
                            future: context.read<UserManager>().getAllUsers(),
                            builder: (context, snapshot) {
                              return snapshot.hasData
                                  ? Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Total users',
                                          style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                              color: Color.fromARGB(
                                                  255, 129, 129, 129)),
                                        ),
                                        SizedBox(
                                          height: 30,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              '${snapshot.data!.length}',
                                              style: GoogleFonts.paytoneOne(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16,
                                                  color: Color.fromARGB(
                                                      255, 36, 35, 35)),
                                            ),
                                            SizedBox(
                                              width: 50,
                                            ),
                                            Icon(
                                              Icons.person_pin,
                                              size: 50,
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                  : Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        CircularProgressIndicator(),
                                      ],
                                    );
                            },
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 140,
                    width: MediaQuery.of(context).size.width / 6,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      color: AppConstants().appDarkWhite,
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FutureBuilder(
                            future: context
                                .read<ParamedicManager>()
                                .getAllParamedics(),
                            builder: (context, snapshot) {
                              return snapshot.hasData
                                  ? Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Total paramedics',
                                          style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                              color: Color.fromARGB(
                                                  255, 129, 129, 129)),
                                        ),
                                        SizedBox(
                                          height: 30,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              '${snapshot.data!.length}',
                                              style: GoogleFonts.paytoneOne(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16,
                                                  color: Color.fromARGB(
                                                      255, 36, 35, 35)),
                                            ),
                                            SizedBox(
                                              width: 50,
                                            ),
                                            Icon(
                                              Icons.person_pin,
                                              size: 50,
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                  : Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        CircularProgressIndicator(),
                                      ],
                                    );
                            },
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 140,
                    width: MediaQuery.of(context).size.width / 6,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      color: AppConstants().appDarkWhite,
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FutureBuilder(
                            builder: (context, snapshot) {
                              return snapshot.hasData
                                  ? Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Total Ambulances',
                                          style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                              color: Color.fromARGB(
                                                  255, 129, 129, 129)),
                                        ),
                                        SizedBox(
                                          height: 30,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              '${snapshot.data!.length}',
                                              style: GoogleFonts.paytoneOne(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16,
                                                  color: Color.fromARGB(
                                                      255, 36, 35, 35)),
                                            ),
                                            SizedBox(
                                              width: 50,
                                            ),
                                            Icon(
                                              Icons.person_pin,
                                              size: 50,
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                  : Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        CircularProgressIndicator(),
                                      ],
                                    );
                            },
                            future: context
                                .read<AmbulanceManager>()
                                .getAllAmbulances(),
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 140,
                    width: MediaQuery.of(context).size.width / 6,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      color: AppConstants().appDarkWhite,
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FutureBuilder(
                            future:
                                context.read<TicketManager>().getAllTickets(),
                            builder: (context, snapshot) {
                              return snapshot.hasData
                                  ? Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Total tickets',
                                          style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                              color: Color.fromARGB(
                                                  255, 129, 129, 129)),
                                        ),
                                        SizedBox(
                                          height: 30,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              '${snapshot.data!.length}',
                                              style: GoogleFonts.paytoneOne(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16,
                                                  color: Color.fromARGB(
                                                      255, 36, 35, 35)),
                                            ),
                                            SizedBox(
                                              width: 50,
                                            ),
                                            Icon(
                                              Icons.person_pin,
                                              size: 50,
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                  : Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        CircularProgressIndicator(),
                                      ],
                                    );
                            },
                          )),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: 300,
                    width: MediaQuery.of(context).size.width / 2.6,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      color: AppConstants().appDarkWhite,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FutureBuilder(
                          future: null,
                          builder: (context, snapshot) {
                            return ListView(
                              children: [
                                Text(
                                  'Ambulance Stats',
                                  style: GoogleFonts.paytoneOne(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Color.fromARGB(255, 36, 35, 35)),
                                ),
                                ListTile(
                                  leading: CircleAvatar(
                                    radius: 14,
                                    backgroundColor: Colors.green,
                                  ),
                                  title: Text(
                                    'Available',
                                    style: GoogleFonts.concertOne(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                        color: Color.fromARGB(255, 75, 75, 75)),
                                  ),
                                  trailing: Text(
                                    '${context.read<AmbulanceManager>().availableAmbulances.length}',
                                    style: GoogleFonts.concertOne(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                        color: Color.fromARGB(255, 75, 75, 75)),
                                  ),
                                ),
                                Divider(),
                                ListTile(
                                  leading: CircleAvatar(
                                    radius: 14,
                                    backgroundColor:
                                        Color.fromARGB(255, 255, 0, 0),
                                  ),
                                  title: Text(
                                    'Unvailable',
                                    style: GoogleFonts.concertOne(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                        color: Color.fromARGB(255, 75, 75, 75)),
                                  ),
                                  trailing: Text(
                                    '${context.read<AmbulanceManager>().unAvailableAmbulances.length}',
                                    style: GoogleFonts.concertOne(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                        color: Color.fromARGB(255, 75, 75, 75)),
                                  ),
                                ),
                                Divider(),
                                ListTile(
                                  leading: CircleAvatar(
                                    radius: 14,
                                    backgroundColor:
                                        Color.fromARGB(255, 255, 168, 54),
                                  ),
                                  title: Text(
                                    'On Dispatch',
                                    style: GoogleFonts.concertOne(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                        color: Color.fromARGB(255, 75, 75, 75)),
                                  ),
                                  trailing: Text(
                                    '${context.read<AmbulanceManager>().busyAmbulances.length}',
                                    style: GoogleFonts.concertOne(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                        color: Color.fromARGB(255, 75, 75, 75)),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 300,
                    width: MediaQuery.of(context).size.width / 2.6,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      color: AppConstants().appDarkWhite,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListView(
                          children: [
                            Text(
                              'Tickets Stats',
                              style: GoogleFonts.paytoneOne(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 36, 35, 35)),
                            ),
                            ListTile(
                              subtitle: TextButton(
                                onPressed: () async {
                                  Navigator.of(context).pushNamed(
                                      AppRouteManager.adminTicketsPage);
                                },
                                child: Text('Manage Tickets'),
                              ),
                              leading: CircleAvatar(
                                radius: 14,
                                backgroundColor: Colors.green,
                              ),
                              title: Text(
                                'Open',
                                style: GoogleFonts.concertOne(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: Color.fromARGB(255, 75, 75, 75)),
                              ),
                              trailing: Text(
                                '${context.read<TicketManager>().openTickets.length}',
                                style: GoogleFonts.concertOne(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: Color.fromARGB(255, 75, 75, 75)),
                              ),
                            ),
                            Divider(),
                            ListTile(
                              leading: CircleAvatar(
                                radius: 14,
                                backgroundColor:
                                    Color.fromARGB(255, 255, 168, 54),
                              ),
                              title: Text(
                                'Pending',
                                style: GoogleFonts.concertOne(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: Color.fromARGB(255, 75, 75, 75)),
                              ),
                              trailing: Text(
                                '${context.read<TicketManager>().pendingTickets.length}',
                                style: GoogleFonts.concertOne(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: Color.fromARGB(255, 75, 75, 75)),
                              ),
                            ),
                            Divider(),
                            ListTile(
                              leading: CircleAvatar(
                                radius: 14,
                                backgroundColor: Color.fromARGB(255, 255, 0, 0),
                              ),
                              title: Text(
                                'Closed',
                                style: GoogleFonts.concertOne(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: Color.fromARGB(255, 75, 75, 75)),
                              ),
                              trailing: Text(
                                '${context.read<TicketManager>().closedTickets.length}',
                                style: GoogleFonts.concertOne(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: Color.fromARGB(255, 75, 75, 75)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
