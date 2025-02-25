//Создайте класс DecimalCounter. В конструкторе этого класса укажите диапазон .
//счета (например, от 3 до 87). Класс должен увеличивать или уменьшать свое
//значение на 1 в указанном диапазоне. Вы можете инициализировать этот класс
//значениями по умолчанию или произвольными значениями. DecimalCounter должен
//иметь следующие методы: увеличить значение, уменьшить значение и получить
//текущее значение. Если счетчик достигает минимального значения, и вы вызываете
// метод уменьшения, то значение счетчика становится равным максимальному значению и наоборот

class DecimalCounter {
  int _minValue;
  int _maxValue;
  int _currentValue;
  DecimalCounter._(this._currentValue, this._maxValue, this._minValue);

  factory DecimalCounter(int currentValue,
      {int minValue = 3, int maxValue = 87}) {
    // code
    int otherValue = currentValue;
    if (currentValue < minValue) {
      otherValue = minValue;
    } else if (currentValue > maxValue) {
      otherValue = maxValue;
    }
    return DecimalCounter._(otherValue, maxValue, minValue);
  }

  void increment() {
    if (_currentValue == _maxValue) {
      _currentValue = _minValue;
    } else
      _currentValue += 1;
  }

  void decrement() {
    if (_currentValue == _minValue) {
      _currentValue = _maxValue;
    } else
      _currentValue -= 1;
  }

  int get value => _currentValue;
}

void main() {
  DecimalCounter counter = DecimalCounter(100);
  print(counter._currentValue);
  counter.decrement();
  counter.decrement();
  print(counter._currentValue);
  counter.decrement();
  print(counter._currentValue);
  counter.decrement();
  print(counter._currentValue);
}
