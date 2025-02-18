//Создайте класс Car с приватным статическим полем _totalCarsCount, которое
//будет отслеживать общее количество созданных объектов класса Car. Реализуйте
//метод getTotalCarsCount(), который будет возвращать текущее значение _totalCarsCount

class Car {
  static int _totalCarsCount = 0;
  Car() {
    _totalCarsCount++;
  }
  int getTotalCarsCount() {
    return _totalCarsCount;
  }
}
