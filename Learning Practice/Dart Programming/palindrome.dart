import 'dart:io';

void main() {
  stdout.write('Enter a string for checking palindrome: ');
  var input = stdin.readLineSync();

  // Remove spaces and punctuation, and convert to lowercase
  var text = input!.replaceAll(RegExp(r'\W+'), '').toLowerCase();

  // Check if the text is a palindrome
  if (text == text.split('').reversed.join()) {
    print('$input is a palindrome.');
  } else {
    print('$input is not a palindrome.');
  }
}
