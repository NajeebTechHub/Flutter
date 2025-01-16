import 'dart:io';

void main() {
  // Take input from user
  stdout.write('Enter first number : ');
  var n1 = double.parse(stdin.readLineSync()!);

  stdout.write('Enter second number : ');
  var n2 = double.parse(stdin.readLineSync()!);

  stdout.write("""
1:Addition
2:Subtraction
3:Multiplication
4:Devision
""");
  stdout.write('Enter your choice : ');
  var choice = int.parse(stdin.readLineSync()!);

  switch (choice) {
    case 1:
      print(n1 + n2);
      break;
    case 2:
      print(n1 - n2);
      break;
    case 3:
      print(n1 * n2);
      break;
    case 4:
      print(n1 / n2);
      break;
    default:
      print('Wrong choice');
  }
}
