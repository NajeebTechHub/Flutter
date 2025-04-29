import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:expenses_tracker/services/database_services.dart';

import '../main.dart';
import 'SignUpScreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final  database = DatabaseServices();


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.tealAccent[100],
      appBar: AppBar(
        shadowColor: Colors.black.withOpacity(0.9),
        elevation: 5,
        backgroundColor: Colors.teal,
        title: Text('Login',style: TextStyle(color: Colors.white),),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                  labelText: 'Username',
                  suffixIcon: Icon(Icons.person,size: 20,)
              ),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                  labelText: 'Password',
                  suffixIcon: Icon(Icons.password,size: 20,)
              ),
              obscureText: true,
            ),
            SizedBox(height: 10,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.teal
              ),
              child: Text('Login'),
              onPressed: login,
            ),
            TextButton(
              child: Text('Don\'t have an account? Sign up'),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context){
                  return SignupScreen();
                }));
              },
            ),
          ],
        ),
      ),
    );
  }

  void login() async {
    String username = usernameController.text;
    String password = passwordController.text;
    var user = await database.getUser(username);

    if(username == '' || password == ''){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('please enter username and password'),duration: Duration(seconds: 1))
      );
    }
    else if (user != null && user['password'] == password) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool('isLoggedIn', true);
      Navigator.of(context).push(MaterialPageRoute(builder: (context){
        return MainPage();
      }));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('wrong username or password'),duration: Duration(seconds: 1),)
      );
    }
  }
}