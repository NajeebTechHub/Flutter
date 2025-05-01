class person {
  String _name = 'najeeb';
  int _age = 24;

  void set changeName(String newName) {
    _name = newName;
  }

  void set changeAge(int newAge) {
    _age = newAge;
  }

  String get name => _name;
  int get age => _age;

  // String get changeName {
  //   return name;
  // }
}

class student {
  var name;
  var rollNo;
  var marks;

  set setMarks(int smarks) {
    if (marks < 0) {
      print('invalid');
    } else {
      smarks = marks;
    }
  }

  int get smarks => marks;

  void studentDetail(var name, var rollNo, var smarks) {
    print('name : $name, roll No : $rollNo, marks : $smarks');
  }
}

void main() {
  var p = new person();
  // before changing
  print(p.name);
  print(p.age);

  // can access private variable in same file
  print(p._name);
  print(p._age);

  // after changing
  p.changeName = 'haseeb';
  p.changeAge = 22;
  print('${p.name}');
  print(p.age);

  var s = student();
  s.studentDetail('najeeb', 21, 78);
}
