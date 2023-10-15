import 'package:admin_app/View_Models/user_management.dart';
import 'package:admin_app/Views/users_table.dart';
import 'package:admin_app/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ParamedicsScreen extends StatefulWidget {
  const ParamedicsScreen({super.key});

  @override
  State<ParamedicsScreen> createState() => _ParamedicsScreenState();
}

class _ParamedicsScreenState extends State<ParamedicsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text('Paramedics'),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 100,
                  width: 200,
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
                            return const Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircleAvatar(),
                                SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('500'),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text('Total Paramedics'),
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
            FutureBuilder(
              future: context.read<UserManager>().getAllUsers(),
              builder: (context, snapshot) {
                return UsersTable(
                  snapshot: snapshot,
                );
              },
            )
            // AppTable(
            //   future: ,
            // ),
          ],
        ),
      ),
    );
  }
}
