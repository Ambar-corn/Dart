//Создайте класс MathUtils с приватным статическим полем
//_pi = 3.14159265359, которое будет хранить значение числа Пи.
// Реализуйте статический метод getPi(), который будет возвращать
// значение поля pi. Затем создайте еще один класс Circle, который
//будет иметь статический метод calculateArea(double radius), принимающий
// радиус окружности и возвращающий площадь этой окружности, используя
// значение числа Пи из класса MathUtils. Результат расчета площади округлите
//до 2-х знаков после запятой.

import 'dart:math';

class MathUtils {
  static double _pi = 3.14159265359;
  static double getPi() {
    return _pi;
  }
}

class Circle {
  static double calculateArea(double radius) {
    double s = pow(radius, 2) * MathUtils.getPi();
    var square_str = s.toStringAsFixed(2);
    double square = double.parse(square_str);
    return square;
  }
}

void main() {
  var v = Circle.calculateArea(12);
  print(v);
}
