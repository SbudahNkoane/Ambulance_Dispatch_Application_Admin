import 'package:admin_app/Models/user.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppConstants {
  String logoWithBlueBackground = "assets/images/logo_blue_background.png";
  String logoWithWhiteBackground = "assets/images/logo.png";

  Color appDarkBlue = const Color(0xFF005DF4);
  Color appBlack = const Color.fromARGB(255, 26, 26, 26);
  Color applightBlue = const Color.fromARGB(255, 93, 155, 255);
  Color appRed = const Color(0xFFE40101);
  Color appGreen = const Color(0xFF00E03F);
  Color appYellow = const Color(0xFFC1B900);
  Color appWhite = const Color(0xFFFFFFFF);
  Color appDarkWhite = const Color(0xFFF5F5F5);
  Color appGrey = const Color(0xFFEAEAEA);
}

class AppTable extends StatelessWidget {
  const AppTable({super.key, required this.snapshot});
  final AsyncSnapshot<List<User>> snapshot;

  @override
  Widget build(BuildContext context) {
    print(snapshot.connectionState);
    return snapshot.hasData
        ? Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width < 1300
                    ? MediaQuery.of(context).size.width - 100
                    : MediaQuery.of(context).size.width - 330,
                padding: EdgeInsets.only(bottom: 12),
                decoration: BoxDecoration(
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
                    TableRow(decoration: BoxDecoration(), children: [
                      Container(
                        padding: EdgeInsets.all(18),
                        child: Text(
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
                        padding: EdgeInsets.all(18),
                        child: Text(
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
                        padding: EdgeInsets.all(18),
                        child: Text(
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
                        padding: EdgeInsets.all(18),
                        child: Text(
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
                        padding: EdgeInsets.all(18),
                        child: Text(
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
                        padding: EdgeInsets.all(18),
                        child: Text(
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
                        padding: EdgeInsets.all(18),
                        child: Text(
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
                          decoration: BoxDecoration(
                            border: Border(
                              bottom:
                                  BorderSide(width: 0.5, color: Colors.grey),
                            ),
                          ),
                          children: [
                            Container(
                              padding: EdgeInsets.all(18),
                              child: Text(
                                (index + 1).toString(),
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontFamily: 'Raleway',
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 20, left: 10),
                              child: Text(
                                snapshot.data![index].names,
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontFamily: 'HelveticaNeue',
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 20, left: 10),
                              child: Text(
                                snapshot.data![index].surname,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontFamily: 'Raleway',
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 20, left: 10),
                              child: Text(
                                snapshot.data![index].idNumber,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontFamily: 'HelveticaNeue',
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 20, left: 10),
                              child: Text(
                                "0${snapshot.data![index].cellphoneNumber}",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontFamily: 'Raleway',
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 20, left: 10),
                              child: Text(
                                snapshot.data![index].emailaddress,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontFamily: 'HelveticaNeue',
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(15),
                              child: Center(
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    minimumSize: Size(100, 40),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    backgroundColor: snapshot
                                                .data![index].accountStatus ==
                                            'Unverified'
                                        ? const Color.fromARGB(90, 255, 193, 7)
                                        : Color.fromARGB(90, 7, 255, 81),
                                  ),
                                  onPressed: () {},
                                  child: Text(
                                    snapshot.data![index].accountStatus,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                      fontFamily: 'HelveticaNeue',
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ]);
                    }),
                  ),
                ),
              )
            ],
          )
        : Center(child: CircularProgressIndicator());
  }
}

class AppBlueButton extends StatefulWidget {
  const AppBlueButton({super.key, required this.onPressed, required this.text});
  final void Function() onPressed;
  final String text;

  @override
  State<AppBlueButton> createState() => _AppBlueButtonState();
}

class _AppBlueButtonState extends State<AppBlueButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: ElevatedButton(
        onPressed: widget.onPressed,
        style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          fixedSize: const Size(350, 50),
          foregroundColor: AppConstants().appWhite,
          backgroundColor: AppConstants().appDarkBlue,
        ),
        child: Text(
          widget.text,
          style: const TextStyle(
              letterSpacing: 1, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class AppTextField extends StatefulWidget {
  const AppTextField({
    super.key,
    required this.labelText,
    required this.prefixIcon,
    this.maxCharacters,
    this.counter,
    required this.keyboardType,
    this.hideText = false,
    required this.controller,
    this.suffixIcon,
    required this.validator,
  });
  final String labelText;

  final IconData prefixIcon;
  final IconData? suffixIcon;
  final int? counter;
  final int? maxCharacters;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool hideText;
  final String? Function(String? text)? validator;
  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: TextFormField(
        keyboardType: widget.keyboardType,
        style: const TextStyle(fontSize: 12),
        textAlign: TextAlign.left,
        textAlignVertical: TextAlignVertical.center,
        cursorColor: const Color.fromARGB(255, 0, 0, 0),
        cursorHeight: 26,
        obscureText: widget.hideText,
        controller: widget.controller,
        maxLength: widget.maxCharacters,
        decoration: InputDecoration(
          label: Text(widget.labelText),
          labelStyle: GoogleFonts.orelegaOne(),
          fillColor: AppConstants().appGrey,
          filled: true,
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(
              width: 1,
              color: Color.fromARGB(255, 59, 59, 59),
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(
              width: 1,
              color: Color.fromARGB(255, 59, 59, 59),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(
              width: 1,
              color: Color.fromARGB(255, 59, 59, 59),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(
              width: 2,
              color: AppConstants().appDarkBlue,
            ),
          ),
          counter: widget.maxCharacters != null
              ? Text("${widget.counter}/${widget.maxCharacters}")
              : const SizedBox(),
          prefixIcon: Icon(
            widget.prefixIcon,
            size: 18,
          ),
          suffixIcon: widget.suffixIcon == null
              ? const SizedBox()
              : IconButton(
                  onPressed: () {},
                  icon: Icon(
                    widget.suffixIcon,
                    size: 18,
                  ),
                ),
        ),
        validator: widget.validator,
      ),
    );
  }
}
