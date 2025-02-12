//Реализуйте класс Color, представляющий цвет в формате RGB. Перегрузите операторы
//[] для доступа к компонентам цвета (красный, зеленый, синий) по индексу (может
// вызывать исключение - RangeError()). Также перегрузите операторы &, | и ^ для
//выполнения побитовых операций над цветами.

class Color {
  int red;
  int green;
  int blue;

  Color(this.red, this.green, this.blue);

  int operator [](int index) {
    // code
    switch (index) {
      case 0:
        return red;
      case 1:
        return green;
      case 2:
        return blue;
      default:
        throw RangeError.range(index, 0, 2);
    }
  }

  Color operator &(Color other) {
    // code
    return Color(
      red & other.red,
      green & other.green,
      blue & other.blue,
    );
  }

  Color operator |(Color other) {
    // code
    return Color(
      red | other.red,
      green | other.green,
      blue | other.blue,
    );
  }

  Color operator ^(Color other) {
    // code
    return Color(
      red ^ other.red,
      green ^ other.green,
      blue ^ other.blue,
    );
  }
}
