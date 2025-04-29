import 'package:expenses_tracker/services/database_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class IncomeEntry extends StatefulWidget{
  @override
  State<IncomeEntry> createState() => _IncomeEntryState();
}

class _IncomeEntryState extends State<IncomeEntry> {
  final database = DatabaseServices();
  DateTime? selectedDate = DateTime.now();
  TextEditingController amount = TextEditingController();
  String? selectedCategory;
  TextEditingController desc = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          shadowColor: Colors.black.withOpacity(0.9),
          elevation: 5,
          backgroundColor: Colors.teal,
          title: Text('Income Entry',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),),
          centerTitle: true,
        ),
        backgroundColor: Colors.tealAccent[100],
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              ListTile(
                title: Text('Date'),
                subtitle: Text(DateFormat.yMMMd().format(selectedDate!)),
                trailing: Icon(Icons.calendar_today),
                onTap: () => pickDate(context),
              ),
              TextField(
                controller: amount,
                decoration: InputDecoration(label: Text('Amount')),
                keyboardType: TextInputType.number,
              ),
              DropdownButtonFormField(
                  hint: Text('category'),
                  value: selectedCategory,

                  items: [
                    DropdownMenuItem(child: Text('Salary',),value: 'salary',),
                    DropdownMenuItem(child: Text('Rental Income',),value: 'rent',),
                    DropdownMenuItem(child: Text('business Income',),value: 'business',),
                    DropdownMenuItem(child: Text('Investment Income',),value: 'investment',),
                    DropdownMenuItem(child: Text('Others',),value: 'others',),

                  ],
                  onChanged: changeCategory),
              TextField(
                controller: desc,
                decoration: InputDecoration(label: Text('Description')),
                keyboardType: TextInputType.text,
              ),
              SizedBox(height: 20,),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.teal,
                      shadowColor: Colors.black.withOpacity(0.9),
                      elevation: 8
                  ),
                  onPressed: loadData,
                  child: Text('Save'))
            ],
          ),
        )
    );
  }
  void pickDate(BuildContext context)async{
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2000),
        lastDate: DateTime.now());
    if(picked != null && picked != selectedDate){
      setState(() {
        selectedDate = picked;
      });
    }
  }

  void changeCategory(value){
    setState(() {
      selectedCategory = value;
    });
  }

  void loadData()async {
    try {
      await database.addIncome(
          int.parse(amount.text),
          selectedCategory!,
          desc.text
      );
      amount.clear();
      selectedCategory = 'Category';
      desc.clear();
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Data Saved Successfully'))
      );
    }catch(e){
      print('error in saving data :$e');
  }
  }

}