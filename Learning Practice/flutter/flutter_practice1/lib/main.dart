import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_practice1/languageProvider.dart';
import 'package:flutter_practice1/routes/noteAppRotes.dart';
import 'package:flutter_practice1/routes/route.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences sp = await SharedPreferences.getInstance();
  String? code = sp.getString('locale');

  runApp(ChangeNotifierProvider(
    create: (_) => LanguageProvider(initialLocaleCode: code),
  child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {

  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  // ThemeMode _themeMode = ThemeMode.light;

  // void toggleTheme(){
  //   setState(() {
  //   _themeMode = _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
  //   });
  // }

  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      // theme: ThemeData.light(),
      // theme: ThemeData(
      //   brightness: Brightness.light,
      //   primarySwatch: Colors.blue,
      //   fontFamily: 'Roboto'
      // ),
      // // darkTheme: ThemeData.dark(),
      // darkTheme: ThemeData(
      //   brightness: Brightness.dark,
      //   primarySwatch: Colors.blue,
      //   fontFamily: 'Roboto',
      // ),
      // themeMode: _themeMode,
      // initialRoute: '/',
      // onGenerateRoute: (settings){
      //   return AppRoute.generateRoute(settings, toggleTheme);
      // },

      onGenerateRoute: (settings){
        return NoteAppRoutes.generateRoute(settings);
      },

      supportedLocales: [
        Locale("en"),
        Locale("hi"),
        Locale("ur")
      ],

      locale: context.watch<LanguageProvider>().selectedLocale,

      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],

      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: context.watch<LanguageProvider>().themeMode,
    );
  }
}
