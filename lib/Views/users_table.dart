import 'package:admin_app/Models/user.dart';
import 'package:admin_app/Routes/routes.dart';
import 'package:admin_app/View_Models/user_management.dart';
import 'package:admin_app/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UsersTable extends StatelessWidget {
  const UsersTable({super.key, required this.snapshot});
  final AsyncSnapshot<List<User>> snapshot;

  @override
  Widget build(BuildContext context) {
    return snapshot.hasData
        ? Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width < 1300
                    ? MediaQuery.of(context).size.width - 100
                    : MediaQuery.of(context).size.width - 330,
                padding: const EdgeInsets.only(bottom: 12),
                decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(width: 1, color: Colors.grey))),
                child: Table(
                  // border: TableBorder.all(
                  //     color: Colors.black,
                  //     style: BorderStyle.solid,
                  //     width: 2),
                  columnWidths: {
                    0: FixedColumnWidth(
                        (MediaQuery.of(context).size.width / 150)),
                    1: FixedColumnWidth(
                        (MediaQuery.of(context).size.width / 12)),
                    2: FixedColumnWidth(
                        (MediaQuery.of(context).size.width / 15)),
                    3: FixedColumnWidth(
                        (MediaQuery.of(context).size.width / 15)),
                    4: FixedColumnWidth(
                        (MediaQuery.of(context).size.width / 18)),
                    5: FixedColumnWidth(
                        (MediaQuery.of(context).size.width / 8)),
                    6: FixedColumnWidth(
                        (MediaQuery.of(context).size.width / 15)),
                  },
                  children: [
                    TableRow(decoration: const BoxDecoration(), children: [
                      Container(
                        padding: const EdgeInsets.all(18),
                        child: const Text(
                          "No.",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'HelveticaNeue',
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(18),
                        child: const Text(
                          "Names",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'HelveticaNeue',
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(18),
                        child: const Text(
                          "Surname",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'HelveticaNeue',
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(18),
                        child: const Text(
                          "ID Number",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'HelveticaNeue',
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(18),
                        child: const Text(
                          "Mobile Number",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'HelveticaNeue',
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(18),
                        child: const Text(
                          "Email Address",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'HelveticaNeue',
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(18),
                        child: const Text(
                          "Account Status",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'HelveticaNeue',
                          ),
                        ),
                      ),
                    ]),
                  ],
                ),
              ),
              Container(
                height: 300,
                width: MediaQuery.of(context).size.width < 1300
                    ? MediaQuery.of(context).size.width - 100
                    : MediaQuery.of(context).size.width - 330,
                child: SingleChildScrollView(
                  child: Table(
                    // border: TableBorder.all(
                    //     color: Colors.black,
                    //     style: BorderStyle.solid,
                    //     width: 2),
                    columnWidths: <int, TableColumnWidth>{
                      0: FixedColumnWidth(
                          (MediaQuery.of(context).size.width / 150)),
                      1: FixedColumnWidth(
                          (MediaQuery.of(context).size.width / 12)),
                      2: FixedColumnWidth(
                          (MediaQuery.of(context).size.width / 15)),
                      3: FixedColumnWidth(
                          (MediaQuery.of(context).size.width / 15)),
                      4: FixedColumnWidth(
                          (MediaQuery.of(context).size.width / 18)),
                      5: FixedColumnWidth(
                          (MediaQuery.of(context).size.width / 8)),
                      6: FixedColumnWidth(
                          (MediaQuery.of(context).size.width / 15)),
                    },
                    children:
                        List<TableRow>.generate(snapshot.data!.length, (index) {
                      return TableRow(
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom:
                                  BorderSide(width: 0.5, color: Colors.grey),
                            ),
                          ),
                          children: [
                            Container(
                              padding: const EdgeInsets.all(18),
                              child: Text(
                                (index + 1).toString(),
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontFamily: 'Raleway',
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(top: 20, left: 10),
                              child: Row(
                                children: [
                                  Text(
                                    snapshot.data![index].names,
                                    style: const TextStyle(
                                      decoration: TextDecoration.underline,
                                      fontSize: 14,
                                      color: Colors.black,
                                      fontFamily: 'HelveticaNeue',
                                    ),
                                  ),
                                  snapshot.data![index].accountStatus ==
                                          'Verified'
                                      ? Icon(
                                          Icons.verified,
                                          color: AppConstants().appGreen,
                                          size: 10,
                                        )
                                      : const SizedBox(),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(top: 20, left: 10),
                              child: Text(
                                snapshot.data![index].surname,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontFamily: 'Raleway',
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(top: 20, left: 10),
                              child: Text(
                                snapshot.data![index].idNumber,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontFamily: 'HelveticaNeue',
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(top: 20, left: 10),
                              child: Text(
                                "0${snapshot.data![index].cellphoneNumber}",
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontFamily: 'Raleway',
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(top: 20, left: 10),
                              child: Text(
                                snapshot.data![index].emailaddress,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontFamily: 'HelveticaNeue',
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(15),
                              child: Center(
                                child: snapshot.data![index].accountStatus ==
                                        'Not Verified'
                                    ? TextButton(
                                        style: TextButton.styleFrom(
                                          minimumSize: const Size(100, 40),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          backgroundColor: const Color.fromARGB(
                                              90, 255, 193, 7),
                                        ),
                                        onPressed: () {
                                          context
                                              .read<UserManager>()
                                              .viewUser(index);
                                          Navigator.pushNamed(
                                              context,
                                              AppRouteManager
                                                  .adminUserVerificationPage);
                                        },
                                        child: const Text(
                                          'Verify',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.black,
                                            fontFamily: 'HelveticaNeue',
                                          ),
                                        ),
                                      )
                                    : TextButton(
                                        style: TextButton.styleFrom(
                                          minimumSize: const Size(100, 40),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          backgroundColor:
                                              AppConstants().appGreen,
                                        ),
                                        onPressed: () {
                                          context
                                              .read<UserManager>()
                                              .viewUser(index);
                                          Navigator.pushNamed(
                                              context,
                                              AppRouteManager
                                                  .adminUserVerificationPage);
                                        },
                                        child: Text(
                                          'Verified',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: AppConstants().appDarkWhite,
                                            fontFamily: 'HelveticaNeue',
                                          ),
                                        ),
                                      ),
                                //const Text('Verified'),
                              ),
                            )
                          ]);
                    }),
                  ),
                ),
              )
            ],
          )
        : const Center(child: CircularProgressIndicator());
  }
}
