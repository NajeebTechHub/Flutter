import 'dart:io';

void main() {
  print('Enter first number : ');
  int num1 = int.parse(stdin.readLineSync()!);
  print('Enter second number : ');
  int num2 = int.parse(stdin.readLineSync()!);
  print('Enter third number : ');
  int num3 = int.parse(stdin.readLineSync()!);

  add(num1, num2, num3);
  average(num1, num2, num3);
}

add(int x, int y, int z) {
  int sum = x + y + z;
  print('The Sum is : $sum');
}

average(int x, int y, int z) {
  double avg = (x + y + z) / 3;
  print('The average is : $avg');
}
