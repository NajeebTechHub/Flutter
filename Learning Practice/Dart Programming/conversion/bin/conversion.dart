import 'dart:io';

void main() {
  int dollar,ropees;
  stdout.write('Enter your amount in dollar : ');
  dollar=int.parse(stdin.readLineSync()!);
  ropees=dollar*216;
  print('Your amount in ropees is =$ropees ');


}
