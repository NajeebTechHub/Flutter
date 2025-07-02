import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice1/screens/localization/addNotes.dart';
import 'package:flutter_practice1/screens/localization/homeScreen.dart';
import 'package:flutter_practice1/screens/localization/settings.dart';

class NoteAppRoutes{

  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case '/':
        // final title = settings.arguments as List;
        // final descriptions = settings.arguments as List;
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case '/addNote':
        // final title = settings.arguments as List;
        return MaterialPageRoute(builder: (_) => AddNotes());
      case '/settings':
        return MaterialPageRoute(builder: (_) => Settings());
      default:
        return MaterialPageRoute(builder: (_) => Text('Page Not Found'));
    }
  }

}