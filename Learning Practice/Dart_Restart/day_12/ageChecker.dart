import 'dart:io';

class InvalidAgeException implements Exception {
  int age;
  InvalidAgeException(this.age);

  @override
  String toString() {
    return 'Access Denied! Invalid Age $age';
  }
}

void checkAge(int age) {
  if (age > 18) {
    print('Access Granted!');
  } else {
    throw InvalidAgeException(age);
  }
}

void main() {
  print('Enter your age : ');
  var input = int.tryParse(stdin.readLineSync()!);

  if (input == null) {
    print('Invalid input, please enter valid number');
    return;
  }

  try {
    checkAge(input);
  } catch (e) {
    print(e);
  } finally {
    print('verfication completed!');
  }
}
