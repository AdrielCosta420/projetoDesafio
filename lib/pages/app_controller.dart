import 'package:flutter/cupertino.dart';

class AppController extends ChangeNotifier {
  bool isDartTheme = false;
  changeTheme() {
    isDartTheme = !isDartTheme;
    notifyListeners();
  }
}
