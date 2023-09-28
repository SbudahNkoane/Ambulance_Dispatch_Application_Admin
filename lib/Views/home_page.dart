import 'package:admin_app/View_Models/admin_management.dart';
import 'package:admin_app/Views/ambulances_page.dart';
import 'package:admin_app/Views/dashboard_page.dart';
import 'package:admin_app/Views/paramedics_page.dart';
import 'package:admin_app/Views/tickets_page.dart';
import 'package:admin_app/Views/users_page.dart';
import 'package:admin_app/app_constants.dart';
import 'package:admin_app/main.dart';
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

    tabController = TabController(vsync: this, length: 5, initialIndex: 0)
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
          Container(
            padding: const EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width / 3,
            child: SearchAnchor(
              builder: (context, controller) {
                return SearchBar(
                  elevation: MaterialStateProperty.all(1),
                  onTap: () {
                    controller.openView();
                  },
                  onChanged: (value) {
                    controller.openView();
                  },
                  controller: controller,
                  hintText: tabController.index == 1
                      ? 'Search User'
                      : tabController.index == 2
                          ? 'Search Paramedic'
                          : tabController.index == 3
                              ? 'Search Ambulance'
                              : tabController.index == 4
                                  ? 'Search Ticket'
                                  : 'Search',
                  leading: const Icon(Icons.search),
                );
              },
              suggestionsBuilder: (context, controller) {
                return List<ListTile>.generate(5, (index) {
                  final String item = 'item $index';
                  return ListTile(
                    title: Text(item),
                    onTap: () {
                      setState(() {
                        controller.closeView(item);
                      });
                    },
                  );
                });
              },
            ),
            // Note: Same code is applied for the TextFormField as well
            //     TextField(
            //   decoration: InputDecoration(
            //     enabledBorder: OutlineInputBorder(
            //       borderSide: BorderSide(
            //           width: 3, color: Colors.greenAccent), //<-- SEE HERE
            //       borderRadius: BorderRadius.circular(50.0),
            //     ),
            //   ),
            // )
          ),
          SizedBox(width: MediaQuery.of(context).size.width / 4),
          const SizedBox(width: 32),
          Padding(
            padding: const EdgeInsets.only(top: 20, right: 5),
            child: Text(
              '${context.read<AdminManager>().adminData.names} ${context.read<AdminManager>().adminData.surname}',
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            child: const CircleAvatar(),
          ),
          const SizedBox(width: 32),
          TextButton(
            onPressed: () {},
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
                      width: 300,
                      color: AppConstants().appDarkWhite,
                      child: listDrawerItems(false)),
                ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width < 1232
                  ? MediaQuery.of(context).size.width - 20
                  : MediaQuery.of(context).size.width - 320,
              child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                controller: tabController,
                children: const [
                  DashboardScreen(),
                  UsersScreen(),
                  AmbulancesScreen(),
                  TicketsScreen(),
                  ParamedicsScreen(),
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
              "Paramedics",
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
              "Ambulances",
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
        Container(
          color: tabController.index == 4
              ? AppConstants().applightBlue
              : AppConstants().appWhite,
          child: ListTile(
            selectedColor: AppConstants().appDarkWhite,
            textColor: tabController.index == 4
                ? AppConstants().appWhite
                : AppConstants().appBlack,
            hoverColor: AppConstants().appDarkBlue,
            selected: tabController.index == 4 ? true : false,
            leading: const Icon(Icons.dashboard),
            title: const Text(
              "Tickets",
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'HelveticaNeue',
              ),
            ),
            onTap: () {
              tabController.animateTo(4);
              drawerStatus ? Navigator.pop(context) : print("pressed");
            },
          ),
        ),
      ],
    );
  }
}