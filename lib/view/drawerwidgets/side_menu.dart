import 'package:ai/constants/media_size.dart';
import 'package:ai/view_model/side_menu_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/tab_provider.dart';

class SideMenu extends StatefulWidget {
  final bool size;
  const SideMenu({super.key, required this.size});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  SideMenuViewModel menu = SideMenuViewModel();
  @override
  Widget build(BuildContext context) {
    return Consumer<TabProvider>(
      builder: (BuildContext context, TabProvider value, Widget? child) =>
          ListView.builder(
        shrinkWrap: !widget.size,
        itemCount: menu.menu.length,
        itemBuilder: (context, index) => buildSideMenu(value, index),
      ),
    );
  }

  Widget buildSideMenu(TabProvider tabProvider, int index) {
    final isSelected = tabProvider.getTabIndex == index;
    return ListTile(
      key: ValueKey(menu.menu),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25), // Corrected shape property
      ),
      onTap: () {
        MediaSize.isExpanded(MediaQuery.sizeOf(context))? null : Navigator.pop(context);
        context.read<TabProvider>().setTabIndex(index);
        // context.read<SideMenuViewModel>().selectMenu(selectedIndex);
      },
      iconColor: isSelected ? Colors.black : DefaultSelectionStyle.defaultColor,
      textColor: isSelected ? Colors.black : DefaultSelectionStyle.defaultColor,
      leading: Icon(menu.menu[index].icon),
      title: Text(menu.menu[index].title),
      hoverColor: Colors.black12,
    );
  }
}
