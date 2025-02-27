//Пользователь вводит с клавиатуры строку. Реализуйте только extension
// StringReverser с методом reverseString() для класса String. Метод
// должен возвращать новую строку, содержащую символы исходной строки
// в обратном порядке.

extension StringReverser on String {
  String reverseString() {
    String str = "";
    str = this.split("").reversed.join();
    return str;
  }
}

void main() {
  String s = "Hello,world!";
  print(s.reverseString());
}
