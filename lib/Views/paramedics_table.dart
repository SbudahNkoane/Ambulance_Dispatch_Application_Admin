import 'package:admin_app/Models/paramedic.dart';

import 'package:flutter/material.dart';

class ParamedicsTable extends StatelessWidget {
  const ParamedicsTable({super.key, required this.snapshot});
  final AsyncSnapshot<List<Paramedic>> snapshot;

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
