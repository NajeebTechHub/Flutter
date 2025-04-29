import 'package:expenses_tracker/services/database_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class ExpenseEntry extends StatefulWidget{
  @override
  State<ExpenseEntry> createState() => _ExpenseEntryState();
}

class _ExpenseEntryState extends State<ExpenseEntry> {
  DateTime? selectedDate = DateTime.now();
  TextEditingController amount = TextEditingController();
  String? selectedCategory;
  TextEditingController desc = TextEditingController();

  final database = DatabaseServices();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          shadowColor: Colors.black.withOpacity(0.9),
          elevation: 5,
          backgroundColor: Colors.teal,
          title: Text('Expense Entry',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),),
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
                    DropdownMenuItem(child: Text('Food',),value: 'food',),
                    DropdownMenuItem(child: Text('Entertainment',),value: 'entertainment',),
                    DropdownMenuItem(child: Text('Healthcare',),value: 'health',),
                    DropdownMenuItem(child: Text('Transportation',),value: 'transport',),
                    DropdownMenuItem(child: Text('Housing',),value: 'housing',),
                    DropdownMenuItem(child: Text('Education',),value: 'education',),
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
                  onPressed: loadData, child: Text('Save')),
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

  void loadData() async {
    try {
      await database.addExpense(
        int.parse(amount.text),
        selectedCategory!,
        desc.text,
      );
      amount.clear();
      selectedCategory = null;
      desc.clear();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Data Saved Successfully')),
      );
    } catch (e) {
      print('Error saving data: $e');
    }
  }

}
