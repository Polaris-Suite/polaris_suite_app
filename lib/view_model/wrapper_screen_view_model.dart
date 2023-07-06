import 'package:flutter/material.dart';

class WrapperScreenViewProvider extends ChangeNotifier {
  int _currentIndex = 0;

  //getter
  int get currentIndex => _currentIndex;

  //setter
  void setNewIndex(int newValue) {
    _currentIndex = newValue;
    notifyListeners();
  }
}
