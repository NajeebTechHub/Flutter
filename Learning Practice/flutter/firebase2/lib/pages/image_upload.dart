import 'package:firebase2/widgets/RoundedButton.dart';
import 'package:firebase2/widgets/utils.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_database/firebase_database.dart';



class image_upload extends StatefulWidget {
  const image_upload({super.key});

  @override
  State<image_upload> createState() => _image_uploadState();
}

class _image_uploadState extends State<image_upload> {

  File? image;
  final picker = ImagePicker();

  bool loading = false;

  DatabaseReference databaseRef = FirebaseDatabase.instance.ref('posts');

  Future<void> getImageFromGallery()async{
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if(pickedFile != null){
      setState(() {
        image = File(pickedFile.path);
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

      databaseRef.push().set( {
        'title' : downloadURL,
        'id' : DateTime.now().microsecondsSinceEpoch.toString()
      }).then((value){
        utils().toast('image uploaded');

        setState(() {
          loading = false;
        });
      }).onError((error,stackTrace){
        utils().toast(error.toString());

        setState(() {
          loading = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('upload image',style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.blue,
        iconTheme: IconThemeData(
          color: Colors.white
        ),
      ),
      backgroundColor: Colors.blue[200],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: getImageFromGallery,
                child: Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black
                    )
                  ),
                  child: image != null ? Image.file(image!) : Icon(Icons.image),
                ),
              ),
              SizedBox(height: 20,),
              RoundedButton(
                loading: loading,
                  title: 'upload',
                  onTap: (){
                    uploadImage();
                  })
            ],
          ),
        ),
      ),
    );
  }
}
