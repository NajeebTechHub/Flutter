import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_practice1/languageProvider.dart';
import 'package:provider/provider.dart';

class AddNotes extends StatelessWidget {
  AddNotes({super.key,});

  @override
  Widget build(BuildContext context) {

    var loc = AppLocalizations.of(context);
    final titleController = TextEditingController();
    final descriptionController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text(loc!.addNoteBar,),
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)!.title,
                  border: OutlineInputBorder()
              ),
            ),
            SizedBox(height: 10,),
            TextField(
              controller: descriptionController,
              maxLines: 3,
              decoration: InputDecoration(
                hintText: AppLocalizations.of(context)!.description,
                border: OutlineInputBorder()
              ),
            ),
            SizedBox(height: 10,),
            ElevatedButton(
                onPressed: (){
                  context.read<LanguageProvider>().addTitle(titleController.text.toString(),descriptionController.text.toString());
            }, child: Text(AppLocalizations.of(context)!.addNote))
          ],
        ),
      )
    );
  }
}
