import 'package:flutter/material.dart';
import 'package:multi_provider/provider/favourite/favourite_provider.dart';
import 'package:provider/provider.dart';

class favouriteList extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    final favProvider = Provider.of<favouriteProvider>(context);
    favProvider.selectedItem.sort();

    return Scaffold(
      appBar: AppBar(
        title: Text('Favourite Item'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView.builder(
          itemCount: favProvider.selectedItem.length,
          itemBuilder: (context,index){
            return Consumer<favouriteProvider>(builder: (context,value,child){
              return InkWell(
                onTap: (){
                  value.removeItemAt(index);
                },
                child: ListTile(
                  title: Text('item ${value.selectedItem[index]}'),
                  trailing: Icon(Icons.favorite),
                ),
              );
            });
          }),
    );
  }
}