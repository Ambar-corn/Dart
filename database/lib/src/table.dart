import 'i_attribute.dart';

final class _Node<T extends IAttribute> {
  T data;
  _Node<T>? next;

  _Node(this.data, [this.next]);

  @override
  String toString() {
    return data.toString();
  }
}

final class Table<T extends IAttribute> {
  _Node<T>? _head;
  _Node<T>? _tail;

  String title;

  Table(this.title);

  T? get last => _tail?.data;

  T? get first => _head?.data;

  void forEach(void Function(T) action) {
    var temp = _head;
    while (temp != null) {
      action(temp.data);
      temp = temp.next;
    }
  }

  bool contains(String idAttribute, String idValue) {
    var temp = _head;
    while (temp != null) {
      if (temp.data.check(idAttribute, idValue)) {
        return true;
      }
      temp = temp.next;
    }
    return false;
  }

  bool insertWithoutCheck(T data) {
    var node = _Node<T>(data);
    if (_head == null) {
      _head = node;
      _tail = node;
      return true;
    }
    _tail?.next = node;
    _tail = node;
    return true;
  }

  bool insert(T data, {required String idAttribute, required String idValue}) {
    if (contains(idAttribute, idValue)) {
      return false;
    }
    return insertWithoutCheck(data);
  }

  void remove(String id, String idAttribute) {
    var current = _head;
    _Node<T>? prev;

    while (current != null && !current.data.check(idAttribute, id)) {
      prev = current;
      current = current.next;
    }

    if (current == null) {
      return;
    }

    if (prev == null) {
      _head = current.next;
    } else {
      prev.next = current.next;
    }

    if (current == _tail) {
      _tail = prev;
    }
  }

  Table<T> intersect(
    String attribute,
    String value,
    Table<T> table,
    String idAttribute,
  ) {
    var newTable = Table<T>('$title-${table.title}');
    forEach((data) {
      if (data.check(attribute, value)) {
        newTable.insertWithoutCheck(data);
      }
    });

    table.forEach((data) {
      if (data.check(attribute, value)) {
        newTable.insertWithoutCheck(data);
      }
    });

    return newTable;
  }

  Table<T> union(Table<T> table, String idAttribute) {
    var newTable = Table<T>('$title-${table.title}');
    forEach((data) {
      newTable.insertWithoutCheck(data);
    });

    table.forEach((data) {
      newTable.insertWithoutCheck(data);
    });

    return newTable;
  }
}
