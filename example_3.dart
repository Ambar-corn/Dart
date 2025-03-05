/*Задача: Создание класса DataProcessor<T> для обработки данных
Создайте класс DataProcessor<T> с использованием generics в Dart, который будет работать
 со списком элементов произвольного типа T и предоставлять методы для их фильтрации,
  преобразования и обработки.
Условия задачи:
Конструктор: Класс должен иметь конструктор, принимающий список элементов типа T.

Метод filter: Реализуйте метод filter, который принимает функцию-предикат bool Function(T)
 и возвращает новый список типа List<T>, содержащий только те элементы исходного списка, 
 для которых предикат возвращает true.

Метод process: Реализуйте метод process, который принимает функцию обработки void Function(T) 
и применяет её к каждому элементу списка, не возвращая никакого значения.
*/

class DataProcessor<T> {
  List<T> _items;
  DataProcessor(this._items);
  List<T> filter(bool Function(T) predicat) {
    return _items.where(predicat).toList();
  }

  void process(void Function(T) p) {
    _items.forEach(p);
  }
}

void main() {
  // Создаем список чисел
  var numbers = [1, 2, 3, 4, 5];
  var processor = DataProcessor<int>(numbers);

  // Фильтруем четные числа
  var evenNumbers = processor.filter((n) => n % 2 == 0);
  print("Четные числа: $evenNumbers"); // Ожидаемый вывод: [2, 4]
  // Обрабатываем каждое число
}
