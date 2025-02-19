import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multi_provider/provider/login_implementation/auth_provider.dart';
import 'package:provider/provider.dart';

class loginImplementation extends StatelessWidget{


  @override
  Widget build(BuildContext context) {

    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final auth = Provider.of<authProvider>(context);


    return Scaffold(
      appBar: AppBar(
        title: Text('login with API'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: emailController,
          ),
          SizedBox(height: 10,),
          TextField(
            controller: passwordController,
          ),
          SizedBox(height: 10,),
          ElevatedButton(
              onPressed: (){
                auth.login(emailController.text,passwordController.text);
              },
              child: auth.loading ? CircularProgressIndicator() : Text('login'))

        ],
      ),
    );
  }
}