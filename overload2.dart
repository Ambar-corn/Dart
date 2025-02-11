class Role {
  final String name;
  final int _accessLevel; //s Теперь поле _accessLevel можно сделать закрытым
  const Role(this.name, this._accessLevel);
  bool operator >(Role other) {
    return this._accessLevel > other._accessLevel; //Слово operator в сочетании
  } // с обозначением оператора говорит, какой оператор мы

  bool operator <(Role other) {
    //собираемся переопределить
    return this._accessLevel < other._accessLevel;
  }
}
