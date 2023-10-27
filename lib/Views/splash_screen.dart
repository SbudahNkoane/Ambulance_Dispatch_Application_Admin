import 'package:admin_app/initApp.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
        const Duration(
          seconds: 3,
        ),
        delay);
  }

  void delay() {
    InitApp.initializeApp(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Admin Dashboard',
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.blue),
            ),
            CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 150,
              foregroundImage: AssetImage('assets/images/logo.png'),
            ),
          ],
        ),
      ),
    );
  }
}
