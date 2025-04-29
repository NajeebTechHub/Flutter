// if_else
void ageCheck(int age) {
  if (age >= 18) {
    print('you are allowed');
  } else {
    print('you are not allowed');
  }
}

String grade(double marks) {
  if (marks >= 85) {
    return 'Grade A';
  } else if (marks < 85 && marks >= 68) {
    return 'Grade B';
  } else if (marks < 68 && marks >= 50) {
    return 'Grade C';
  } else {
    return 'fail';
  }
}

// Switch
void calculator(
    {String operator = '+', required double val1, required double val2}) {
  switch (operator) {
    case '+':
      print(val1 + val2);
    case '-':
      print(val1 - val2);
    case '*':
      print(val1 * val2);
    case '/':
      print(val1 / val2);
    default:
      print('invalid');
  }
}

void main() {
  ageCheck(18);
  print(grade(67));
  calculator(val1: 34, val2: 45, operator: '-');
}
