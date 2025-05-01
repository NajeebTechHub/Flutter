class student {
  var name = 'najeeb';
  var rollNo = 21;
  List<String> enrolledCourses = [];

  void enrollInCourses(String courseName) {
    enrolledCourses.add(courseName);
  }

  studentInfo() {
    print('Student : $name, Roll No : $rollNo');
    print('enrolled in : $enrolledCourses');
  }
}

class teacher {
  var name = 'Sir Naveed';
  List<String> teachingCourses = [];

  void assignCourse(String courseName) {
    teachingCourses.add(courseName);
  }

  void displayTeacherInfo() {
    print('Teacher : $name');
    print('Teaching : $teachingCourses');
  }
}

class course {
  var courseName;
  var courseCode;
  var teacherName;

  course(this.courseName, this.courseCode, this.teacherName);

  void display() {
    print('Course : $courseName, Code : $courseCode, Teacher : $teacherName');
  }
}

void main() {
  var std = student();
  std.enrollInCourses('DLD');
  std.enrollInCourses('OOP');
  std.studentInfo();

  var t = teacher();
  t.assignCourse('OOP');
  t.assignCourse('DLD');
  t.displayTeacherInfo();

  var c = course('DLD', 'DLD101', 'Sir Naveed');
  c.display();
}
