// ignore_for_file: use_build_context_synchronously

import 'package:admin_app/Routes/routes.dart';
import 'package:admin_app/View_Models/admin_management.dart';
import 'package:admin_app/View_Models/ambulance_management.dart';
import 'package:admin_app/View_Models/paramedic_management.dart';
import 'package:admin_app/View_Models/ticket_management.dart';
import 'package:admin_app/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InitApp {
  static initializeApp(BuildContext context) async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    FirebaseAuth.instance.authStateChanges().listen((user) async {
      if (context.mounted == true) {
        if (user == null) {
          Navigator.of(context).popAndPushNamed(AppRouteManager.loginPage);
        } else {
          await context.read<AdminManager>().getCurrentAdminData(user.uid);
          await context.read<AmbulanceManager>().getAllAmbulances();
          await context.read<AmbulanceManager>().getAvailableAmbulances();
          await context.read<AmbulanceManager>().getBusyAmbulances();
          await context.read<AmbulanceManager>().getUnAvailableAmbulances();
          await context.read<TicketManager>().getclosedTickets();
          await context.read<TicketManager>().getopenTickets();
          await context.read<TicketManager>().getpendingTickets();
          await context.read<ParamedicManager>().getAllParamedics();
          Navigator.of(context).popAndPushNamed(AppRouteManager.adminHomePage);
        }
      }
    });
  }
}
