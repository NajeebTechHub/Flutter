import 'dart:io';

void main() {
  myfuct(int x, int y) {
    int sum = x + y;
    print('sum : ' + sum);
  }

  print('Enter first number : ');
  int num1 = int.parse(stdin.readLineSync()!);
  print('Enter second number : ');
  int num2 = int.parse(stdin.readLineSync()!);

  myfuct(num1, num2);
}
