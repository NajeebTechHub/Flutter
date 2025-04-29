import 'package:expenses_tracker/screens/Income_Entry.dart';
import 'package:expenses_tracker/screens/LoginScreen.dart';
import 'package:expenses_tracker/screens/settings.dart';
import 'package:expenses_tracker/services/database_services.dart';
import 'package:flutter/material.dart';
import 'Expense_Entry.dart';
import 'package:expenses_tracker/screens/Notification.dart';


class Homescreen extends StatefulWidget {
  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final database = DatabaseServices();
  final notification = NotificationClass();

  List expenses = [];
  List incomes = [];
  int totalExpenses = 0;
  int totalIncome = 0;
  int total = 0;
  bool showIncome = true;
  int id = 0;
  final int lowBalanceThreshold = 100;

  @override
  void initState() {
    super.initState();
    getExpenseData();
    getIncomeData();
    fetchTotalExpenses().then((_) {
      fetchTotalIncome().then((_) {
        checkLowBalance();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.tealAccent[100],
      appBar: AppBar(
        shadowColor: Colors.black.withOpacity(0.9),
        elevation: 5,
        backgroundColor: Colors.teal,
        title: Text(
          'ExpensePro',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.white,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          }
        ),
      ),

      drawer: Drawer(
        backgroundColor: Colors.tealAccent[100],
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.teal[600],
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: Offset(0,3)
                  )
                ]
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home, color: Colors.teal[400]),
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.add, color: Colors.teal[400]),
              title: Text('Add Expense'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => IncomeEntry()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.add, color: Colors.teal[400]),
              title: Text('Add Income'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ExpenseEntry()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.settings, color: Colors.teal[400]),
              title: Text('Settings'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context){
                  return SettingsPage();
                }));
              },
            ),
            ListTile(
              leading: Icon(Icons.logout, color: Colors.teal),
              title: Text('Logout'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
            ),
          ],
        ),
      ),


      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
            child: Card(
              shadowColor: Colors.black.withOpacity(0.9),
              elevation: 8,
              color: Colors.grey[300],
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      'Balance',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal[900],
                      ),
                    ),
                    Text(
                      'Rs. ${totalBalance().toString()}',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrangeAccent,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              'Income',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.teal[900],
                              ),
                            ),
                            Text(
                              'Rs. $totalIncome',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.green[700],
                              ),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              'Expenses',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.teal[900],
                              ),
                            ),
                            Text(
                              'Rs. $totalExpenses',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.red[700],
                              ),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    showIncome = true;
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: showIncome ? Colors.teal[600] : Colors.grey[300],
                  foregroundColor: showIncome ? Colors.white : Colors.black,
                  shadowColor: Colors.black.withOpacity(1),
                  elevation: 5
                ),
                child: Text(
                  'Income',
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    showIncome = false;
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: !showIncome ? Colors.teal : Colors.grey[300],
                  foregroundColor: !showIncome ? Colors.white : Colors.black,
                  shadowColor: Colors.black.withOpacity(0.9),
                  elevation: 5
                ),
                child: Text(
                  'Expenses',
                ),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  if (showIncome)
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            'Income List',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.teal[900],
                            ),
                          ),
                          Expanded(
                            child: ListView.builder(
                              itemCount: incomes.length,
                              itemBuilder: (context, index) {
                                final income = incomes[index];
                                return Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.teal[400],
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.3),
                                          spreadRadius: 1,
                                          blurRadius: 5,
                                          offset: Offset(0,3)
                                        )
                                      ]
                                    ),
                                    child: ListTile(
                                      title: Text(
                                        income['category'],
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      subtitle: Text(
                                        income['description'],
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      trailing: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          IconButton(
                                            icon: Icon(Icons.edit,
                                                color: Colors.grey[350]),
                                            onPressed: () {
                                              showUpdateDialog(context, income, true);
                                            },
                                          ),
                                          IconButton(
                                            icon: Icon(Icons.delete,
                                                color: Colors.grey[350]),
                                            onPressed: () {
                                              showDeleteDialog(income, true);
                                            },
                                          ),
                                          Text(
                                            'Rs. ${income['amount'].toString()}',
                                            style: TextStyle(
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),


                  if (!showIncome)
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            'Expense List',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.teal[900],
                            ),
                          ),
                          Expanded(
                            child: ListView.builder(
                              itemCount: expenses.length,
                              itemBuilder: (context, index) {
                                final expense = expenses[index];
                                return Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.teal[400],
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.3),
                                          spreadRadius: 1,
                                          blurRadius: 5,
                                          offset: Offset(0,3),
                                        )
                                      ]
                                    ),
                                    child: ListTile(
                                      title: Text(
                                        expense['category'],
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      subtitle: Text(
                                        expense['description'],
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      trailing: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          IconButton(
                                            icon: Icon(Icons.edit,
                                                color: Colors.grey[350]),
                                            onPressed: () {
                                              showUpdateDialog(context, expense, false);
                                            },
                                          ),
                                          IconButton(
                                            icon: Icon(Icons.delete,
                                                color: Colors.grey[350]),
                                            onPressed: () {
                                              showDeleteDialog(expense, false);
                                            },
                                          ),
                                          Text(
                                            'Rs. ${expense['amount'].toString()}',
                                            style: TextStyle(
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          )
        ],
      ),
    );

  }

  void getExpenseData() async {
    final data = await database.getExpense();
    setState(() {
      expenses = data;
    });
  }

  void getIncomeData() async {
    final data = await database.getIncome();
    setState(() {
      incomes = data;
    });
  }

  Future<void> fetchTotalExpenses() async {
    final total = await database.getTotalExpenses();
    setState(() {
      totalExpenses = total;
    });
  }

  Future<void> fetchTotalIncome() async {
    final total = await database.getTotalIncome();
    setState(() {
      totalIncome = total;
    });
  }


  int totalBalance() {
    total =  totalIncome - totalExpenses;
    return total;
  }



  void checkLowBalance() async{
    // setState(() {
      total = totalIncome - totalExpenses;
      print('Total Balance: $total');

      if (total < lowBalanceThreshold){
         await notification.showNotification();
      }
    // });
  }


  void showUpdateDialog(BuildContext context, Map<String, dynamic> item, bool isIncome) {
    final categoryController = TextEditingController(text: item['category']);
    final descriptionController = TextEditingController(text: item['description']);
    final amountController = TextEditingController(text: item['amount'].toString());

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(isIncome ? 'Update Income' : 'Update Expense'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: categoryController,
                decoration: InputDecoration(labelText: 'Category'),
              ),
              TextField(
                controller: descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
              ),
              TextField(
                controller: amountController,
                decoration: InputDecoration(labelText: 'Amount'),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Update'),
              onPressed: () async {
                if (isIncome) {
                  await database.updateIncome(
                    item['id'],
                    int.parse(amountController.text),
                    categoryController.text,
                    descriptionController.text,
                  );
                } else {
                  await database.updateExpense(
                    item['id'],
                    int.parse(amountController.text),
                    categoryController.text,
                    descriptionController.text,
                  );
                }
                Navigator.of(context).pop();
                setState(() {
                  getExpenseData();
                  getIncomeData();
                  fetchTotalExpenses();
                  fetchTotalIncome();
                  checkLowBalance();
                });
              },
            ),
          ],
        );
      },
    );
  }


  void showDeleteDialog(Map<String, dynamic> item, bool isIncome) {
    final id = item['id'] as int;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(isIncome ? 'Delete Income' : 'Delete Expense'),
          content: Text('Are you sure you want to delete this ${isIncome ? 'income' : 'expense'}?'),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Delete'),
              onPressed: () async {
                Navigator.of(context).pop();

                if (isIncome) {
                  await database.deleteIncome(id);
                } else {
                  await database.deleteExpense(id);
               }
                getIncomeData();
                getExpenseData();
                fetchTotalIncome();
                fetchTotalExpenses();

              },
            ),
          ],
        );
      },
    );
  }

}
