import 'package:admin_app/View_Models/admin_management.dart';
import 'package:admin_app/View_Models/ambulance_management.dart';
import 'package:admin_app/View_Models/auth.dart';
import 'package:admin_app/View_Models/ticket_management.dart';
import 'package:admin_app/Views/ambulances_page.dart';
import 'package:admin_app/Views/dashboard_page.dart';
import 'package:admin_app/Views/login_page.dart';

import 'package:admin_app/Views/tickets_page.dart';
import 'package:admin_app/Views/users_page.dart';
import 'package:admin_app/app_constants.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  int active = 0;
  @override
  void initState() {
    super.initState();

    tabController = TabController(vsync: this, length: 4, initialIndex: 0)
      ..addListener(() {
        setState(() {
          active = tabController.index;
        });
      });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.width);
    return Scaffold(
      appBar: AppBar(
        foregroundColor: AppConstants().appBlack,
        automaticallyImplyLeading:
            MediaQuery.of(context).size.width < 1232 ? true : false,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(left: 32),
              child: Text(
                "Admin Portal",
                style: TextStyle(
                  fontSize: 24,
                  color: AppConstants().appBlack,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'HelveticaNeue',
                ),
              ),
            ),
          ],
        ),
        actions: <Widget>[
          SizedBox(width: MediaQuery.of(context).size.width / 4),
          const SizedBox(width: 32),
          Padding(
            padding: const EdgeInsets.only(top: 20, right: 10),
            child: InkWell(
              onTap: () {},
              child: Text(
                '${context.read<AdminManager>().adminData.names} ${context.read<AdminManager>().adminData.surname}',
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const InkWell(
            child: CircleAvatar(),
          ),
          const SizedBox(width: 32),
          TextButton(
            onPressed: () async {
              final result = await context.read<Authentication>().logoutUser();
              if (result == 'OK') {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => const LoginPage(),
                    ),
                    (route) => false);
              } else {
                print(result);
              }
            },
            child: const Text('Sign Out'),
          ),
        ],
        backgroundColor: AppConstants().appDarkWhite,
      ),
      body: Row(
        children: [
          MediaQuery.of(context).size.width < 1232
              ? Container()
              : Card(
                  elevation: 2.0,
                  child: Container(
                      margin: const EdgeInsets.all(0),
                      height: MediaQuery.of(context).size.height,
                      width: 250,
                      color: AppConstants().appDarkWhite,
                      child: listDrawerItems(false)),
                ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width < 1232
                  ? MediaQuery.of(context).size.width - 20
                  : MediaQuery.of(context).size.width - 270,
              child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                controller: tabController,
                children: [
                  DashboardScreen(),
                  UsersScreen(),
                  AmbulancesScreen(
                    ambulances: context.read<AmbulanceManager>().allAmbulance,
                  ),
                  TicketsScreen(
                    tickets: context.read<TicketManager>().allTickets,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      drawer: Padding(
        padding: const EdgeInsets.only(top: 56),
        child: Drawer(
          child: listDrawerItems(true),
        ),
      ),

      // FutureBuilder(
      //   future: context
      //       .read<AdminManager>()
      //       .getCurrentAdminData('G2qYvDryzUQjfww8zCdLiRO5As63'),
      //   builder: (context, snapshot) {
      //     return SafeArea(
      //       child: Row(
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         children: [
      //           Expanded(
      //             flex: 2,
      //             child: SideMenu(),
      //           ),
      //           Expanded(flex: 8, child: _pages[_index]),
      //         ],
      //       ),
      //     );
      //   },
      // ),
    );
  }

  Widget listDrawerItems(bool drawerStatus) {
    return ListView(
      children: <Widget>[
        Center(
          child: DrawerHeader(
            child: Image.asset(
              AppConstants().logoWithWhiteBackground,
              height: 170,
              width: 170,
            ),
          ),
        ),
        Container(
          color: tabController.index == 0
              ? AppConstants().applightBlue
              : AppConstants().appWhite,
          child: ListTile(
            selectedColor: AppConstants().appDarkWhite,
            textColor: tabController.index == 0
                ? AppConstants().appWhite
                : AppConstants().appBlack,
            hoverColor: AppConstants().appDarkBlue,
            selected: tabController.index == 0 ? true : false,
            leading: const Icon(Icons.dashboard),
            title: const Text(
              "Dashboard",
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'HelveticaNeue',
              ),
            ),
            onTap: () {
              tabController.animateTo(0);
              drawerStatus ? Navigator.pop(context) : print("pressed");
            },
          ),
        ),
        Container(
          color: tabController.index == 1
              ? AppConstants().applightBlue
              : AppConstants().appWhite,
          child: ListTile(
            selectedColor: AppConstants().appDarkWhite,
            textColor: tabController.index == 1
                ? AppConstants().appWhite
                : AppConstants().appBlack,
            hoverColor: AppConstants().appDarkBlue,
            selected: tabController.index == 1 ? true : false,
            leading: const Icon(Icons.dashboard),
            title: const Text(
              "Users",
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'HelveticaNeue',
              ),
            ),
            onTap: () {
              tabController.animateTo(1);
              drawerStatus ? Navigator.pop(context) : print("pressed");
            },
          ),
        ),
        Container(
          color: tabController.index == 2
              ? AppConstants().applightBlue
              : AppConstants().appWhite,
          child: ListTile(
            selectedColor: AppConstants().appDarkWhite,
            textColor: tabController.index == 2
                ? AppConstants().appWhite
                : AppConstants().appBlack,
            hoverColor: AppConstants().appDarkBlue,
            selected: tabController.index == 2 ? true : false,
            leading: const Icon(Icons.dashboard),
            title: const Text(
              "Ambulances",
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'HelveticaNeue',
              ),
            ),
            onTap: () {
              tabController.animateTo(2);
              drawerStatus ? Navigator.pop(context) : print("pressed");
            },
          ),
        ),
        Container(
          color: tabController.index == 3
              ? AppConstants().applightBlue
              : AppConstants().appWhite,
          child: ListTile(
            selectedColor: AppConstants().appDarkWhite,
            textColor: tabController.index == 3
                ? AppConstants().appWhite
                : AppConstants().appBlack,
            hoverColor: AppConstants().appDarkBlue,
            selected: tabController.index == 3 ? true : false,
            leading: const Icon(Icons.dashboard),
            title: const Text(
              "Tickets",
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'HelveticaNeue',
              ),
            ),
            onTap: () {
              tabController.animateTo(3);
              drawerStatus ? Navigator.pop(context) : print("pressed");
            },
          ),
        ),
      ],
    );
  }
}
