import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_practice1/languageProvider.dart';
import 'package:flutter_practice1/screens/localization/settings.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key,});

  @override
  Widget build(BuildContext context) {

    List title = [];

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.homeAppBar,style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.black,
        actions: [
          ElevatedButton(
              style:  ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
              ),
              onPressed: (){
                Navigator.pushNamed(context, '/settings');
              }, child: Icon(Icons.settings,color: Colors.white,)),
          // SizedBox(width: 10,),
        //   DropdownMenu(
        //     textStyle: TextStyle(color: Colors.white),
        //       initialSelection:
        //         context.watch<LanguageProvider>().selectedLocale.languageCode,
        //       onSelected: (value){
        //         context.read<LanguageProvider>().changeLanguage(value as String);
        //       },
        //       dropdownMenuEntries: LanguageProvider.languages.map((language) =>
        //           DropdownMenuEntry(
        //              value: language['locale'],
        //              label: language['name'])).toList(),),
        //
        ],


      ),
      body: ListView.builder(
          itemCount: context.watch<LanguageProvider>().titles.length,
          itemBuilder: (context, index){
            return ListTile(
              title: Text(context.watch<LanguageProvider>().titles[index]),
              subtitle: Text(context.watch<LanguageProvider>().descriptions[index]),
            );
          }),
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.pushNamed(context, '/addNote');
          },child: Icon(Icons.add),),

    );
  }
}