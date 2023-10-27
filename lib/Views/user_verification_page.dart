// ignore_for_file: use_build_context_synchronously

import 'package:admin_app/Models/user.dart';
import 'package:admin_app/View_Models/admin_management.dart';
import 'package:admin_app/View_Models/user_management.dart';
import 'package:admin_app/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserVerificationScreen extends StatefulWidget {
  const UserVerificationScreen({super.key});

  @override
  State<UserVerificationScreen> createState() => _UserVerificationScreenState();
}

class _UserVerificationScreenState extends State<UserVerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
      body: Stack(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: SingleChildScrollView(
                  child: Selector<UserManager, List<User>>(
                selector: (p0, p1) => p1.allUsers,
                builder: (context, userList, child) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 250,
                            width: 250,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/images/med.png'),
                              ),
                            ),
                          ),
                          Text(
                              '${userList[context.read<UserManager>().clickedUser].names} ${userList[context.read<UserManager>().clickedUser].surname}'),
                        ],
                      ),
                      Text('About'),
                      Divider(),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Phone:'),
                              SizedBox(
                                height: 20,
                              ),
                              Text('Email Address:'),
                              SizedBox(
                                height: 20,
                              ),
                              Text('Gender:'),
                              SizedBox(
                                height: 20,
                              ),
                              Text('Id Number:'),
                            ],
                          ),
                          SizedBox(
                            width: 70,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                  '0${userList[context.read<UserManager>().clickedUser].cellphoneNumber}'),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                  '${userList[context.read<UserManager>().clickedUser].emailaddress}'),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                  '${userList[context.read<UserManager>().clickedUser].gender}'),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                  '${userList[context.read<UserManager>().clickedUser].idNumber}'),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text('Verification Information'),
                      Divider(),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Account Status:'),
                              SizedBox(
                                height: 20,
                              ),
                              userList[context.read<UserManager>().clickedUser]
                                          .accountStatus ==
                                      'Verified'
                                  ? Text('Verified By:')
                                  : SizedBox(),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 70,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                  '${userList[context.read<UserManager>().clickedUser].accountStatus}'),
                              SizedBox(
                                height: 20,
                              ),
                              userList[context.read<UserManager>().clickedUser]
                                          .accountStatus ==
                                      'Verified'
                                  ? Text(
                                      '${userList[context.read<UserManager>().clickedUser].verifiedBy}')
                                  : SizedBox(),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Text('Attachments'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 500,
                            height: 700,
                            //  color: Colors.black,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Selfie'),
                                userList[context
                                                .read<UserManager>()
                                                .clickedUser]
                                            .verificationPicture !=
                                        null
                                    ? Image.network(
                                        '${userList[context.read<UserManager>().clickedUser].idDocument['ID_Front']}',
                                        loadingBuilder:
                                            (context, child, loadingProgress) {
                                          return Center(
                                            child: CircularProgressIndicator(),
                                          );
                                        },
                                        height: 400,
                                        width: 400,
                                      )
                                    : SizedBox(
                                        height: 400,
                                        width: 400,
                                      ),
                              ],
                            ),
                          ),
                          Container(
                            width: 500,
                            height: 700,
                            //color: const Color.fromARGB(255, 47, 17, 17),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('ID Front'),
                                userList[context
                                                .read<UserManager>()
                                                .clickedUser]
                                            .idDocument['ID_Front'] !=
                                        null
                                    ? Image.network(
                                        '${userList[context.read<UserManager>().clickedUser].idDocument['ID_Front']}',
                                        loadingBuilder:
                                            (context, child, loadingProgress) {
                                          return Center(
                                            child: CircularProgressIndicator(),
                                          );
                                        },
                                        height: 300,
                                        width: 300,
                                      )
                                    : SizedBox(
                                        height: 300,
                                        width: 300,
                                      ),
                                Text('ID Back'),
                                userList[context
                                                .read<UserManager>()
                                                .clickedUser]
                                            .idDocument['ID_Back'] !=
                                        null
                                    ? Image.network(
                                        '${userList[context.read<UserManager>().clickedUser].idDocument['ID_Back']}',
                                        loadingBuilder:
                                            (context, child, loadingProgress) {
                                          return Center(
                                            child: CircularProgressIndicator(),
                                          );
                                        },
                                        height: 300,
                                        width: 300,
                                      )
                                    : SizedBox(
                                        height: 300,
                                        width: 300,
                                      ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      userList[context.read<UserManager>().clickedUser]
                                  .accountStatus ==
                              'Not Verified'
                          ? AppBlueButton(
                              onPressed: () async {
                                await context
                                    .read<UserManager>()
                                    .updateUserAccountStatus(
                                        userID: userList[context
                                                .read<UserManager>()
                                                .clickedUser]
                                            .userID!,
                                        verifyer: context
                                            .read<AdminManager>()
                                            .adminData,
                                        status: 'Verified');
                                Navigator.of(context).pop();
                                setState(() {});
                              },
                              text: 'Verify User')
                          : SizedBox(),
                      SizedBox(
                        height: 50,
                      )
                    ],
                  );
                },
              )),
            ),
          ),
        ],
      ),
    );
  }
}
