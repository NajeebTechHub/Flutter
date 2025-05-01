import 'dart:io';

Future<bool> login(String inputuserName, String inputPassword) async {
  String userName = 'najeeb';
  String password = '123';

  await Future.delayed(Duration(seconds: 3));

  try {
    if (inputuserName == userName && inputPassword == password) {
      print('login successful');
      return true;
    } else {
      throw Exception('login failed, invalid credential');
    }
  } catch (e) {
    print('Error : $e');
    return false;
  }
}

Future<String> fetchData(String userName, String password) async {
  print('loading...');
  bool isLogin = await login(userName, password);

  var userData = {
    'Name': userName,
    'age': 21,
    'address': 'mardan',
    'phone': 03123456678,
    'email': 'anjumnajeeb@gmail.com'
  };

  print('Data fetching...');
  await Future.delayed(Duration(seconds: 3));
  try {
    if (isLogin) {
      // print('$userData');
      return '''
Name    : ${userData['Name']}
Age     : ${userData['age']}
Address : ${userData['address']}
Phone   : ${userData['phone']}
Email   : ${userData['email']}

''';
    } else {
      throw Exception('data can\'t fetch');
    }
  } catch (e) {
    return 'Error : $e';
  }
}

void main() async {
  print('Enter user name');
  var userName = stdin.readLineSync();
  print('Enter password');
  var password = stdin.readLineSync();

  print(await fetchData(userName!, password!));
}
