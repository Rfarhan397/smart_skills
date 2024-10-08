import 'package:flutter/material.dart';

class BottomNavProvider with ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void selectTab(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}


class DaySelectorProvider with ChangeNotifier {
  int _selectedIndex;

  DaySelectorProvider({required int initialIndex}) : _selectedIndex = initialIndex;

  int get selectedIndex => _selectedIndex;

  void selectDay(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}

