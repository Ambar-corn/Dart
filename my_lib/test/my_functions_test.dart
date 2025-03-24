import 'package:test/test.dart';

import 'package:my_lib/calculator.dart';

void main() {
  group('Арифметические функции', () {
    test('Проверка сложения', () {
      expect(add(3, 7), equals(10));
      expect(add(-3, 7), equals(4));
      expect(add(123.2, 214.7), equals(337.9));
      expect(add(214.7, -432.34), equals(-217.64));
      expect(add(0, 0), equals(0));
    });
    test('Проверка умножения', () {
      // Базовые случаи с положительными целыми числами
      expect(mul(3, 7), equals(21));
      expect(mul(32, 7), equals(224));
      expect(mul(12, 12), equals(144));

      // Умножение с отрицательными числами
      expect(mul(-3, 2), equals(-6));
      expect(mul(4, -5), equals(-20));
      expect(mul(-2, -3), equals(6));

      // Умножение с числами с плавающей точкой
      expect(mul(1.5, 2.0), equals(3.0));

      // Умножение с нулем
      expect(mul(0, 5), equals(0));
      expect(mul(-3, 0), equals(0));
      expect(mul(0, 0), equals(0));

      // Умножение с большими числами
      expect(mul(1000000, 2), equals(2000000));
    });
    test("Проверка возведения в степень", () {
      // Базовые случаи с положительными числами
      expect(powN(4, 3), equals(64));
      expect(powN(2, 2), equals(4));
      expect(powN(4, 1), equals(4));
      expect(powN(3, 3), equals(27));
      expect(powN(12, 2), equals(144));

      // Возведение в степень с отрицательной степенью
      expect(powN(2, -1), equals(0.5));

      // Возведение в степень с дробной степенью
      expect(powN(4, 0.5), equals(2));
      expect(powN(9, 0.5), equals(3));

      // Возведение в нулевую степень
      expect(powN(5, 0), equals(1));
      expect(powN(0, 0), equals(1));

      // Возведение в степень с отрицательным основанием
      expect(powN(-2, 2), equals(4));
      expect(powN(-3, 3), equals(-27));

      // Возведение в степень с большими числами
      expect(powN(2, 10), equals(1024));
    });
    test("Проверка вычитания", () {
      // Базовые случаи с положительными числами
      expect(sub(14, 4), equals(10));
      expect(sub(1234, 152), equals(1082));

      // Вычитание с отрицательными числами
      expect(sub(5, -3), equals(8));
      expect(sub(-7, 2), equals(-9));
      expect(sub(-10, -4), equals(-6));

      // Вычитание с числами с плавающей точкой
      expect(sub(5.5, 2.0), equals(3.5));

      // Вычитание с нулем
      expect(sub(8, 0), equals(8));
      expect(sub(0, 5), equals(-5));
      expect(sub(0, 0), equals(0));

      // Вычитание с большими числами
      expect(sub(1000000, 999999), equals(1));
    });
  });
}
