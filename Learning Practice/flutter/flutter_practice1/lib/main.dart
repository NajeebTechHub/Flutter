import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHome(),
    );
  }
}

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My first flutter app'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('Welcome to flutter'),
            ElevatedButton(onPressed: (){
              if (kDebugMode) {
                print('Button Pressed');
              }
            }, child: Text('click me'))
          ],
        ),
      ),
    );
  }
}

