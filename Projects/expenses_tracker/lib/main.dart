import 'package:expenses_tracker/screens/Expense_Entry.dart';
import 'package:expenses_tracker/screens/HomeScreen.dart';
import 'package:expenses_tracker/screens/Income_Entry.dart';
import 'package:expenses_tracker/screens/LoginScreen.dart';
import 'package:expenses_tracker/screens/SignUpScreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();

  runApp(expense_tracker());
}

class expense_tracker extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FutureBuilder<bool>(
        future: checkLoginStatus(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else {
            return snapshot.data == true ? MainPage() : LoginScreen();
          }
        },
      ),
      routes: {
        '/login': (context) => LoginScreen(),
        // '/signup': (context) => SignupScreen(),
        '/main': (context) => MainPage(),
      },
    );
  }

  Future<bool> checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn') ?? false;
  }
}



class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Widget> pages = [Homescreen(), IncomeEntry(), ExpenseEntry()];
  int selected_page = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: selected_page < 3 ? pages[selected_page] : LoginScreen(),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 2,
              offset: Offset(0,-1)
            )
          ]
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.teal,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.money), label: 'Add Income'),
            BottomNavigationBarItem(icon: Icon(Icons.receipt), label: 'Add Expense'),
            BottomNavigationBarItem(icon: Icon(Icons.logout), label: 'Logout'),
          ],
          currentIndex: selected_page,
          onTap: change_page,
        ),
      ),
    );
  }

  void change_page(int index) {
    if (index == 3) {
      _logout();
    } else {
      setState(() {
        selected_page = index;
      });
    }
  }

  Future<void> _logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', false);
    Navigator.pushReplacementNamed(context, '/login');
  }
}
