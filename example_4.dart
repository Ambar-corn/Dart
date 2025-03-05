//Вам нужно создать систему для управления различными транспортными средствами
//(например, автомобили, мотоциклы и грузовики). Каждое транспортное средство
//должно соответствовать определённым правилам (интерфейсам), иметь общие
//характеристики (абстракция) и уникальные особенности (наследование).
// Интерфейс Vehicle
abstract class Vehicle {
  String startEngine();
  String stopEngine();
  double getMaxSpeed();
}

abstract class MotorizedVehicle implements Vehicle {
  String get fuelType;

  @override
  String startEngine() {
    return "Motorized vehicle engine started";
  }

  String refuel();
}

class Car extends MotorizedVehicle {
  @override
  String get fuelType => "Petrol";

  @override
  String stopEngine() {
    return "Car engine stopped";
  }

  @override
  double getMaxSpeed() {
    return 180.0;
  }

  @override
  String refuel() {
    return "Car refueled with $fuelType";
  }
}

class Motorcycle extends MotorizedVehicle {
  @override
  String get fuelType => "Petrol";

  @override
  String stopEngine() {
    return "Motorcycle engine stopped";
  }

  @override
  double getMaxSpeed() {
    return 120.0;
  }

  @override
  String refuel() {
    return "Motorcycle refueled with $fuelType";
  }
}

class Truck extends MotorizedVehicle {
  @override
  String get fuelType => "Diesel";

  @override
  String stopEngine() {
    return "Truck engine stopped";
  }

  @override
  double getMaxSpeed() {
    return 100.0;
  }

  @override
  String refuel() {
    return "Truck refueled with $fuelType";
  }
}
