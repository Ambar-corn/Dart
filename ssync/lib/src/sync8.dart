import 'dart:io';

//Напишите функцию youFunction, в теле которой считывается содержимое
//многострочного текстового файла input1.txt и ее инвертированное
//представление записывается в output.txt .

void main() {
  void youFunction() {
    File input1 = File('X:/DARTLESS/ssync/lib/src/input1.txt');
    File output = File('X:/DARTLESS/ssync/lib/src/output.txt');

    List<String> fileFirst = input1.readAsStringSync().split("\n");
    List<String> invertion;

    output.writeAsStringSync(fileFirst
        .map((str) => str.split('').reversed.join('').trim())
        .join('\n'));
    print('\n$fileFirst');
  }

  youFunction();
}
