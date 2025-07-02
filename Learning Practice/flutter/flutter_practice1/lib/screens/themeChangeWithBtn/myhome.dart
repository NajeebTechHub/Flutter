import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHome extends StatelessWidget {
  final VoidCallback toggleTheme;
  MyHome({super.key, required this.toggleTheme});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, '/Second');
            }, child: Text('Go to Profile')),
            SizedBox(height: 10,),
            ElevatedButton(
                onPressed: (){
                  toggleTheme();
                }, child: Text('Toggle Theme Light/Dark')),
          ],
        ),
      ),
    );
  }
}
