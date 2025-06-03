import 'dart:io';

//Напишите функцию youFunction, в теле которой считывается и построчно сравнивается
//содержимое содержимое нескольких текстовых файлов input1.txt и input2.txt.
//Если строки отличаются, то запишите их в новый файл output.txt
// (сначала с файла input1.txt, потом input2.txt).

void main() {
  void youFunction() {
    File input1 = File('X:/DARTLESS/ssync/lib/src/input1.txt');
    File input2 = File('X:/DARTLESS/ssync/lib/src/input2.txt');
    File output = File('X:/DARTLESS/ssync/lib/src/output.txt');

    List<String> fileFirst = input1.readAsStringSync().split("\n");
    List<String> fileSecond = input2.readAsStringSync().split("\n");

    for (int i = 0; i < fileFirst.length; i++) {
      int different = fileFirst[i].compareTo(fileSecond[i]);
      if (different > 0) {
        output.writeAsStringSync('${fileFirst[i]}\n', mode: FileMode.append);
        output.writeAsStringSync('${fileSecond[i]}\n', mode: FileMode.append);
      }
    }
  }

  youFunction();
}
