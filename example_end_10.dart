//Создайте класс Box<T>, который представляет собой коробку, способную хранить
//объекты заданного типа T. Реализуйте методы addItem() для добавления элемента
// в коробку и getItem() для получения элемента по его индексу из коробки.
//Оба метода должны работать с объектами типа T.

class Box<T> {
  List<T> elements = [];
  // Box(this.elements);
  void addItem(T item) {
    elements.add(item);
  }

  T getItem(int index) {
    return elements[index];
  }
}

void main() {
  // Создаем коробку для строк
  var stringBox = Box<String>();
  stringBox.addItem("Hello");
  // print(stringBox.getItem(2));
  stringBox.addItem("World");
  print(stringBox.getItem(1)); // Вывод: Hello
  print(stringBox.getItem(0)); // Вывод: World
}
