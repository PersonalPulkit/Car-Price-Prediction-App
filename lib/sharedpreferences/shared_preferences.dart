import 'package:shared_preferences/shared_preferences.dart';

class ThemeSharedPreferences {
   static getSelectedTheme() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<bool> retrievedSelectedTheme = (prefs.getStringList('selectedTheme') ?? <String>[]).map((value) => value == 'true').toList();
    return retrievedSelectedTheme;
  }
  setSelectedTheme() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

  }
}
