class student {
  var name;
  static var uniName;

  void display() {
    print('$name study in $uniName university');
  }

  static marksPercentage(int marks, int total) {
    double percentage = marks / total * 100;
    print('The marks percentage $percentage in $uniName university');
  }
}

class counter {
  static int count = 0;

  static incrementCount() {
    count++;
  }

  get gcount => count;
}

void main() {
  student.uniName = 'sarhad';

  var std1 = student();
  std1.name = 'najeeb';
  std1.display();
  student.marksPercentage(90, 100);

  var std2 = student();
  std2.name = 'haseeb';
  std2.display();
  student.marksPercentage(60, 100);

  var std3 = student();
  std3.name = 'tariq';
  std3.display();
  student.marksPercentage(45, 100);

  // counter.incrementCount();
  var c = counter();
  print(c.gcount);
}
