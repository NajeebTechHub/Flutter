void main() {
  Map class_2 = {'najeeb': 67, 'haseeb': 90, 'anees': 56, 'tariq': 89};
  print(class_2);
  print(class_2['haseeb']);
  print(class_2.keys);
  print(class_2.values);
  class_2['najeeb'] = 80;
  print(class_2['najeeb']);
  class_2.remove('tariq');
  print(class_2);
  print(class_2.length);

  String name;
  for (name in class_2.keys) {
    print(name);
  }
}
