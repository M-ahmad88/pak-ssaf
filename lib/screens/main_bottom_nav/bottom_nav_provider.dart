import 'package:flutter/cupertino.dart';

class BottomNavProvider extends ChangeNotifier {
  bool _isVisible = true;
  int _currentTab = 0;


  void setVisibility(bool value) {
    _isVisible = value;
    notifyListeners();
  }

  void setCurrentTab(int index)
  {
    _currentTab = index;
    notifyListeners();
  }

  int getCurrentTab() => _currentTab;
  bool getVisibility() => _isVisible;
}
