// Пользователь вводит с клавиатуры целочисленный список.
// Реализуйте только extension ListDoubler с методом doubleList()
// для класса List<int>. Метод должен возвращать новый список,
// содержащий удвоенные значения.

extension ListDoubler on List<int> {
  List<int> doubleList() {
    List<int> u = [];
    for (var element in this) {
      u.add(element * 2);
    }
    return u;
  }
}

//другой вариант
//extension ListDoubler on List<int> {
//   List<int> doubleList() {
//     return this.map((number) => number * 2).toList();
//   }
// }

void main() {
  List<int> lic = [1, 2, 3, 4];
  print(lic.doubleList());
}
