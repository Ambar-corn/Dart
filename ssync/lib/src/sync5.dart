import 'dart:io';

//Напишите функцию youFunction, в теле которой считывается содержимое содержимое
// многострочного текстового файла input1.txt и подсчитывается количество
//вхождений каждого слова.  Построчно запишите в новый файл output.txt  эти
//данные в формате: "слово:количество_вхождений".

void main() {
  void youFunction() {
    File input1 = File('X:/DARTLESS/ssync/lib/src/input1.txt');
    File output = File('X:/DARTLESS/ssync/lib/src/output.txt');

    List<String> outSpace = input1.readAsStringSync().split(RegExp(r'[ \n]+'));

    final Map<String, int> counts = {};
    for (String item in outSpace) {
      final cleaned = item.trim();
      if (cleaned.isNotEmpty) {
        counts[cleaned] = (counts[cleaned] ?? 0) + 1;
      }
    }
    String correct =
        counts.entries.map((e) => '${e.key}:${e.value}').join('\n');
    output.writeAsStringSync(correct);
  }

  youFunction();
}
