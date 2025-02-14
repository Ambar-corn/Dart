//На основе представленного ниже класса Animal, создайте производный класс Dog,
// переопределив его метод hi, чтобы при его вызове в терминал выводилось
//следующее приветствие:

class Animal {
  String name;
  int age;

  Animal(this.name, this.age);

  void hi() {
    print('-_-');
  }
}

class Dog extends Animal {
  Dog(super.name, super.age);
  @override
  void hi() {
    print("Gav!");
  }
}

void main() {
  var gav = Dog("12", 123);
  gav.hi();
}
