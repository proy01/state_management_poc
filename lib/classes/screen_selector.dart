import 'package:flutter/material.dart';

class ScreenSelector with ChangeNotifier {

  double _screenIndex = 1;

  void updatePage(double n){
    _screenIndex = n;
    notifyListeners();
  }

  int get screenIndex => _screenIndex.toInt();
}