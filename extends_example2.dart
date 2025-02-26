// class Employee {
//   final String name;
//   final int id;
//   int _age;
//   int _salary;
//   int _yearsExperience;

//   Employee(
//     this.name,
//     this._age,
//     this.id,
//     this._salary,
//     this._yearsExperience,
//   );

//   Employee.named({
//     required String name,
//     required int age,
//     required int id,
//     required int salary,
//     required int yearsExperience,
//   }) : this(name, age, id, salary, yearsExperience);

//   // остальные методы не изменялись
// }

// class Plumber extends Employee {
//   Plumber(
//     super.name,
//     super.age,
//     super.id,
//     super.salary,
//     super.yearsExperience,
//   );

//   Plumber.withMinSalary({
//     required super.name,
//     required super.age,
//     required super.id,
//     required super.yearsExperience,
//   }) : super.named(salary: 1000);

//   // остальные методы не изменялись
// }

// class Builder extends Employee {
//   int _category;

//   Builder(
//     super.name,
//     super.age,
//     super.id,
//     super.salary,
//     super.yearsExperience,
//     this._category,
//   );

//   Builder.withMinSalary({
//     required super.name,
//     required super.age,
//     required super.id,
//     required super.yearsExperience,
//     required int category,
//   })  : _category = category,
//         super.named(salary: 3000);
//   // остальные методы не изменялись
// //
