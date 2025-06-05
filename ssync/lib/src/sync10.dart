import 'dart:io';
//Напишите функцию youFunction, в теле которой считывается содержимое
//двух многострочных текстовых файлов input1.txt и  input2.txt с целочисленными
//значениями (разделенные пробелом) и высчитывается их общая сумма. Функция
//должна завершиться записью результирующей суммы в файл  output.txt .

void main() {
  void youFunction() {
    File input1 = File('X:/DARTLESS/ssync/lib/src/input1.txt');
    File output = File('X:/DARTLESS/ssync/lib/src/output.txt');
    File input2 = File('X:/DARTLESS/ssync/lib/src/input2.txt');

    List<String> fileFirst = input1.readAsStringSync().split(RegExp(r'[ \n]+'));
    List<String> fileSecond =
        input2.readAsStringSync().split(RegExp(r'[ \n]+'));
    // output.writeAsStringSync(fileSecond.toString());
    int sumFirst = fileFirst
        .map((element) => int.parse(element))
        .reduce((value, element) => value + element);
    int sumSecond = fileSecond
        .map((element) => int.parse(element))
        .reduce((value, element) => value + element);

    int totalSum = sumFirst + sumSecond;
    output.writeAsStringSync(totalSum.toString());

    print(totalSum);
  }

  youFunction();
}
