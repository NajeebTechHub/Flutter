import 'dart:io';

void main() {
  int count = 0;
  do {
    print('Hello World');
    count++;
  } while (count < 5);

  int i = 0;
  do {
    int j = 0;
    do {
      stdout.write("*");
      j++;
    } while (j < i);
    print('');
    i++;
  } while (i < 10);
}
