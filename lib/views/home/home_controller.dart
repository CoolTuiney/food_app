import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeController extends ChangeNotifier {
  int _navIndex = 0;

  int get navIndex => _navIndex;

  void setNavIndex(int index) {
    _navIndex = index;
    notifyListeners();
  }
}
