import 'dart:io';
import 'package:collection/collection.dart';

//Напишите функцию youFunction, в теле которой считывается содержимое
//многострочного текстового файла input1.txt, содержащего  целочисленные
//значения (разделенные пробелом) и высчитывается их минимальное и
//максимальное значение, котороые записываются в файл  output.txt в формате
// "min: value || max: value", где value - найденные значения.

void main() {
  void youFunction() {
    File input1 = File('X:/DARTLESS/ssync/lib/src/input1.txt');
    File output = File('X:/DARTLESS/ssync/lib/src/output.txt');

    List<String> fileFirst = input1.readAsStringSync().split(RegExp(r'[ \n]+'));
    List<int> sumFirst =
        fileFirst.map((element) => int.parse(element)).toList();
    int? max = sumFirst.max;
    int? min = sumFirst.min;
    output.writeAsStringSync('min: $min || max: $max');
  }

  youFunction();
}
