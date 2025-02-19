import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multi_provider/provider/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class darkTheme extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    final themeChanger = Provider.of<themeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Dark Theme'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          RadioListTile(
            title: Text('Light Mode'),
              value: ThemeMode.light,
              groupValue: themeChanger.themeMode,
              onChanged: themeChanger.setTheme
          ),
          RadioListTile(
              title: Text('Dark Mode'),
              value: ThemeMode.dark,
              groupValue: themeChanger.themeMode,
              onChanged: themeChanger.setTheme
          ),
        ],
      ),
    );
  }
}