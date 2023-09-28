import 'package:admin_app/Views/home_page.dart';
import 'package:admin_app/Views/login_page.dart';
import 'package:admin_app/Views/reset_password.dart';
import 'package:admin_app/Views/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRouteManager {
  // ===========================App Level Screens==================================================
  static const String splashPage = '/';
  static const String loginPage = '/Login';
  static const String registerPage = '/Register';
  static const String passwordResetPage = '/ResetPassword';
  static const String adminHomePage = '/HomePage';

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
      // //========================== User Screens ===========================================
      case adminHomePage:
        return MaterialPageRoute(
          builder: (context) => const HomePage(),
        );
      // case userTicketsPage:
      //   return MaterialPageRoute(
      //     builder: (context) => const UserTicketsPage(),
      //   );
      // case userAccountPage:
      //   return MaterialPageRoute(
      //     builder: (context) => const UserAccountPage(),
      //   );
      // case userMenuPage:
      //   return MaterialPageRoute(
      //     builder: (context) => const UserMenuPage(),
      //   );
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
