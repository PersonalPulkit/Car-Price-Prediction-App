import 'package:ai/providers/tab_provider.dart';
import 'package:ai/view_model/side_menu_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashboardBody extends StatefulWidget {
  const DashboardBody({super.key});

  @override
  State<DashboardBody> createState() => _DashboardBodyState();
}

class _DashboardBodyState extends State<DashboardBody> {
  SideMenuViewModel menu = SideMenuViewModel();

  @override
  Widget build(BuildContext context) {
    return Consumer<TabProvider>(
        builder: (BuildContext context, TabProvider value, Widget? child) =>menu.menu[value.getTabIndex].widget
    );

  }
}
