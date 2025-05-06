import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase2/pages/auth/login_screen.dart';
import 'package:firebase2/pages/image_upload.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'add_post.dart';

class posts_screen extends StatefulWidget {
   posts_screen({super.key});

  @override
  State<posts_screen> createState() => _posts_screenState();
}

class _posts_screenState extends State<posts_screen> {
  final firestore = FirebaseFirestore.instance.collection('users').snapshots();

  final ref = FirebaseFirestore.instance.collection('users');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      appBar: AppBar(
        title: Text('Post Screen',style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.blue,
        iconTheme: IconThemeData(
          color: Colors.white
        ),
        actions: [
          IconButton(onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context){
              return login_screen();
            }));
          }, icon: Icon(Icons.logout,color: Colors.white,)),
        ],
      ),
      body: Column(
        children: [
          StreamBuilder(
              stream: firestore,
              builder: (BuildContext context, AsyncSnapshot snapshot){
                if(snapshot.connectionState == ConnectionState.waiting)
                  return CircularProgressIndicator();

                if(snapshot.hasError)
                  return Text('some error');

                return Expanded(
                    child: ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context,index){
                        return ListTile(
                          title: Text(snapshot.data!.docs[index]['title'].toString()),
                          subtitle: Text(snapshot.data!.docs[index]['id'].toString()),
                          trailing: SizedBox(
                            width: 100,
                            child: Row(
                              children: [
                                IconButton(onPressed: (){
                                  ref.doc(snapshot.data!.docs[index]['id'].toString()).delete();
                                }, icon: Icon(Icons.delete)),
                                IconButton(onPressed: (){
                                  final upd = TextEditingController();
                                  showDialog(
                                      context: context,
                                      builder: (context){
                                        return AlertDialog(
                                          title: Text('update dialog'),
                                          content: TextFormField(
                                            controller: upd,
                                          ),
                                          actions: [
                                            ElevatedButton(onPressed: (){
                                              Navigator.of(context).pop();
                                            }, child: Text('cancel'),),
                                            ElevatedButton(onPressed: (){
                                              ref.doc(snapshot.data.docs[index]['id'].toString()).update({
                                                'title':upd.text
                                              });
                                              Navigator.of(context).pop();
                                            }, child: Text('update'))
                                          ],
                                        );
                                      });
                                }, icon: Icon(Icons.update))
                              ],
                            ),
                          ),
                        );
                        }));
              })
        ],
      ),

      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            backgroundColor: Colors.blue,
            onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context){
                return addPost_screen();
              }));
            },
            child: Icon(Icons.add,color: Colors.white,),
          ),

          SizedBox(width: 150,),

          FloatingActionButton(
            backgroundColor: Colors.blue,
              onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context){
                return image_upload();
              }));
              },child: Icon(Icons.image,color: Colors.white,),
              )
        ],
      ),
    );
  }

void update(){

}
}
