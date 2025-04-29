void main() {
  Set marks = {45, 78, 97, 35, 79};
  Set marks1 = {34, 97, 45, 90, 23};
  print(marks);

  print(marks.first);
  print(marks.last);
  print(marks.contains(78));
  marks.add(67);
  print(marks);
  marks.addAll(marks1);
  print(marks);

  List marksList = marks.toList();
  print(marksList[0]);
  marksList[1] = 78;
  print(marksList);
  marksList.remove(2);
  print(marksList);
}
