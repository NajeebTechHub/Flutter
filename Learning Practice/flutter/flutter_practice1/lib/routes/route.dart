import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice1/screens/myhome.dart';
import 'package:flutter_practice1/screens/secondpage.dart';
import 'package:flutter_practice1/screens/thirdpage.dart';

class AppRoute{
  static Route<dynamic> generateRoute(RouteSettings settings, VoidCallback toggleTheme){
    switch(settings.name){
      case '/':
        return MaterialPageRoute(builder: (_) => MyHome(toggleTheme: toggleTheme));
      case '/Second':
        return MaterialPageRoute(builder: (_) => SecondPage());
      case '/Third':
        return MaterialPageRoute(builder: (_) => ThirdPage());
      default:
        return MaterialPageRoute(builder: (_) => MyHome(toggleTheme: toggleTheme));
    }
  }
}