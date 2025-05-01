void greet() {
  print('hello world!');
}

int addition() {
  var val1 = 687;
  var val2 = 675;
  return val1 + val2;
}

double subtraction(double val1, double val2) {
  return val1 - val2;
}

void multiplication({var val1 = 1, var val2}) {
  print(val1 * val2);
}

String myName() => 'naeeb';

void main() {
  greet();
  print(addition());
  print(subtraction(8, 5));
  multiplication(val1: 6, val2: 8);
  multiplication(val2: 9);
  print(myName());
}
