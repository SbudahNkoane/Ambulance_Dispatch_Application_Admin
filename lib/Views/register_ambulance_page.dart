// ignore_for_file: use_build_context_synchronously

import 'package:admin_app/Models/ambulance.dart';
import 'package:admin_app/View_Models/admin_management.dart';
import 'package:admin_app/View_Models/ambulance_management.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RegisterAmbulance extends StatefulWidget {
  const RegisterAmbulance({super.key});

  @override
  State<RegisterAmbulance> createState() => _RegisterAmbulanceState();
}

class _RegisterAmbulanceState extends State<RegisterAmbulance> {
  final GlobalKey<FormState> _registerFormKey = GlobalKey<FormState>();
  final TextEditingController _numberPlateController = TextEditingController();

  @override
  void dispose() {
    _numberPlateController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Form(
        key: _registerFormKey,
        child: Padding(
          padding: EdgeInsets.only(
            top: 200,
            left: MediaQuery.of(context).size.width / 3,
            right: MediaQuery.of(context).size.width / 3,
          ),
          child: ListView(
            children: [
              Title(
                color: Colors.black,
                child: Text(
                  'Ambulance Registration',
                  style: GoogleFonts.moul(fontSize: 30),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text('Number Plate'),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _numberPlateController,
                validator: (value) {
                  if (value == null || value == '') {
                    return 'Please enter a valid Number Plate';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: const BorderSide(
                      width: 1,
                      color: Color.fromARGB(255, 255, 0, 0),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: const BorderSide(
                      width: 1,
                      color: Color.fromARGB(255, 59, 59, 59),
                    ),
                  ),
                  hintText: 'Enter Number Plate',
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              OutlinedButton(
                onPressed: () async {
                  if (_registerFormKey.currentState!.validate()) {
                    Ambulance newAmbulance = Ambulance(
                      status: "Unoccupied",
                      paramedics: [],
                      ambulanceId: null,
                      numberPlate: _numberPlateController.text,
                      managedBy: context.read<AdminManager>().adminData.userId,
                      realTimeLocation: const GeoPoint(
                        -29.12,
                        26.20,
                      ),
                    );

                    final result = await context
                        .read<AmbulanceManager>()
                        .registerAmbulance(newAmbulance);
                    if (result == 'OK') {
                      Navigator.of(context).pop();
                    }
                  }
                },
                child: const Text(
                  'Register Ambulance',
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
