import 'dart:io';

class Student {
  String name;
  int rollNo;
  List<int> marks;

  Student(this.name, this.rollNo, this.marks);

  double calculateAverage() {
    double average = (marks[0] + marks[1] + marks[2]) / 3;
    return average;
  }
}

class StudentDatabase {
  List listOfStudent = [];

  Future<void> addStudent(Student student) async {
    listOfStudent.add({
      student.rollNo: {
        'Name': student.name,
        'Roll No': student.rollNo,
        'Marks': student.marks,
        'Average': student.calculateAverage()
      }
    });
  }

  Future fetchDataByRollNo(int rollNo) async {
    await Future.delayed(Duration(seconds: 3));
    for (var studentMap in listOfStudent) {
      if (studentMap.containsKey(rollNo)) {
        return studentMap;
      }
    }
    print('Roll No not found');
    return null;
  }
}

void main() async {
  var stdb = StudentDatabase();
  stdb.addStudent(Student('najeeb', 21, [78, 85, 86]));
  stdb.addStudent(Student('haseeb', 22, [90, 69, 79]));
  stdb.addStudent(Student('anees', 23, [67, 47, 79]));

  print('Enter Student Roll No : ');
  var input = int.parse(stdin.readLineSync()!);

  print('loading...');
  var student = await stdb.fetchDataByRollNo(input);
  if (student != null) {
    print('Student found : $student');
  }
}
