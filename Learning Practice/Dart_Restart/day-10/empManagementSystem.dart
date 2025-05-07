class Employee {
  String name;
  int id;
  double salary;
  String department;

  Employee(this.name, this.id, this.salary, this.department);

  bool isEligibleForBonus() {
    if (salary < 50000) {
      return true;
    } else {
      return false;
    }
  }

  @override
  String toString() {
    return '''

Name       : $name
ID         : $id
Salary     : $salary
Department : $department
''';
  }
}

class Company {
  List<Employee> employeeList = [];

  void addEmployee(Employee emp) {
    employeeList.add(emp);
  }

  void showAllEmployees() {
    for (var emp in employeeList) {
      print('${emp.toString()}');
    }
  }

  void searchByDepartment(String dept) {
    for (var emp in employeeList) {
      if (emp.department.toLowerCase() == dept.toLowerCase()) {
        print('${emp.toString()}\n');
      }
    }
  }

  void showBonusEligibleEmployees() {
    for (var emp in employeeList) {
      if (emp.isEligibleForBonus()) {
        print('${emp.toString()}\n');
      }
    }
  }

  void highestSalaryEmployee() {
    var highestSalary = employeeList[0].salary;
    var topEmployee = employeeList[0];
    for (var emp in employeeList) {
      if (highestSalary < emp.salary) {
        highestSalary = emp.salary;
        topEmployee = emp;
      }
    }
    print('${topEmployee.toString()}\n');
  }
}

void main() {
  var com = Company();
  com.addEmployee(Employee('najeeb', 1, 20000, 'IT'));
  com.addEmployee(Employee('haseeb', 2, 60000, 'IT'));
  com.addEmployee(Employee('anees', 3, 45000, 'Medical'));

  print('----Search By Department----');
  com.searchByDepartment('IT');

  print('----Show Eligible Employee for Bonus----');
  com.showBonusEligibleEmployees();

  print('----Highest Salary Employee----');
  com.highestSalaryEmployee();

  print('----All Employees----');
  com.showAllEmployees();
}
