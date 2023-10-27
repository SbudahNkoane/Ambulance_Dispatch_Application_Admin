import 'package:admin_app/View_Models/user_management.dart';
import 'package:admin_app/Views/users_table.dart';
import 'package:admin_app/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  int index = 0;
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
            const Text('Users'),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 100,
                  width: 200,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        index = 0;
                      });
                    },
                    child: Card(
                      elevation: index == 0 ? 10 : 0,
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
                                  ? Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        CircleAvatar(),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text('${snapshot.data!.length}'),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text('Total users'),
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
                ),
                SizedBox(
                  height: 100,
                  width: 200,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        index = 1;
                      });
                    },
                    child: Card(
                      elevation: index == 1 ? 10 : 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      color: AppConstants().appDarkWhite,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FutureBuilder(
                          future:
                              context.read<UserManager>().getUnverifiedUsers(),
                          builder: (context, snapshot) {
                            return snapshot.hasData
                                ? Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CircleAvatar(),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('${snapshot.data!.length}'),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text('Unverified users'),
                                        ],
                                      ),
                                    ],
                                  )
                                : Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CircularProgressIndicator(),
                                    ],
                                  );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 100,
                  width: 200,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        index = 2;
                      });
                    },
                    child: Card(
                      elevation: index == 2 ? 10 : 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      color: AppConstants().appDarkWhite,
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FutureBuilder(
                            future:
                                context.read<UserManager>().getVerifiedUsers(),
                            builder: (context, snapshot) {
                              return snapshot.hasData
                                  ? Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        CircleAvatar(),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text('${snapshot.data!.length}'),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text('Verified users'),
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
                ),
              ],
            ),
            SizedBox(
              height: 23,
            ),
            FutureBuilder(
              future: index == 0
                  ? context.read<UserManager>().getAllUsers()
                  : index == 1
                      ? context.read<UserManager>().getUnverifiedUsers()
                      : index == 2
                          ? context.read<UserManager>().getVerifiedUsers()
                          : context.read<UserManager>().getAllUsers(),
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
