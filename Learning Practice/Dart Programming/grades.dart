import 'dart:io';

void main() {
  // Take input marks from user
  stdout.write('Enter your Marks : ');
  var input = stdin.readLineSync();
  var marks = int.parse(input!);

  if (marks >= 90) {
    print('Grade A');
  } else if (marks >= 80 && marks < 90) {
    print('Grade B');
  } else if (marks >= 70 && marks < 80) {
    print('Grade C');
  } else {
    print('Grade F (Fail)');
  }
}
