import 'dart:io';

void main() {
  for (int i = 0; i < 5; i++) {
    print(i);
  }

  List items = ['chair', 'fan', 'pen', 'board'];
  for (int i = 0; i < items.length; i++) {
    print(items[i]);
  }

  String output = '';
  for (int i = 0; i < 10; i++) {
    for (int j = 0; j < i; j++) {
      output = '*';
      stdout.write(output);
    }
    print('');
  }

  List names = ['najeeb', 'haseeb', 'anees', 'tariq'];
  for (var i in names) {
    print(i);
  }
}
