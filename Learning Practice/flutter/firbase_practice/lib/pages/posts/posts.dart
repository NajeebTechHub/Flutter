import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firbase_practice/pages/auth/LoginScreen.dart';
import 'package:firbase_practice/pages/posts/add_post.dart';
import 'package:firbase_practice/pages/upload_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class posts extends StatefulWidget {
  const posts({super.key});

  @override
  State<posts> createState() => _postsState();
}

class _postsState extends State<posts> {

  final firestore = FirebaseFirestore.instance.collection('users').snapshots();
  final ref = FirebaseFirestore.instance.collection('users');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Posts Screen',style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.brown,
        iconTheme: IconThemeData(
          color: Colors.white
        ),
        actions: [
          IconButton(onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context){
              return LoginScreen();
            }));
          }, icon: Icon(Icons.logout,color: Colors.white,))
        ],
      ),
      backgroundColor: Colors.brown[200],
      body: Column(
        children: [
          SizedBox(height: 10,),
          StreamBuilder(
              stream: firestore,
              builder: (BuildContext context,AsyncSnapshot snapshot){
                if(snapshot.connectionState == ConnectionState.waiting){
                  return CircularProgressIndicator();
                }
                if(snapshot.hasError){
                  return Text('has error');
                }

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
                                ref.doc(snapshot.data!.docs[index]['id']).delete();
                              }, icon: Icon(Icons.delete)),
                              IconButton(onPressed: (){
                                final updatedPost = TextEditingController();
                                showDialog(
                                    context: context,
                                    builder: (context){
                                      return AlertDialog(
                                        backgroundColor: Colors.brown,
                                        title: Center(child: Text('update title',style: TextStyle(color: Colors.white),)),
                                        content: TextFormField(
                                          controller: updatedPost,
                                        ),
                                        actions: [
                                          TextButton(onPressed: (){
                                            Navigator.of(context).pop();
                                          }, child: Text('cancel',style: TextStyle(color: Colors.white))),
                                          TextButton(onPressed: (){
                                            ref.doc(snapshot.data!.docs[index]['id']).update({
                                              'title' : updatedPost.text,
                                            });
                                            Navigator.of(context).pop();
                                          }, child: Text('update',style: TextStyle(color: Colors.white)))
                                        ],
                                      );
                                    });
                              }, icon: Icon(Icons.update))
                            ],
                          ),
                        ),
                      );
                      }),
                );
              })
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            heroTag: 'add post',
            backgroundColor: Colors.brown,
            onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context){
                return add_post();
              }));
            },
            child: Icon(Icons.add,color: Colors.white,),
          ),

          SizedBox(width: 150,),

          FloatingActionButton(
            heroTag: 'upload image',
            backgroundColor: Colors.brown,
            onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context){
              return upload_image();
            }));
          },child: Icon(Icons.image,color: Colors.white,),)
        ],
      ),
    );
  }
}
