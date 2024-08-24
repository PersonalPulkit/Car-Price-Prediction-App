import 'package:flutter/foundation.dart';

class TabProvider extends ChangeNotifier {
  int _index = 0;
  int get getTabIndex => _index;
  setTabIndex(int index) {
    _index = index;
    notifyListeners();
  }
}
