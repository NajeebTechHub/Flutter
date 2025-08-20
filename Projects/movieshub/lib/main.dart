import 'package:flutter/material.dart';
import 'package:movieshub/View/home_screen.dart';
import 'package:movieshub/colors.dart';
import 'package:movieshub/provider/moviesProvider.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(MoviesHub());
}

class MoviesHub extends StatelessWidget{

 @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => MoviesProvider())
        ],
      child: MaterialApp(
        title: 'FilmFare',
        debugShowCheckedModeBanner: false,
        theme:ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Colors.black,
          cardTheme: CardThemeData(
            color: AppColors.cardBackground
          ),
          textTheme: const TextTheme(
            bodyLarge: TextStyle(color: Colors.white),
            bodyMedium: TextStyle(color: Colors.white),
            bodySmall: TextStyle(color: Colors.white),
          ),
        ),
        home: MoviesScreen(),
      ),
    );
  }
}