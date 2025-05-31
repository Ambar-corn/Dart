import 'dart:io';
import 'dart:typed_data';

//Напишите функцию youFunction, в теле которой считывается содержимое содержимое
// нескольких текстовых файлов input1.txt и input2.txt, с последующей записью
// отсортированных в алфавитном порядке строк в файл output.txt.

void main() {
  void youFunction() {
    File input1 = File('X:/DARTLESS/ssync/lib/src/input1.txt');
    File input2 = File('X:/DARTLESS/ssync/lib/src/input2.txt');
    File output = File('X:/DARTLESS/ssync/lib/src/output.txt');

    String fileFirst = input1.readAsStringSync();
    String fileSecond = input2.readAsStringSync();

    output.writeAsStringSync(fileFirst + '\n' + fileSecond);

    output.readAsStringSync();
    List<String> outSort = output.readAsStringSync().split('\n');
    outSort.sort();
    output.writeAsStringSync(outSort.join('\n'));
  }

  youFunction();
}
