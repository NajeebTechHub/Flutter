import 'dart:io';
import 'package:firbase_practice/widgets/rounded_button.dart';
import 'package:firbase_practice/widgets/utils.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class upload_image extends StatefulWidget {
  const upload_image({super.key});

  @override
  State<upload_image> createState() => _upload_imageState();
}

class _upload_imageState extends State<upload_image> {

  bool loading = false;

  File? image;
  final picker = ImagePicker();

  final databaseRef = FirebaseDatabase.instance.ref('posts');

  Future<void> getImageFromGallery()async{
      final pickedImage = await picker.pickImage(source: ImageSource.gallery);

      if(pickedImage != null){
        setState(() {
          image = File(pickedImage.path);
        });
    }
  }

  Future<void> uploadImage()async{
    setState(() {
      loading = true;
    });

    if(image != null){
      final storageRef = FirebaseStorage.instance.ref('/images/${DateTime.now().microsecondsSinceEpoch}.jpg');

      await storageRef.putFile(image!);

      final downloadURL = await storageRef.getDownloadURL();

      databaseRef.push().set({
        'title' : downloadURL,
        'id' : DateTime.now().microsecondsSinceEpoch.toString()
      }).then((value){
        setState(() {
          loading = false;
        });
        utils().toast('image uploaded');
      }).onError((error,stackTrace){
        utils().toast(error.toString());
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('upload image',style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.brown,
        iconTheme: IconThemeData(
          color: Colors.white
        ),
      ),
      backgroundColor: Colors.brown[200],
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: getImageFromGallery,
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black
                  )
                ),
                child: image != null ? Image.file(image!): Icon(Icons.image),
              ),
            ),
            SizedBox(height: 20,),
            rounded_Button(
              loading: loading,
                title: 'upload image',
                onTap: (){
                  uploadImage();
                })
          ],
        ),
      ),
    );
  }
}
