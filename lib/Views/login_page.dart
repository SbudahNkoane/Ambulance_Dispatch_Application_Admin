// ignore_for_file: use_build_context_synchronously

import 'package:admin_app/Routes/routes.dart';
import 'package:admin_app/View_Models/admin_management.dart';
import 'package:admin_app/View_Models/ambulance_management.dart';
import 'package:admin_app/View_Models/auth.dart';
import 'package:admin_app/View_Models/paramedic_management.dart';
import 'package:admin_app/View_Models/ticket_management.dart';
import 'package:admin_app/Views/app_progress_indicator.dart';
import 'package:admin_app/Views/home_page.dart';
import 'package:admin_app/app_constants.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  late TextEditingController usernameController;
  late TextEditingController passwordController;
  final bool _hideText = false;

  @override
  void initState() {
    usernameController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.only(left: 70, right: 70),
                color: AppConstants().appDarkWhite,
                height: 530,
                width: 450,
                child: Column(
                  children: [
                    Image.asset(
                      AppConstants().logoWithWhiteBackground,
                      height: 170,
                      width: 170,
                    ),
                    Text(
                      "Admin Dashboard",
                      style: GoogleFonts.moul(fontSize: 16, color: Colors.blue),
                      // TextStyle(
                      //     letterSpacing: 1,
                      //     fontSize: 40,
                      //     fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Sign In",
                      style: GoogleFonts.moul(fontSize: 40),
                      // TextStyle(
                      //     letterSpacing: 1,
                      //     fontSize: 40,
                      //     fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Form(
                      key: _loginFormKey,
                      child: Column(
                        children: [
                          AppTextField(
                            controller: usernameController,
                            labelText: 'Username',
                            prefixIcon: Icons.mail,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (usernameController.text.trim().isEmpty) {
                                return 'Enter your Username';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          AppTextField(
                            suffixIcon: null,
                            hideText: _hideText ? false : true,
                            controller: passwordController,
                            labelText: 'Password',
                            prefixIcon: Icons.password,
                            keyboardType: TextInputType.visiblePassword,
                            validator: (value) {
                              if (passwordController.text.trim().isEmpty) {
                                return 'Enter your Password';
                              }
                              return null;
                            },
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).pushNamed(
                                      AppRouteManager.passwordResetPage);
                                },
                                child: Text(
                                  "Forgot Password?",
                                  style: TextStyle(
                                      color: AppConstants().appRed,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          AppBlueButton(
                            text: 'Sign In',
                            onPressed: () async {
                              if (_loginFormKey.currentState!.validate()) {
                                await context.read<Authentication>().loginAdmin(
                                      usernameController.text.trim(),
                                      passwordController.text.trim(),
                                    );
                                if (context
                                        .read<Authentication>()
                                        .currentUser ==
                                    null) {
                                  if (kDebugMode) {
                                    print('Could not log you in');
                                  }
                                } else {
                                  await context
                                      .read<AdminManager>()
                                      .getCurrentAdminData(context
                                          .read<Authentication>()
                                          .currentUser!
                                          .uid);
                                  await context
                                      .read<AmbulanceManager>()
                                      .getAllAmbulances();
                                  await context
                                      .read<AmbulanceManager>()
                                      .getAvailableAmbulances();
                                  await context
                                      .read<AmbulanceManager>()
                                      .getBusyAmbulances();
                                  await context
                                      .read<AmbulanceManager>()
                                      .getUnAvailableAmbulances();
                                  await context
                                      .read<TicketManager>()
                                      .getclosedTickets();
                                  await context
                                      .read<TicketManager>()
                                      .getopenTickets();
                                  await context
                                      .read<TicketManager>()
                                      .getpendingTickets();
                                  await context
                                      .read<ParamedicManager>()
                                      .getAllParamedics();
                                  Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute<void>(
                                        builder: (BuildContext context) =>
                                            const HomePage(),
                                      ),
                                      (route) => false);
                                }
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Selector<Authentication, Tuple2>(
            selector: (context, value) =>
                Tuple2(value.showProgress, value.userProgressText),
            builder: (context, value, child) {
              return value.item1
                  ? AppProgressIndicator(text: "${value.item2}")
                  : Container();
            },
          ),
        ],
      ),
    );
  }
}
