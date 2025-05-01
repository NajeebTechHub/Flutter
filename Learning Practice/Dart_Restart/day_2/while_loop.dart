import 'dart:io';

void main() {
  List<String> studentNames = ['Riaz', 'Hassan', 'Najeeb', 'Mubashir'];
  int index = 0;

  while (index < studentNames.length) {
    print(studentNames[index]);
    index++;
  }

  int i = 0;
  while (i < 10) {
    int j = 0;
    while (j < i) {
      stdout.write('*');
      j++;
    }
    print('');
    i++;
  }
}
