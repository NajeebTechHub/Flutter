import 'dart:async';

import 'package:firebase2/pages/firestore/posts_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'auth/login_screen.dart';

class splash_screen extends StatefulWidget {
  const splash_screen({super.key});

  @override
  State<splash_screen> createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen> {



  void isLogin(){

    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;

    if(user != null){
      Timer(Duration(seconds: 3),(){
        Navigator.of(context).push(MaterialPageRoute(builder: (context){
          return posts_screen();
        }));
      });
    }else{
      Timer(Duration(seconds: 3),(){
        Navigator.of(context).push(MaterialPageRoute(builder: (context){
          return login_screen();
        }));
      });
    }


  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      body: Center(child: Text('Welcome Here')),
    );
  }
}
