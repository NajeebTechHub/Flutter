import 'package:flutter/material.dart';
import 'package:expenses_tracker/services/database_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final conPassController = TextEditingController();
  final  database = DatabaseServices();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.tealAccent[100],
      appBar: AppBar(
        shadowColor: Colors.black.withOpacity(0.9),
        elevation: 5,
        backgroundColor: Colors.teal,
        title: Text('Sign Up',style: TextStyle(color: Colors.white),),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: usernameController,
                decoration: InputDecoration(
                    labelText: 'Username',
                  suffixIcon: Icon(Icons.person,size: 20,)
                ),
              ),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                    labelText: 'email',
                  suffixIcon: Icon(Icons.email,size: 20,)
                ),
              ),
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(
                    labelText: 'Password',
                    suffixIcon: Icon(Icons.lock,size: 20,)

                ),
                obscureText: true,
              ),
              TextFormField(
                controller: conPassController,
                decoration: InputDecoration(
                    labelText: 'confirm Password',
                    suffixIcon: Icon(Icons.password,size: 20,)

                ),
                obscureText: true,
              ),
              SizedBox(height: 10,),

              ElevatedButton(
                child: Text('Sign Up'),
                onPressed: signup,
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.teal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void signup() async {
    String username = usernameController.text;
    String email = emailController.text;
    String password = passwordController.text;
    String conPassword = conPassController.text;
    var user = await database.getUser(username);

    if(username == '' || email == '' || password == ''){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('please fill the fields'),duration: Duration(seconds: 1))
      );
    }
    else if(!email.contains('@')){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('enter correct email'),duration: Duration(seconds: 1))
      );
    }
    else if(password != conPassword){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('password not match'),duration: Duration(seconds: 1))
      );
    }
    else if (user != null && user['username'] == username) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('User already exists'),duration: Duration(seconds: 1)),
      );
    }
    else{
      await database.addUser(username,email,password);
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('account created successfully'),duration: Duration(seconds: 1))
      );
    }
  }
}
