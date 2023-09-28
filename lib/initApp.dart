// ignore_for_file: use_build_context_synchronously

import 'package:admin_app/Routes/routes.dart';
import 'package:admin_app/View_Models/admin_management.dart';
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
            authDomain: "ambulance-dispatch-syste-c3397.firebaseapp.com",
            storageBucket: "ambulance-dispatch-syste-c3397.appspot.com",
            databaseURL:
                "https://ambulance-dispatch-syste-c3397-default-rtdb.firebaseio.com",
            apiKey: "AIzaSyBONKBvXus1aY3ZycS-E3Qhl0n9yjgA4pc",
            appId: "1:465560543092:web:007f4ee3e335cf26c15621",
            messagingSenderId: "465560543092",
            projectId: "ambulance-dispatch-syste-c3397"),
      );
    }
    await context
        .read<AdminManager>()
        .getCurrentAdminData('wKoddJUb3ERckTWEXipYFlcvBgM2');
    Navigator.of(context).popAndPushNamed(AppRouteManager.adminHomePage);
  }
}
