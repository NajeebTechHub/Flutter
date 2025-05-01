abstract class person {
  void run();
  void talk();
}

class indivisual extends person {
  @override
  void run() {
    print('can run');
  }

  @override
  void talk() {
    print('can talk');
  }
}

abstract class shape {
  void calculateArea();
}

class circle extends shape {
  var radius = 3;
  @override
  void calculateArea() {
    var area = 3.14 * radius * radius;
    print(area);
  }
}

class rectangle extends shape {
  var length = 6;
  var width = 5;

  @override
  void calculateArea() {
    var area = length * width;
    print(area);
  }
}

abstract class Person {
  void greet();
}

class employee extends Person {
  @override
  void greet() {
    print('Hello, i am an employee');
  }

  void displayEmpDetail(String name, String designation) {
    print('My name is $name and designation is $designation');
  }
}

class flyable {
  void fly() {}
}

class bird implements flyable {
  @override
  void fly() {
    print('i can fly');
  }
}

void main() {
  var p = indivisual();
  p.run();
  p.talk();

  var c = circle();
  c.calculateArea();

  var r = rectangle();
  r.calculateArea();

  var e = employee();
  e.greet();
  e.displayEmpDetail('najeeb', 'developer');

  var b = bird();
  b.fly();
}
