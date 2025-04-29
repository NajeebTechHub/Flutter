class student {
  String stdName;
  int rollNo;
  int marks = 46;

  student(this.stdName, this.rollNo, this.marks);

  void displayInfo() {
    print('name : $stdName, roll_No : $rollNo, marks : $marks');
  }

  student.withoutMarks(this.stdName, this.rollNo) {
    print('The rollNo of $stdName is $rollNo');
  }
}

class person {
  String name;
  int age;

  person(this.name, this.age);

  void display() {}
}

class teacher extends person {
  String subject;
  int salary;
  teacher(String name, int age, this.subject, this.salary) : super(name, age);

  @override
  void display() {
    print(
        'The salary of the teacher of subject $subject Mr.$name in age $age is Rs.$salary');
  }
}

void main() {
  var std = new student('najeeb', 32, 80);
  std.displayInfo();
  var std1 = new student.withoutMarks('haseeb', 34);
  std1.displayInfo();

  var tchr = new teacher('naveed', 35, 'DLD', 70000);
  tchr.display();
}
