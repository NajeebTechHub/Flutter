import "dart:io";

void main() {
 /* print("welcome");
  print("peshawar");

  stdout.write("welcome");
  stdout.write(" peshawar");*/

 /* print(10 + 5);
  print(10 - 5);
  print(10 * 5);
  print(10 / 5);
  print(20 ~/ 5);
  print(21 % 5);*/

 /* int num1, num2, result;
  num1 = 10;
  num2 = 5;

  print("First number = $num1");
  print("second number = $num2");

  print("First number = " + num1.toString());
  print('second number = ' + num2.toString());

  result = num1 + num2;

  print("The result is = $result");*/

  /*String firstName, lastName, fullName;
  firstName = 'Najeeb ';
  lastName = 'Anjum';
  fullName = firstName + lastName;
  print(fullName);

  int num = 10;
  print("sum = ${num + 20}");*/

  /*String name;
  stdout.write("Enter your name :");
  name = stdin.readLineSync()!;
  print("welcome $name");*/

  /*String num1, num2;
  num1 = '10 ';
  num2 = '5';

  print(num1 + num2);
  int n1 = int.parse(num1);
  int n2 = int.parse(num2);
  print(n1 + n2);*/

  /*int n1, n2, result;

  stdout.write("Enter first number :");
  n1 = int.parse(stdin.readLineSync()!);

  stdout.write("Enter second number :");
  n2 = int.parse(stdin.readLineSync()!);

  result = n1 + n2;
  print("The result is = $result");*/

  /*int eng,urdu,math,isl,sci,ps,obt;
  double per;

  stdout.write("Enter your English marks : ");
  eng = int.parse(stdin.readLineSync()!);

  stdout.write("Enter your urdu marks : ");
  urdu = int.parse(stdin.readLineSync()!);

  stdout.write("Enter your maths marks : ");
  math = int.parse(stdin.readLineSync()!);

  stdout.write("Enter your isl marks : ");
  isl = int.parse(stdin.readLineSync()!);

  stdout.write("Enter you science marks : ");
  sci = int.parse(stdin.readLineSync()!);

  stdout.write("Enter your ps marks : ");
  ps = int.parse(stdin.readLineSync()!);

  obt = eng + urdu + math + isl +sci + ps ;
  stdout.write("Your obtained marks is : $obt \n");

  per = obt/600*100;
  stdout.write("Your persentage is : $per");*/

 /* int dollar;
  double rate , rupees;

  stdout.write("Enter Dollar : ");
  dollar = int.parse(stdin.readLineSync()!);

  stdout.write("Enter Dollar rate : ");
  rate = double.parse(stdin.readLineSync()!);

  rupees = dollar * rate;
  stdout.write("Your rupees  is : $rupees");*/

  /*int a, b,c;
  a = 10;
  b = 20;
  print("Before swapping : $a , $b");

  c = a;
  a = b;
  b = c;

  print("After swapping : $a , $b ");*/

  /*int age;

  stdout.write("Enter your age : ");
  age = int.parse(stdin.readLineSync()!);

  if(age <= 18)
    {
      stdout.write("You are eligible ");
    }
  else
    {
      stdout.write("You are not eligible ");
    }*/

 /* int number;

  stdout.write("Enter a Number : ");
  number = int.parse(stdin.readLineSync()!);

  if(number%2 == 0)
    {
      stdout.write("This number is even");
    }
  else
    {
      stdout.write("This number is odd");
    }*/

 /* int num;

  stdout.write("Enter a Number : ");
  num = int.parse(stdin.readLineSync()!);

  if(num > 0){
    stdout.write("Positive");
  }
  else if(num < 0){
    stdout.write("Negative");
  }
  else{
    stdout.write("Natural");
  }*/

 /* int num1, num2, choice;

  stdout.write("Enter first number : ");
  num1 = int.parse(stdin.readLineSync()!);

  stdout.write("Enter second number : ");
  num2 = int.parse(stdin.readLineSync()!);

  String message = '''
  1.Add
  2.Sub
  3.Mul
  4.Dev
  ''';
  print(message);

  stdout.write("Enter your choice : ");
  choice = int.parse(stdin.readLineSync()!);

  *//*if(choice == 1){

    print("Result : ${num1 + num2}");
  }
  if(choice == 2){
    print("Result : ${num1 - num2}");
  }
  if(choice == 3){
    print("Result : ${num1 * num2}");
  }
  if(choice == 4){
    print("Result : ${num1 / num2}");
  }
  if(choice > 4){
    print("Invalid choice");
  }*//*

  switch(choice){
    case 1:
      print("sum : ${num1 + num2}");
      break;
    case 2:
      print("sub : ${num1 - num2}");
      break;
    case 3:
      print("mul : ${num1 * num2}");
      break;
    case 4:
      print("Dev : ${num1 / num2}");
      break;
    default :
      print("invalid choice");

  }
*/

  /*int n1=10, n2=20, l;
  l = (n1 > n2)? n1 : n2;
  print("large number is : $l");*/
}
