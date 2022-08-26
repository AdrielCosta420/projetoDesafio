import 'package:flutter/material.dart';

class AppController extends ChangeNotifier{

  static AppController instance = AppController();
  
  bool isDartTheme = false;
  void changeTheme() {
    isDartTheme = !isDartTheme;
    notifyListeners();
  }
}