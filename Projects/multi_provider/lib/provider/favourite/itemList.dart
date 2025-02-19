import 'package:flutter/material.dart';
import 'package:multi_provider/provider/favourite/favourite_list.dart';
import 'package:multi_provider/provider/favourite/favourite_provider.dart';
import 'package:provider/provider.dart';

class itemList extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    // final favProvider = Provider.of<favouriteProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Item List'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        actions: [
          IconButton(onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context){
              return favouriteList();
            }));
          }, icon: Icon(Icons.favorite))
        ],
      ),
      body: ListView.builder(
        itemCount: 100,
          itemBuilder: (context,index){
            return Consumer<favouriteProvider>(builder: (context,value,child){
              return InkWell(
                onTap: (){
                  if(value.selectedItem.contains(index)){
                    value.removeItem(index);
                  }else{
                    value.addItem(index);
                  }
                },
                child : ListTile(
                  title: Text('item $index'),
                  trailing: Icon(value.selectedItem.contains(index) ? Icons.favorite : Icons.favorite_border_outlined),
                ),
              );
            });
          }),
    );
  }
}