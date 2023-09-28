import 'package:admin_app/app_constants.dart';
import 'package:flutter/material.dart';

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
                    width: 200,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      color: AppConstants().appDarkWhite,
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FutureBuilder(
                            builder: (context, snapshot) {
                              return const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Total users'),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('500'),
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
                              );
                            },
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 140,
                    width: 200,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      color: AppConstants().appDarkWhite,
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FutureBuilder(
                            builder: (context, snapshot) {
                              return const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Total paramedics'),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('500'),
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
                              );
                            },
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 140,
                    width: 200,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      color: AppConstants().appDarkWhite,
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FutureBuilder(
                            builder: (context, snapshot) {
                              return const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Total Ambulances'),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('500'),
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
                              );
                            },
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 140,
                    width: 200,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      color: AppConstants().appDarkWhite,
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FutureBuilder(
                            builder: (context, snapshot) {
                              return const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Total tickets'),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('500'),
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
                    width: 450,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      color: AppConstants().appDarkWhite,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FutureBuilder(
                          builder: (context, snapshot) {
                            return ListView(
                              children: const [
                                Text('Ambulance Stats'),
                                ListTile(
                                  leading: CircleAvatar(
                                    radius: 14,
                                    backgroundColor: Colors.green,
                                  ),
                                  title: Text('Available'),
                                  trailing: Text('20'),
                                ),
                                Divider(),
                                ListTile(
                                  leading: CircleAvatar(
                                    radius: 14,
                                    backgroundColor:
                                        Color.fromARGB(255, 255, 0, 0),
                                  ),
                                  title: Text('Unvailable'),
                                  trailing: Text('60'),
                                ),
                                Divider(),
                                ListTile(
                                  leading: CircleAvatar(
                                    radius: 14,
                                    backgroundColor:
                                        Color.fromARGB(255, 255, 168, 54),
                                  ),
                                  title: Text('On Dispatch'),
                                  trailing: Text('50'),
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
                    width: 450,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      color: AppConstants().appDarkWhite,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FutureBuilder(
                          builder: (context, snapshot) {
                            return ListView(
                              children: const [
                                Text('User Stats'),
                                ListTile(
                                  leading: CircleAvatar(
                                    radius: 14,
                                    backgroundColor: Colors.green,
                                  ),
                                  title: Text('Verified'),
                                  trailing: Text('20'),
                                ),
                                Divider(),
                                ListTile(
                                  leading: CircleAvatar(
                                    radius: 14,
                                    backgroundColor:
                                        Color.fromARGB(255, 255, 168, 54),
                                  ),
                                  title: Text('Unverified'),
                                  trailing: Text('45'),
                                ),
                                Divider(),
                                ListTile(
                                  leading: CircleAvatar(
                                    radius: 14,
                                    backgroundColor:
                                        Color.fromARGB(255, 255, 0, 0),
                                  ),
                                  title: Text('Disabled'),
                                  trailing: Text('33'),
                                ),
                              ],
                            );
                          },
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
