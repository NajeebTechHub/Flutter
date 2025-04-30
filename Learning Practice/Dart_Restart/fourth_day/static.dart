class student {
  var name;
  static var uniName;

  void display() {
    print('$name study in $uniName university');
  }
}

void main() {
  student.uniName = 'sarhad';

  var std1 = student();
  std1.name = 'najeeb';
  std1.display();

  var std2 = student();
  std2.name = 'haseeb';
  std2.display();

  var std3 = student();
  std3.name = 'tariq';
  std3.display();
}
