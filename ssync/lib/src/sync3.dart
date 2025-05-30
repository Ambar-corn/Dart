import 'dart:io';

///Напишите функцию youFunction, в теле которой построчно считывается содержимое
///содержимое нескольких текстовых файлов input1.txt и input2.txt, с последующей
///записью строк в файл output.txt. Записываемые строки чередуются.
///Первой записывается строка из файла input1.txt. Если в любом из файлов закончились
/// данные, в конец output.txt записываются все данные из оставшегося файла.

void main() {
  void youFunction() {
    File input1 = File('X:/DARTLESS/ssync/lib/src/input1.txt');
    File input2 = File('X:/DARTLESS/ssync/lib/src/input2.txt');
    File output = File('X:/DARTLESS/ssync/lib/src/output.txt');

    List<String> lineFirst = input1.readAsStringSync().split("\n");
    List<String> lineSecond = input2.readAsStringSync().split("\n");
    // output.writeAsString("$lineFirst}\n", mode: FileMode.append);
    // output.writeAsString("$lineSecond}\n", mode: FileMode.append);
    print(lineFirst);
    print(lineSecond);
    int max = lineFirst.length > lineSecond.length
        ? lineFirst.length
        : lineSecond.length;
    print(max);
    for (var i = 0; i <= max; i++) {
      if (i < lineFirst.length) {
        output.writeAsStringSync('${lineFirst[i]}\n', mode: FileMode.append);
      }
      if (i < lineSecond.length) {
        output.writeAsStringSync('${lineSecond[i]}\n', mode: FileMode.append);
      }
      print(output.readAsStringSync());
    }
    print(output.readAsStringSync());
  }

  youFunction();
}
