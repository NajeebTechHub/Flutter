import 'package:flutter/material.dart';

class notifyListner extends StatelessWidget{

  ValueNotifier<int> count = ValueNotifier(0);

  ValueNotifier<bool> toggle = ValueNotifier(true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listner'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: ValueListenableBuilder(
            valueListenable: count,
            builder: (context,value,child){
              return Text(count.value.toString());
            },
          )),

          ValueListenableBuilder(
              valueListenable: toggle,
              builder: (context,value,child){
                return TextField(
                  obscureText: toggle.value,
                  decoration: InputDecoration(
                      hintText: 'enter password',
                      suffixIcon: InkWell(
                          onTap: (){
                            toggle.value = !toggle.value;
                          },
                          child: Icon(toggle.value ? Icons.visibility_off : Icons.visibility))
                  ),
                );
              })

        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          count.value++;
        },
        child: Icon(Icons.add),
      ),
    );
  }
}