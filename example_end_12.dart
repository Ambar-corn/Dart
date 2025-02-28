//Реализуйте класс «Студент», который должен содержать ФИО студента, дату поступления и балл GPA.
//Балл GPA должен быть в диапазоне от 2.0 до 4.0. Если балл находится вне этого диапазона,
//то студенту следует отказать в добавлении в группу (класс «Группа студентов»).
//Группа должна предоставлять метод поиска студента по его ФИО и возвращать список студентов
// ориентируясь на заданный диапазон баллов.

class Student {
  final String name;
  final String admissionDate;
  final double gpa;

  Student(this.name, this.admissionDate, this.gpa);

  get getName => name;

  @override
  String toString() {
    return ("Name: $name Date:$admissionDate GPA:$gpa");
  }
}

class StudentGroup {
  List<Student> students;

  StudentGroup._(this.students);

  factory StudentGroup(List<Student> students) {
    //code

    return StudentGroup._(students);
  }

  bool addStudent(Student student) {
    if (student.gpa >= 2.0 && student.gpa <= 4.0) {
      students.add(student);
      return true;
    } else
      return false;
  }

  List<Student> searchByName(String name) {
    return students.where((student) => student.name == name).toList();
  }

  List<Student> searchByGpaRange(double minGpa, double maxGpa) {
    return students
        .where((student) => student.gpa >= minGpa && student.gpa <= maxGpa)
        .toList();
  }

  @override
  String toString() {
    //code
    String studentList =
        students.map((student) => student.toString()).join("\n");
    return "StudentGroup:\n$studentList";
  }
}

void main() {
  Student student1 = Student("akko", "2214", 2.3);
  Student student2 = Student("jo", "2211234", 2.54);
  Student student3 = Student("jo", "234", 2.54);
  Student student4 = Student("jo", "24", 2.54);

  StudentGroup group = StudentGroup._([student1, student2, student3, student4]);
  print(group.searchByName("jo"));
  print(group);
}
