import 'package:firebase2/pages/auth/singup_screen.dart';
import 'package:firebase2/pages/firestore/posts_screen.dart';
import 'package:firebase2/widgets/RoundedButton.dart';
import 'package:firebase2/widgets/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class login_screen extends StatefulWidget {
  const login_screen({super.key});

  @override
  State<login_screen> createState() => _login_screenState();
}

class _login_screenState extends State<login_screen> {

  final FormKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final auth = FirebaseAuth.instance;

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login screen',style: TextStyle(color: Colors.white),),
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Colors.blue[200],
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              key: FormKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: 'Enter email',
                        prefixIcon: Icon(Icons.alternate_email)
                      ),
                      validator: (value){
                        if(value!.isEmpty){
                          return 'Enter email';
                        }else{
                          return null;
                        }
                      },
                    ),
                    TextFormField(
                      controller: passwordController,
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Enter password',
                        prefixIcon: Icon(Icons.lock)
                      ),
                      validator: (value){
                        if(value!.isEmpty){
                          return 'Enter password';
                        }else{
                          return null;
                        }
                      },
                    )
                  ],
                )),

            SizedBox(height: 30,),

            RoundedButton(
              loading: loading,
                title: 'login',
                onTap: (){
                  if(FormKey.currentState!.validate()){
                    login();
                  }
                }),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Don\'t have an account?'),
                TextButton(onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context){
                    return signup_screen();
                  }));
                }, child: Text('create account'))
              ],
            )

          ],
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
        password: passwordController.text).then((value){
          utils().toast(value.user!.email.toString());
          setState(() {
            loading = false;
          });
          Navigator.of(context).push(MaterialPageRoute(builder: (context){
            return posts_screen();
          }));
    }).onError((error,stackTrace){
      setState(() {
        loading = false;
      });
      debugPrint(error.toString());
      utils().toast(error.toString());
    });
  }
}
