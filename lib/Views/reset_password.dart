// ignore_for_file: use_build_context_synchronously

import 'package:admin_app/Routes/routes.dart';
import 'package:admin_app/View_Models/admin_management.dart';
import 'package:admin_app/View_Models/auth.dart';
import 'package:admin_app/Views/home_page.dart';
import 'package:admin_app/app_constants.dart';
import 'package:admin_app/main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PasswordResetPage extends StatefulWidget {
  const PasswordResetPage({super.key});

  @override
  State<PasswordResetPage> createState() => _PasswordResetPageState();
}

class _PasswordResetPageState extends State<PasswordResetPage> {
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  late TextEditingController usernameController;
  late TextEditingController passwordController;

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
      body: Center(
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
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Reset Password",
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
                        labelText: 'Email',
                        prefixIcon: Icons.mail,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (usernameController.text.trim().isEmpty) {
                            return 'Enter your Email';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      AppBlueButton(
                        text: 'Reset Password',
                        onPressed: () async {
                          if (_loginFormKey.currentState!.validate()) {
                            final result =
                                await context.read<Authentication>().loginAdmin(
                                      usernameController.text.trim(),
                                      passwordController.text.trim(),
                                    );
                            if (context.read<Authentication>().currentUser ==
                                null) {
                              print('Verify email first');
                            } else {
                              await context
                                  .read<AdminManager>()
                                  .getCurrentAdminData(context
                                      .read<Authentication>()
                                      .currentUser!
                                      .uid);
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
    );
  }
}
