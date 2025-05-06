import 'package:firebase2/widgets/RoundedButton.dart';
import 'package:firebase2/widgets/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class addPost_screen extends StatefulWidget {
  const addPost_screen({super.key});

  @override
  State<addPost_screen> createState() => _addPost_screenState();
}

class _addPost_screenState extends State<addPost_screen> {
  @override
  Widget build(BuildContext context) {

    final postController = TextEditingController();
    final firestore = FirebaseFirestore.instance.collection('users');
    bool loading = false;
    final FormKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white
        ),
        title: Text('add post',style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Colors.blue[200],
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Form(
              key: FormKey,
              child: TextFormField(
                controller: postController,
                maxLines: 4,
                decoration: InputDecoration(
                  hintText: 'What is in your mind?',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator : (value){
                  if(value!.isEmpty){
                    return 'required';
                  }
                  return null;
                }
              ),
            ),
            SizedBox(height: 20,),
            RoundedButton(
              loading: loading,
                title: 'add post',
                onTap: (){
                if(FormKey.currentState!.validate()){
                setState(() {
                  loading = true;
                });
                  String id = DateTime.now().microsecondsSinceEpoch.toString();
                  firestore.doc(id).set({
                    'title' : postController.text.toString(),
                    'id' : id,
                  }).then((value){
                    setState(() {
                      loading = false;
                    });
                    utils().toast('post added');
                  }).onError((error, stackTrace){
                    setState(() {
                      loading = false;
                    });
                    utils().toast(error.toString());
                  });
                }})
          ],
        ),
      ),
    );
  }
}
