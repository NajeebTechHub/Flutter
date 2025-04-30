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
}
