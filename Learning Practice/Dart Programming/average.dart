import 'dart:io';

void main() {
  myfuct(double x, double y, double z) {
    double avg = (x + y + z) / 3;
    print('sum : $avg');
  }

  print('Enter first number : ');
  double num1 = double.parse(stdin.readLineSync()!);
  print('Enter second number : ');
  double num2 = double.parse(stdin.readLineSync()!);
  print('Enter third number : ');
  double num3 = double.parse(stdin.readLineSync()!);

  myfuct(num1, num2, num3);
}
