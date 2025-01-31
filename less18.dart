void main() {
  var sanya = Human(name: "Sanya", age: 12, height: 174);
  var alex = Artist(name: "Alex", age: 212, height: 74, style: "brrb");
  print(alex);
  print(sanya);
}

class Human {
  Human({required this.name, required this.age, required this.height});
  final String name;
  int age;
  double height;
  void grewUp(int years) {
    age += years;
  }

  bool isHighter(Human otherHuman) {
    return this.height > otherHuman.height;
  }

  @override
  String toString() {
    return "Имя: $name Возраст: $age Рост: $height";
  }
}

class Artist extends Human {
  Artist(
      {required super.name,
      required super.age,
      required super.height,
      required this.style});

  String style;
}
