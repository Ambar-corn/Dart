//Реализуйте класс IPAddress, представляющий IP-адрес. Перегрузите операторы []
// для доступа к октетам IP-адреса по индексу и оператор []= для установки значения
// (операторы могут вызывать исключение - RangeError()). Также перегрузите
//операторы &, | и ^ для выполнения побитовых операций над IP-адресами. Значения
// октетов не могут быть меньше 0 и больше 255, иначе генерируется исключение -
//RangeError. Если на вход конструктора подается список некорректной длины -
//сгенерируйте исключение ArgumentError.

class IPAddress {
  late List<int> octets;

  IPAddress(List<int> octets) {
    if (octets.length != 4) {
      throw ArgumentError('IP-адрес должен содержать ровно 4 октета');
    }
    this.octets = octets;
  }

  int operator [](int index) {
    if (index < 0 || index >= octets.length) {
      throw RangeError.index(index, octets, "index");
    }
    return octets[index];
  }

  void operator []=(int index, int value) {
    // code
    if (index < 0 || index >= octets.length) {
      throw RangeError.index(index, octets, "index");
    }
    if (value < 0 || value > 255) {
      throw RangeError.value(value, "value");
    }
    octets[index] = value;
  }

  IPAddress operator &(IPAddress other) {
    // code
    List<int> result = [];
    for (int i = 0; i < octets.length; i++) {
      result.add(octets[i] & other.octets[i]);
    }
    return IPAddress(result);
  }

  IPAddress operator |(IPAddress other) {
    // code
    List<int> result = [];
    for (int i = 0; i < octets.length; i++) {
      result.add(octets[i] | other.octets[i]);
    }
    return IPAddress(result);
  }

  IPAddress operator ^(IPAddress other) {
    // code
    List<int> result = [];
    for (int i = 0; i < octets.length; i++) {
      result.add(octets[i] ^ other.octets[i]);
    }
    return IPAddress(result);
  }
}
