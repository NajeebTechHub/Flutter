import 'dart:async';
import 'package:firbase_practice/pages/posts/posts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'auth/LoginScreen.dart';

class SplashScreen extends StatefulWidget{

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {



  void isLogin(BuildContext context){

    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;

    if(user != null){
      Timer(Duration(seconds: 3),(){
        Navigator.of(context).push(MaterialPageRoute(builder: (context){
          return posts();
        }));
      });
    }else{
      Timer(Duration(seconds: 3),(){
        Navigator.of(context).push(MaterialPageRoute(builder: (context){
          return LoginScreen();
        }));
      });

    }

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isLogin(context);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Welcome here')),
    );
  }
}