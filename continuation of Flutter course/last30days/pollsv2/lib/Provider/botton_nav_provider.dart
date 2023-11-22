import 'package:flutter/material.dart';

class BottonNavProvider extends ChangeNotifier{
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  set changeValue(int index){
    _currentIndex = index;
    notifyListeners();
  }
}