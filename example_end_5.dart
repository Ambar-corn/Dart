//Создайте класс Car с приватными полями make (марка) и model (модель).
//Реализуйте factory конструктор Car.create() для создания нового автомобиля.
//Factory конструктор должен принимать параметры make и model и выбрасывать
//исключение ArgumentError, если они не проходят валидацию (марка автомобиля
//не должна быть пустой строкой, длина строки задающей модель, должна быть >= 3.

class Car {
  final String _make;
  final String _model;
  Car(this._make, this._model);
  factory Car.create(String make, String model) {
    if (make.isEmpty) {
      throw ArgumentError("Марка не может быть пустой строкой");
    }
    if (model.length < 3) {
      throw ArgumentError("Модель должна быть длиной 3 или больше");
    }
    return Car(make, model);
  }
}

void main() {
  Car car1 = Car.create("BMV", "Afор");
  print("Make: ${car1._make} Model: ${car1._model}");
}
