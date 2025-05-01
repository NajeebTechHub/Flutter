import 'getter&setter.dart';

void main() {
  var p = new person();

  // not accesible directly
  // print(p._name);

  // access by using getter method
  print(p.name);
  print(p.age);

  // using setter
  p.changeName = 'anees';
  p.changeAge = 19;
  print(p.name);
  print(p.age);
}
