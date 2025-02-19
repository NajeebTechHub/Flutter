import 'package:flutter/material.dart';
import 'package:multi_provider/provider/favourite/favourite_provider.dart';
import 'package:multi_provider/provider/favourite/itemList.dart';
import 'package:multi_provider/provider/login_implementation/auth_provider.dart';
import 'package:multi_provider/provider/login_implementation/loginRestAPI.dart';
import 'package:multi_provider/provider/multiProviderExample.dart';
import 'package:multi_provider/provider/multi_provider.dart';
import 'package:multi_provider/provider/statelessAsStatefull.dart';
import 'package:multi_provider/provider/theme/dark_theme.dart';
import 'package:multi_provider/provider/theme/theme_provider.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => multiProvider()),
          ChangeNotifierProvider(create: (_) => favouriteProvider()),
          ChangeNotifierProvider(create: (_) => themeProvider()),
          ChangeNotifierProvider(create: (_) => authProvider())
        ],
      child: Builder(
        builder: (context){
          final themeChanger = Provider.of<themeProvider>(context);

          return MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: themeChanger.themeMode,
            theme: ThemeData(
              brightness: Brightness.light
            ),
            darkTheme: ThemeData(
              brightness: Brightness.dark,
              appBarTheme: AppBarTheme(
                backgroundColor: Colors.blueAccent
              )
            ),
            home: loginImplementation(),
          );
        },
      )
    );
  }
}