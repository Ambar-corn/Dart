void main() {
  var sanya = Human(name: "Sanya", age: 12, height: 174);
  print(sanya.name);
  print(sanya.age);
  print(sanya.height);
}

class Human {
  Human({required this.name, required this.age, required this.height});
  String name;
  int age;
  double height;
}
