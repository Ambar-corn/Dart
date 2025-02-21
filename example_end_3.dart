//Создайте класс Rectangle  с приватными полями width (ширина) и height (высота)
//. Реализуйте именованный приватный конструктор Rectangle._ и конструктор
// Rectangle.square(), который принимает один параметр sideLength (длина стороны)
// и создает квадратный прямоугольник, устанавливая значение width и height
// равными sideLength. Напишите метод getArea(), который возвращает площадь прямоугольника

class Rectangle {
  late double _width;
  late double _height;

  Rectangle._(this._width, this._height);
  Rectangle.square(double sideLengt) {
    _height = sideLengt;
    _width = sideLengt;
  }
  double getArea() {
    double area = _height * _width;
    return area;
  }
}

void main() {
  Rectangle rectangle = Rectangle._(13, 21);
  print(rectangle);
}
