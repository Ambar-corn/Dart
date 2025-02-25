abstract class ISalaryEmployee {
  int plus(int value);
  int minus(int value);
}

class SalaryEmployee implements ISalaryEmployee {
  int salary;

  SalaryEmployee({required this.salary});
  int plus(int value) {
    salary += value;
    return salary;
  }

  int minus(int value) {
    salary -= value;
    return salary;
  }
}

class Employee extends SalaryEmployee {
  final int age;
  final String name;

  Employee({required this.age, required this.name, required super.salary});
}

void main() {
  Employee employee = Employee(age: 18, name: "Ivan", salary: 500);
  print(employee.salary);
  employee.minus(100);
  print(employee.salary);
}
