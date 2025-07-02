import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageProvider extends ChangeNotifier{

  List titles = [];
  List descriptions = [];
  ThemeMode themeMode = ThemeMode.light;
  Locale? selectedLocale;

  static const List<Map<String, dynamic>> languages = [
    {
      'name' : 'English',
      'locale' : 'en'
    },
    {
      'name' : 'हिन्दी',
      'locale' : 'hi'
    },
    {
      'name': 'اردو',
      'locale' : 'ur'
    }
  ];


  void addTitle(String title, String description){
    titles.add(title);
    descriptions.add(description);
    notifyListeners();
  }

  void toggleTheme(){
    themeMode = themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  LanguageProvider({String? initialLocaleCode}) {
    if (initialLocaleCode != null) {
      selectedLocale = Locale(initialLocaleCode);
    }else {
      selectedLocale = const Locale('en');
    }
  }


  void changeLanguage(String language) async {
      selectedLocale = Locale(language);

      SharedPreferences sp = await SharedPreferences.getInstance();
      sp.setString('locale', language);

      notifyListeners();
    }

}