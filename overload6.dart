//Реализуйте класс Vector, представляющий вектор в трехмерном пространстве.
// Перегрузите операторы +, -, * для выполнения арифметических операций с
//векторами. Также перегрузите оператор == для сравнения векторов. Реализуйте
// доступ к элементам вектора по индексу (может вызывать исключение - RangeError()).

class Vector {
  double x;
  double y;
  double z;

  Vector(this.x, this.y, this.z);

  Vector operator +(Vector other) {
    // code
    return Vector(x + other.x, y + other.y, z + other.z);
  }

  Vector operator -(Vector other) {
    // code
    return Vector(x - other.x, y - other.y, z - other.z);
  }

  Vector operator *(double scalar) {
    // code
    return Vector(x * scalar, y * scalar, z * scalar);
  }

  @override
  bool operator ==(Object other) {
    // code
    if (identical(this, other)) return true;
    if (other is! Vector) {
      return false;
    }
    return x == other.x && y == other.y && z == other.z;
  }

  double operator [](int index) {
    // code
    switch (index) {
      case 0:
        return x;
      case 1:
        return y;
      case 2:
        return z;
      default:
        throw RangeError.range(index, 0, 2);
    }
  }

  @override
  int get hashCode {
    return x.hashCode ^ y.hashCode ^ z.hashCode;
  }
}
