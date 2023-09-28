import 'package:admin_app/Routes/routes.dart';
import 'package:admin_app/View_Models/admin_management.dart';
import 'package:admin_app/View_Models/ambulance_management.dart';
import 'package:admin_app/View_Models/auth.dart';
import 'package:admin_app/View_Models/paramedic_management.dart';
import 'package:admin_app/View_Models/ticket_management.dart';
import 'package:admin_app/View_Models/user_management.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Authentication(),
        ),
        ChangeNotifierProvider(
          create: (context) => AdminManager(),
        ),
        ChangeNotifierProvider(
          create: (context) => AmbulanceManager(),
        ),
        ChangeNotifierProvider(
          create: (context) => ParamedicManager(),
        ),
        ChangeNotifierProvider(
          create: (context) => UserManager(),
        ),
        ChangeNotifierProvider(
          create: (context) => TicketManager(),
        )
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'AmbuQuick',
        initialRoute: AppRouteManager.splashPage,
        onGenerateRoute: AppRouteManager.generateRoute,
      ),
    );
  }
}
