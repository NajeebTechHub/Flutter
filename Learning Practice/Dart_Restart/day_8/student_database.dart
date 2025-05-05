class Student {
  String name;
  int rollNo;
  List<int> marks;

  Student(this.name, this.rollNo, this.marks);

  double get average => marks.reduce((a, b) => a + b) / marks.length;
}

class StudentDatabase {
  List<Student> students = [];

  void sortByAverage() {
    students.sort((a, b) => a.average.compareTo(b.average));
  }

  void displayAll() {
    for (var student in students) {
      print('''
Name    : ${student.name}
Roll No : ${student.rollNo}
Average : ${student.average}
''');
    }
  }

  void searchByName(String inputName) {
    for (var student in students) {
      if (student.name.toLowerCase() == inputName.toLowerCase()) {
        print('''
Name    : ${student.name}
Roll No : ${student.rollNo}
Average : ${student.average}
''');
      }
    }
  }

  void searchByRollNo(int inputRollNo) {
    for (var student in students) {
      if (student.rollNo == inputRollNo) {
        print('''
Name    : ${student.name}
Roll No : ${student.rollNo}
Average : ${student.average}
''');
      }
    }
  }
}

void main() {
  var stm = StudentDatabase();
  stm.students.addAll([
    Student('najeeb', 1, [78, 0, 9]),
    Student('haseeb', 2, [33, 56, 56]),
    Student('anees', 3, [78, 90, 99]),
    Student('tariq', 4, [12, 90, 5]),
    Student('saad', 5, [8, 34, 55])
  ]);

  print('----Search By Name----');
  stm.searchByName('saad');

  print('----Search By RollNo----');
  stm.searchByRollNo(3);

  print('----Before Sorting----');
  stm.displayAll();

  stm.sortByAverage();

  print('----After Sorting----');
  stm.displayAll();
}
