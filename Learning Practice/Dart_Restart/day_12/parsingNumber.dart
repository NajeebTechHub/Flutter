import 'dart:io';

void parseNumber(String input) {
  try {
    var convertToNumber = int.parse(input);
    print('Convered Number : $convertToNumber');
  } catch (e) {
    print('Error : Invalid Number Entered');
  } finally {
    print('Parsing Complete!');
  }
}

void main() {
  print('Enter value for Conversion');
  var input = stdin.readLineSync()!;
  parseNumber(input);
}
