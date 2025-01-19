import 'package:firbase_practice/pages/auth/SignUpScreen.dart';
import 'package:firbase_practice/pages/auth/forgot_password.dart';
import 'package:firbase_practice/pages/posts/posts.dart';
import 'package:firbase_practice/widgets/rounded_button.dart';
import 'package:firbase_practice/widgets/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget{

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FormKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool loading = false;

  final auth = FirebaseAuth.instance;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.brown,
          title: Text('Login Screen',style: TextStyle(color: Colors.white),),
          centerTitle: true,
        ),
        backgroundColor: Colors.brown[200],
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Form(
                key: FormKey,
                child: Column(
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                      decoration: InputDecoration(
                        label: Text('email'),
                        prefixIcon: Icon(Icons.alternate_email),
                      ),
                      validator: (value){
                        if(value!.isEmpty){
                          return 'Enter Email';
                        }
                        return null;
                      },
                    ),

                    TextFormField(
                      obscureText: true,
                      keyboardType: TextInputType.emailAddress,
                      controller: passwordController,
                      decoration: InputDecoration(
                        label: Text('password'),
                        prefixIcon: Icon(Icons.lock),
                      ),
                      validator: (value){
                        if(value!.isEmpty){
                          return 'Enter Password';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20,),

              rounded_Button(
                  title: 'login',
                  loading: loading,
                  onTap: (){
                    if(FormKey.currentState!.validate()){
                      login();
                    }
                  }
                  ),

              Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                    onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context){
                        return ForgotPassword();
                      }));

                }, child: Text('Forgot Password?')),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Don\'t have an account?'),
                  TextButton(
                      onPressed: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context){
                          return Signupscreen();
                        }));
                      }, child: Text('sign up'))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }


  void login(){
    setState(() {
      loading = true;
    });
    auth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text
    ).then((value){
      utils().toast(value.user!.email.toString());
      setState(() {
        loading = false;
      });

      Navigator.of(context).push(MaterialPageRoute(builder: (context){
        return posts();
      }));
    }).onError((error, stackTrace){
      setState(() {
        loading = false;
      });
      debugPrint(error.toString());
      utils().toast(error.toString());
    });
  }
}