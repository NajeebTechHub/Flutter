import 'package:firbase_practice/widgets/rounded_button.dart';
import 'package:firbase_practice/widgets/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {

  final emailController = TextEditingController();
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('forgot passward',style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.brown,
        iconTheme: IconThemeData(
          color: Colors.white
        ),
      ),
      backgroundColor: Colors.brown[200],
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              controller: emailController,
              decoration: InputDecoration(
                hintText: 'Enter email'
              ),
            ),
            SizedBox(height: 20,),
            rounded_Button(
                title: 'Forgot',
                onTap: (){
                  auth.sendPasswordResetEmail(
                      email: emailController.text
                  ).then((value){
                    utils().toast('check your email');
                  }).onError((error,stackTrace){
                    utils().toast(error.toString());
                  });
                })
          ],
        ),
      ),
    );
  }
}
