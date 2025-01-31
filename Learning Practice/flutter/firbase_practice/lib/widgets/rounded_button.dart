import 'package:flutter/material.dart';

class rounded_Button extends StatelessWidget{
  final String title;
  final VoidCallback onTap;
  final bool loading;

  const rounded_Button({super.key,required this.title,required this.onTap,this.loading = false});


  @override
  Widget build(BuildContext context) {

    return  InkWell(
        onTap: onTap,
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            color: Colors.brown,
            borderRadius: BorderRadius.circular(10)
            ),
          child: Center(
              child: loading ? CircularProgressIndicator(color: Colors.white,strokeWidth: 3,) : Text(title,style: TextStyle(color: Colors.white),)),
          ),
      );
  }
}