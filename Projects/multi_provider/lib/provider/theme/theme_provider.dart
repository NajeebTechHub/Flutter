import 'package:flutter/material.dart';

class themeProvider extends ChangeNotifier{

  var _themeMode = ThemeMode.light;
  ThemeMode get themeMode => _themeMode;

  void setTheme(themMode){
    _themeMode = themMode;
    notifyListeners();
  }
}