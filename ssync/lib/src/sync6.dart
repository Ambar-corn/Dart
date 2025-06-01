import 'dart:io';

//Напишите функцию youFunction, в теле которой считывается содержимое содержимое
// многострочного текстового файла input1.txt и записывает в новый файл output.txt
//  через пробел только уникальные слова.

void main() {
  void youFunction() {
    File input1 = File('X:/DARTLESS/ssync/lib/src/input1.txt');
    File output = File('X:/DARTLESS/ssync/lib/src/output.txt');

    List<String> outSpace = input1.readAsStringSync().split(RegExp(r'[ \n]+'));
    List<String> uniqueWords = outSpace.toSet().toList();

    String correct = uniqueWords.map((e) => e).join(' ');
    output.writeAsStringSync(correct);
    print(correct);
  }

  youFunction();
}
