class Course {
  String courseName;
  String courseCode;
  int creditHours;

  Course(this.courseName, this.courseCode, this.creditHours);

  Course.fromMap(Map<String, dynamic> map)
      : courseName = map['courseName'],
        courseCode = map['courseCode'],
        creditHours = map['creditHours'];

  @override
  String toString() => '$courseName ($courseCode)';
}

class Student {
  String name;
  int rollNo;
  List<Course> enrolledCourses;

  Student(this.name, this.rollNo, this.enrolledCourses);

  Student.fromMap(Map<String, dynamic> map)
      : name = map['Name'],
        rollNo = map['rollNo'],
        enrolledCourses = (map['Courses'] as List)
            .map((courseMap) => Course.fromMap(courseMap))
            .toList();

  int get totalCreditHours {
    int cHours = 0;
    for (var course in enrolledCourses) {
      cHours += course.creditHours;
    }
    return cHours;
  }

  @override
  String toString() {
    return '''
Name         : $name
Roll No      : $rollNo
Courses      : ${enrolledCourses.join(', ')}
Credit Hours : $totalCreditHours
''';
  }
}

class University {
  List<Student> studentList = [];

  void enrollStudent(Student student) {
    studentList.add(student);
  }

  void registerCourse(int rollNo, Course course) {
    for (var student in studentList) {
      if (student.rollNo == rollNo) {
        student.enrolledCourses.add(course);
      }
    }
  }

  void studentInfo(int rollNo) {
    for (var student in studentList) {
      if (student.rollNo == rollNo) {
        print(student.toString());
      }
    }
  }

  void studentAboveCreditLimit(int limit) {
    for (var student in studentList) {
      if (student.totalCreditHours > limit) {
        print(student.toString());
      }
    }
  }

  void addDummyData() {
    List<Map<String, dynamic>> studentMap = [
      {
        'Name': 'Najeeb',
        'rollNo': 1,
        'Courses': [
          {'courseName': 'TRW', 'courseCode': 'TRW103', 'creditHours': 3}
        ]
      },
      {
        'Name': 'Haseeb',
        'rollNo': 2,
        'Courses': [
          {'courseName': 'TRW', 'courseCode': 'TRW103', 'creditHours': 3}
        ]
      },
      {
        'Name': 'Tariq',
        'rollNo': 3,
        'Courses': [
          {'courseName': 'TRW', 'courseCode': 'TRW103', 'creditHours': 3}
        ]
      },
    ];

    for (var student in studentMap) {
      enrollStudent(Student.fromMap(student));
    }

    registerCourse(1, Course('DLD', 'DLD101', 4));
  }
}

void main() {
  var uni = University();

  uni.addDummyData();

  print('---Above Credit Hours Limit---');
  uni.studentAboveCreditLimit(4);

  print('---Student Info By Roll No---');
  uni.studentInfo(2);
}
