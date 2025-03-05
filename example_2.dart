/*Задание
Создайте класс Storage<T>, представляющий универсальное хранилище для элементов определённого типа. Класс должен поддерживать следующие возможности:
Поля:
Приватный список _items типа List<T> для хранения элементов.

Конструктор:
Пустой конструктор, который инициализирует пустой список.

Методы:
add(T item) — добавляет элемент в хранилище.

getItem(int index) — возвращает элемент по указанному индексу, если он существует, иначе возвращает null.

getAll() — возвращает весь список элементов в виде List<T>.

filter<V extends T>(bool Function(V) condition) — возвращает новый список, содержащий только те элементы, которые удовлетворяют заданному условию. Тип V должен быть подтипом T.

Дополнительно:
Создайте класс Product с полями name (тип String) и price (тип double), который будет использоваться для тестирования хранилища.

В функции main продемонстрируйте работу хранилища с типами int, String и Product, включая вызов метода filter.

 */

class Storage<T> {
  List<T> _items;

  Storage() : _items = [];

  void add(T item) {
    _items.add(item);
  }

  T? getItem(int index) {
    if (index < 0 || index >= _items.length) {
      return null;
    }
    return _items[index];
  }

  List<T> getAll() {
    return _items;
  }

  List<V> filter<V extends T>(bool Function(V) condition) {
    return _items.whereType<V>().where(condition).toList();
  }
}

class Product {
  String name;
  double price;

  Product(this.name, this.price);

  @override
  String toString() => 'Product(name: $name, price: $price)';
}
