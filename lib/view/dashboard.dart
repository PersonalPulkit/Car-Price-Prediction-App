
import 'package:ai/providers/tab_provider.dart';
import 'package:ai/view/drawerwidgets/side_menu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/media_size.dart';
import 'dashboardbody.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {


  final user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
      ),
      drawer: MediaSize.isExpanded(size)
          ? null
          : Drawer(
              child: ListView(
                children: [
                  DrawerHeader(
                    child: Column(
                      children: [
                        Image.network(
                          "${user?.photoURL}",
                          height: 75,
                          width: 75,
                        ),
                        Text("Welcome! ${user?.displayName}"),
                      ],
                    ),
                  ),
                  SideMenu(
                    size: MediaSize.isExpanded(size),
                  ),
                ],
              ),
            ),
      body: Row(
        children: [
          if (MediaSize.isExpanded(size))
            Expanded(
              flex: 2,
              child: SideMenu(
                size: MediaSize.isExpanded(size),
              ),
            ),
          Expanded(
            flex: 7,
            child: Consumer<TabProvider>(
              builder: (BuildContext context, TabProvider value,
                      Widget? child) =>
                  DashboardBody(),
            ),
            // Container(
            //   color: Colors.yellow,
            //   child: Column(
            //     children: [
            //       Center(child: Text("Hello! Welcome to dashboard")),
            //       CustomElevatedButtonWithIcon(
            //         text: 'Logout',
            //         icon: Icon(Icons.logout),
            //         size: size,
            //         callBack: () {
            //           signOutUser();
            //           final user = FirebaseAuth.instance.currentUser;
            //           if (kDebugMode) {
            //             print(user);
            //           }
            //         },
            //       )
            //     ],
            //   ),
            // ),
          ),
          if(MediaSize.isExpanded(size))
            Expanded(
            flex: 3,
            child: Container(
            ),
          ),
        ],
      ),
    );
  }
}
