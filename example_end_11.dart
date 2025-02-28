// Пользователь вводит с клавиатуры 2 целых числа, разделенных пробелом. Создайте функцию
// divideNumbers(), которая принимает эти числа в качестве аргументов и возвращает
// результат их целочисленного деления. Однако, если второе число равно нулю, функция
// должна выбрасывать исключение пользовательское  исключение CustomExceptionс текстом "DivideByZero".
class CustomException implements Exception {
  final String? msg;
  const CustomException([this.msg]);

  @override
  String toString() => msg ?? 'DivideByZero';
}

int divideNumbers(int first, int second) {
  if (second == 0) {
    throw CustomException();
  } else
    return first ~/ second;
}

void main() {
  var a = divideNumbers(13, 3);
  print(a);
}
