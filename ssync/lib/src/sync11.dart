import 'dart:io';

//Напишите функцию youFunction, в теле которой считывается содержимое многострочного
// текстового файла input1.txt, содержащего  целочисленные значения (разделенные
//пробелом) и высчитывается их среднеарифметическое значение, которое записывается
// в файл  output.txt .
void main() {
  void youFunction() {
    File input1 = File('X:/DARTLESS/ssync/lib/src/input1.txt');
    File output = File('X:/DARTLESS/ssync/lib/src/output.txt');

    List<String> fileFirst = input1.readAsStringSync().split(RegExp(r'[ \n]+'));
    int length = fileFirst.length;
    int sumFirst = fileFirst
        .map((element) => int.parse(element))
        .reduce((value, element) => value + element);
    double mid = sumFirst / length;
    output.writeAsStringSync(mid.toStringAsFixed(2));

    print(length);
  }

  youFunction();
}
