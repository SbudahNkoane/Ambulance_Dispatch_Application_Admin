import 'package:admin_app/View_Models/user_management.dart';
import 'package:admin_app/Views/app_progress_indicator.dart';
import 'package:admin_app/Views/users_table.dart';
import 'package:admin_app/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

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
        padding: const EdgeInsets.only(),
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
                                        Image.asset(
                                          'assets/images/users.png',
                                          height: 40,
                                          width: 40,
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text('${snapshot.data!.length}'),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            const Text('Total users'),
                                          ],
                                        ),
                                      ],
                                    )
                                  : const Column(
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
                                      Image.asset(
                                        'assets/images/unverified.png',
                                        height: 40,
                                        width: 40,
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('${snapshot.data!.length}'),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          const Text('Unverified users'),
                                        ],
                                      ),
                                    ],
                                  )
                                : const Column(
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
                                        Image.asset(
                                          'assets/images/V_users.png',
                                          height: 40,
                                          width: 40,
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text('${snapshot.data!.length}'),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            const Text('Verified users'),
                                          ],
                                        ),
                                      ],
                                    )
                                  : const Column(
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
            const SizedBox(
              height: 20,
            ),
            Stack(
              children: [
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
                ),
                Selector<UserManager, Tuple2>(
                  selector: (context, value) =>
                      Tuple2(value.showProgress, value.userProgressText),
                  builder: (context, value, child) {
                    return value.item1
                        ? AppProgressIndicator(text: "${value.item2}")
                        : Container();
                  },
                ),
              ],
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
