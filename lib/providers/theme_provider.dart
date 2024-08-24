import 'package:ai/sharedpreferences/shared_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class ThemeProvider extends ChangeNotifier {
  final List<Widget> _icons = <Widget>[
    Icon(Icons.light_mode),
    Icon(Icons.dark_mode),
    Icon(FontAwesomeIcons.user),
  ];
  List<Widget> get getIcons => _icons;

  final List<bool> _selectedTheme = <bool>[false, false, true];
  ThemeMode? _themeMode = ThemeMode.system;

  get getThemeMode => _themeMode;

  get getSelectedTheme => _selectedTheme;

  setSelectedTheme(int index) {
    for (int i = 0; i < _selectedTheme.length; i++) {
      _selectedTheme[i] = i == index;
    }
    if (_selectedTheme[0] == true){
      _themeMode = ThemeMode.light;
    }else if(_selectedTheme[1] == true){
      _themeMode = ThemeMode.dark;
    }else if(_selectedTheme[2] == true){
      _themeMode = ThemeMode.system;
    }else {
      _themeMode = ThemeMode.system;
    }

    notifyListeners();
  }
}
