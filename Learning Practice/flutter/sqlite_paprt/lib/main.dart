import 'package:flutter/material.dart';
import 'package:sqlite_paprt/services/dog_database.dart';
// import 'package:intl/intl.dart';

void main() {
  runApp(DogsApp());
}

class DogsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false, // Optional: Removes the debug banner
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final database = dogDatabase();
  List dogsList = [];
  final TextEditingController tcId = TextEditingController();
  final TextEditingController tcName = TextEditingController();
  final TextEditingController tcAge = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dogs Database'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: tcId,
              decoration: const InputDecoration(labelText: 'Dog ID'),
              keyboardType: TextInputType.number,
            ),
            TextFormField(
              controller: tcName,
              decoration: const InputDecoration(labelText: 'Dog Name'),
            ),
            TextFormField(
              controller: tcAge,
              decoration: const InputDecoration(labelText: 'Dog Age'),
              keyboardType: TextInputType.number,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: insertDog,
                  child: const Text('Save'),
                ),
                ElevatedButton(
                  onPressed: getDog,
                  child: const Text('Show Dogs'),
                ),
              ],
            ),
            ElevatedButton(onPressed: simpleaDiolog, child: Text('select language')),
            Expanded(
              child: ListView.builder(
                itemCount: dogsList.length,
                itemBuilder: (context, index) {
                  final dogData = dogsList[index];
                  return ListTile(
                    key: ValueKey(dogData['id']),
                    title: Text('ID: ${dogData['id']}'),
                    subtitle: Text('Name: ${dogData['name']}'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () => showDelDialog(dogData['id']),
                          icon: const Icon(Icons.delete),
                        ),
                        IconButton(onPressed: showUpdate, icon: Icon(Icons.update)),
                        Text('Age: ${dogData['age']}'),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> insertDog() async {
    await database.inserDog(int.parse(tcId.text), tcName.text, int.parse(tcAge.text));




    tcId.clear();
    tcName.clear();
    tcAge.clear();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('data Saved Successfully'))
    );
  }

  Future<void> getDog() async {
    final data = await database.getDog();
    setState(() {
      dogsList = data;
    });
  }

  void showDelDialog(int id) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Delete Dog'),
          content: const Text('Are you sure you want to delete this dog?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                await database.deleteDog(id);
                getDog();
                Navigator.of(context).pop();
              },
              child: const Text('Delete'),)
          ],
        );
      },
    );
  }

  void showUpdate(){
    final updateId = TextEditingController();
    final updateName = TextEditingController();
    final updateAge = TextEditingController();

    showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: Text('Update Dialog'),
            content: Column(
              children: [
                TextField(controller: updateId,),
                TextField(controller: updateName,),
                TextField(controller: updateAge,)
              ],
            ),
            actions: [
              TextButton(onPressed: (){
                Navigator.of(context).pop();
              }, child: Text('cancel')),
              TextButton(onPressed: ()async{
                await database.updateDog(
                int.parse(updateId.text),
                    updateName.text,
                int.parse(updateAge.text));
                Navigator.of(context).pop();
                setState(() {
                  getDog();
                });
              }, child: Text('update')),
            ],
          );
        });
  }

  void simpleaDiolog(){
    showDialog(
        context: context,
        builder: (context){
          return SimpleDialog(
            title: Text('select Language'),
            children: [
              SimpleDialogOption(
                child: Text('English'),
                onPressed: (){
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content:Text("English selected")
                      )
                  );
                Navigator.of(context).pop();
          }
          ),
              SimpleDialogOption(
                  child: Text('Urdu'),
                  onPressed: (){
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content:Text("Urdu selected")
                      )
                    );
                    Navigator.of(context).pop();
                  }

              ),
          ],
          );
        });
  }
}
