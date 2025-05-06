import 'package:firebase2/pages/auth/login_screen.dart';
import 'package:firebase2/widgets/RoundedButton.dart';
import 'package:firebase2/widgets/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:vm_service/utils.dart';

class signup_screen extends StatefulWidget {
  const signup_screen({super.key});

  @override
  State<signup_screen> createState() => _signup_screenState();
}

class _signup_screenState extends State<signup_screen> {

  final FormKey = GlobalKey<FormState>();
  bool loading = false;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Signup screen',style: TextStyle(color: Colors.white),),
        automaticallyImplyLeading: true,
        iconTheme: IconThemeData(
          color: Colors.white
        ),
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
                        }
                        else{
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
                title: 'singup',
                onTap: (){
                  if(FormKey.currentState!.validate()){
                    setState(() {
                      loading = true;
                    });
                    auth.createUserWithEmailAndPassword(
                        email: emailController.text,
                        password: passwordController.text).then((value){
                          setState(() {
                            loading = false;
                          });

                          utils().toast('account created successfully');
                    }).onError((error,stackTrace){
                      setState(() {
                        loading = false;
                      });
                      utils().toast(error.toString());
                    });
                  };
                }),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Already have an account?'),
                TextButton(onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context){
                    return login_screen();
                  }));
                }, child: Text('login'))
              ],
            )

          ],
        ),
      ),
    );
  }
}
