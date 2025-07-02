import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice1/languageProvider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.settings),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
       body: Center(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           crossAxisAlignment: CrossAxisAlignment.center,
           children: [
             ElevatedButton(onPressed: (){
               context.read<LanguageProvider>().toggleTheme();
             }, child: Text(AppLocalizations.of(context)!.changeTheme)),
             SizedBox(height: 10,),
             DropdownMenu(
               initialSelection: context.watch<LanguageProvider>().selectedLocale?.languageCode,
               dropdownMenuEntries: LanguageProvider.languages.map((language) =>
                   DropdownMenuEntry(
                   value: language['locale'],
                   label: language['name'])).toList(),
               onSelected: (value){
                 if (value != null) {
                   context.read<LanguageProvider>().changeLanguage(value);
                 }

               },),
           ],
         ),
       ),
    );
  }
}