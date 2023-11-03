// ignore_for_file: use_build_context_synchronously

import 'package:admin_app/Routes/routes.dart';
import 'package:admin_app/View_Models/admin_management.dart';
import 'package:admin_app/View_Models/ambulance_management.dart';
import 'package:admin_app/View_Models/paramedic_management.dart';
import 'package:admin_app/View_Models/ticket_management.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InitApp {
  static initializeApp(BuildContext context) async {
    WidgetsFlutterBinding.ensureInitialized();
    if (kIsWeb) {
      await Firebase.initializeApp(
        options: const FirebaseOptions(
          apiKey: "AIzaSyBiZdF9u4h4ghH0mVQRBLhJNeZ_9CPxEEw",
          authDomain: "ambulance-dispatch-401323.firebaseapp.com",
          projectId: "ambulance-dispatch-401323",
          storageBucket: "ambulance-dispatch-401323.appspot.com",
          messagingSenderId: "314167111153",
          appId: "1:314167111153:web:7dbab69c2d85712754e850",
        ),
      );
    }

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
