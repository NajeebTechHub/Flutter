class Person {
  String name;

  Person(this.name);

  void display() {
    print('Name     : $name');
  }
}

class Student extends Person {
  int rollNo;
  List<String> enrolledCourses = [];

  Student(String name, this.rollNo, this.enrolledCourses) : super(name);

  void studentInfo() {
    print('----Student Info----');
    super.display();
    print('roll No     : $rollNo');
    print('enrolled in : ${enrolledCourses.join(',')}');
  }
}

class Teacher extends Person {
  List<String> teachingCourses = [];

  Teacher(String name, this.teachingCourses) : super(name);

  void teacherInfo() {
    print('----Teacher Info----');
    super.display();
    print('Teaching : ${teachingCourses.join(',')}');
  }
}

class Courses {
  String courseName;
  String courseCode;
  String teacherName;

  Courses(this.courseName, this.courseCode, this.teacherName);

  void courseSummary() {
    print('----Course Summary----');
    print('Course  : $courseName');
    print('Code    : $courseCode');
    print('Teacher : $teacherName');
  }
}

void main() {
  var std = Student('Najeeb', 21, ['SDA', 'SPM', 'Python']);
  std.studentInfo();

  var thr = Teacher('Naveed', ['Python', 'C++']);
  thr.teacherInfo();

  var cr = Courses('SDA', 'SDA101', 'Abubakkar');
  cr.courseSummary();
}
