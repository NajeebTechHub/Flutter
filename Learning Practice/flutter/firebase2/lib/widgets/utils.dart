import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class utils{

  void toast(String message){
    Fluttertoast.showToast(
        msg: message,
      gravity: ToastGravity.BOTTOM,
      toastLength: Toast.LENGTH_SHORT,
      backgroundColor: Colors.red,
      textColor: Colors.white
    );
  }
}