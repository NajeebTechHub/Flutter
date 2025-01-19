import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firbase_practice/widgets/rounded_button.dart';
import 'package:firbase_practice/widgets/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class add_post extends StatefulWidget {
  const add_post({super.key});

  @override
  State<add_post> createState() => _add_postState();
}

class _add_postState extends State<add_post> {

  final postController = TextEditingController();
  final FormKey = GlobalKey<FormState>();
  final firestore = FirebaseFirestore.instance.collection('users');
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[200],
      appBar: AppBar(
        title: Text('add post',style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.brown,
        iconTheme: IconThemeData(
          color: Colors.white
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Form(
              key: FormKey,
                child: TextFormField(
                  controller: postController,
                  maxLines: 4,
                  decoration: InputDecoration(
                    hintText: 'what is an your mind?',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                    )
                  ),
                  validator: (value){
                    if(value!.isEmpty){
                      return 'required';
                    }
                    return null;
                  },
                ),
            ),
            SizedBox(height: 20,),
            rounded_Button(
                title: 'add post',
                loading: loading,
                onTap: (){
                  if(FormKey.currentState!.validate()){
                    setState(() {
                      loading = true;
                    });
                    String id = DateTime.now().microsecondsSinceEpoch.toString();
                    firestore.doc(id).set({
                      'title' : postController.text.toString(),
                      'id' : id
                    }).then((value){
                      setState(() {
                        loading = false;
                      });
                      utils().toast('post added');
                    }).onError((error,stackTrace){
                      setState(() {
                        loading = false;
                      });
                      utils().toast(error.toString());
                    });
                  }
                })
          ],
        ),
      ),
    );
  }
}
