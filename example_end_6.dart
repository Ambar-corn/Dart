//Создайте класс Cube для представления куба с приватным полем sideLength(int).
// Реализуйте const конструктор Cube() для создания нового куба и напишите метод
// calculateVolume(), который возвращает объем куба.

class Cube {
  final int _sideLenght;
  const Cube(this._sideLenght);
  int calculateVolume() {
    int v = _sideLenght * _sideLenght * _sideLenght;
    return v;
  }
}

void main() {
  Cube cube1 = Cube(3);
  print(cube1.calculateVolume());
}
