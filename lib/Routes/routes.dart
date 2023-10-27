import 'package:admin_app/View_Models/ambulance_management.dart';
import 'package:admin_app/View_Models/ticket_management.dart';
import 'package:admin_app/Views/assign_ambulance_page.dart';
import 'package:admin_app/Views/home_page.dart';
import 'package:admin_app/Views/login_page.dart';
import 'package:admin_app/Views/reset_password.dart';
import 'package:admin_app/Views/splash_screen.dart';
import 'package:admin_app/Views/pending_tickets_page.dart';
import 'package:admin_app/Views/user_verification_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppRouteManager {
  // ===========================App Level Screens==================================================
  static const String splashPage = '/';
  static const String loginPage = '/Login';
  static const String registerPage = '/Register';
  static const String passwordResetPage = '/ResetPassword';
  static const String adminHomePage = '/HomePage';
  static const String assignAmbulancePage = '/assignAmbulancePage';
  static const String adminTicketsPage = '/TicketsPage';
  static const String adminUserVerificationPage = '/UserVerificationPage';

  AppRouteManager._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashPage:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      case loginPage:
        return MaterialPageRoute(
          builder: (context) => const LoginPage(),
        );
      case passwordResetPage:
        return MaterialPageRoute(
          builder: (context) => const PasswordResetPage(),
        );
      // //========================== Admin Screens ===========================================
      case adminHomePage:
        return MaterialPageRoute(
          builder: (context) => const HomePage(),
        );
      case adminUserVerificationPage:
        return MaterialPageRoute(
          builder: (context) => const UserVerificationScreen(),
        );
      case adminTicketsPage:
        return MaterialPageRoute(
          builder: (context) => PendingTicketsPage(
            tickets: context.read<TicketManager>().openTickets,
          ),
        );
      case assignAmbulancePage:
        return MaterialPageRoute(
          builder: (context) => AssignAmbulancePage(
            ambulances: context.read<AmbulanceManager>().availableAmbulances,
          ),
        );
      // case userRequestFormPage:
      //   return MaterialPageRoute(
      //     builder: (context) => const UserRequestFromPage(),
      //   );
      // case userProfilePage:
      //   return MaterialPageRoute(
      //     builder: (context) => const UserProfilePage(),
      //   );

      default:
        throw const FormatException('This Page does not exist!!');
    }
  }
}
