import 'package:ai/models/side_menu_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../view/drawerwidgets/aboutus.dart';
import '../view/drawerwidgets/history.dart';
import '../view/drawerwidgets/home.dart';
import '../view/drawerwidgets/settings.dart';

class SideMenuViewModel  {
  final _menu = <SideMenuModel>[
    SideMenuModel(
      icon: iconItems[0],
      title: menuItems[0],
      widget: screensList[0],
    ),
    SideMenuModel(
      icon: iconItems[1],
      title: menuItems[1],
      widget: screensList[1],
    ),
    SideMenuModel(
      icon: iconItems[2],
      title: menuItems[2],
      widget: screensList[2],
    ),
    SideMenuModel(
      icon: iconItems[3],
      title: menuItems[3],
      widget: screensList[3],
    ),
  ];
  List<SideMenuModel> get menu => _menu;
}

final iconItems = <IconData>[
  Icons.home,
  Icons.history,
  Icons.info,
  Icons.settings,
];
final menuItems = <String>[
  'Home',
  'History',
  'About us',
  'Settings',
];

List<Widget> screensList = <Widget>[
  Home(key: GlobalKey()),
  History(key: GlobalKey()),
  AboutUs(key: GlobalKey()),
  Settings(key: GlobalKey()),
];
