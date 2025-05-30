import 'dart:io';

//Напишите функцию youFunction, в теле которой считывается содержимое текстового файла data.txt, где через пробел записано 2 целых числа. Найдите их сумму и добавьте ее на следующую строку файла data.txt.
void main() {
  void youFunction() {
    File file = File('X:/DARTLESS/ssync/lib/src/data.txt');
    print(file.readAsStringSync());

    List<String> line = file.readAsStringSync().split(" ");
    int first = int.parse(line[0]);
    int second = int.parse(line[1]);
    int sum = first + second;
    file.writeAsStringSync("\n${sum.toString()}", mode: FileMode.append);
    print(file.readAsStringSync());
  }

  youFunction();
}
