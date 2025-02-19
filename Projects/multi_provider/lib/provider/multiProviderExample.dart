import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multi_provider/provider/multi_provider.dart';
import 'package:provider/provider.dart';

class multiProviderExample extends StatefulWidget{

  @override
  State<multiProviderExample> createState() => _multiProviderExampleState();
}

class _multiProviderExampleState extends State<multiProviderExample> {



  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: Text('multi provider'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<multiProvider>(
              builder: (context,valuee,child){
                return  Slider(
                    value: valuee.value,
                    onChanged: (val){
                      valuee.setValue(val);
                    });
              }),

          Consumer<multiProvider>(builder: (context,valuee,child){
            return  Row(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.green.withOpacity(valuee.value),
                    height: 100,
                    child: Center(child: Text('container 1')),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.red.withOpacity(valuee.value1),
                    height: 100,
                    child: Center(child: Text('container 2')),
                  ),
                )
              ],
            );
          })


        ],
      ),
    );
  }
}