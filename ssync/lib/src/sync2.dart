import 'dart:io';

///Напишите функцию youFunction, в теле которой считывается содержимое текстового файла input.txt,
///вычисляется количество слов и полученное значение записывается в новый файл output.txt

void main() {
  void youFunction() {
    File input = File('X:/DARTLESS/ssync/lib/src/input.txt');
    File output = File('X:/DARTLESS/ssync/lib/src/output.txt');
    print(input.readAsStringSync());

    List<String> line = input.readAsStringSync().split(" ");
    output.writeAsStringSync('${line.length}');
    print(output.readAsStringSync());
  }

  youFunction();
}
