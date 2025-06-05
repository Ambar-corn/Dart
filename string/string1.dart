import 'dart:io';
//Напишите приложение, где пользователь вводит строку и букву, наличие
//которой предстоит проверить в введенной строке. Выведите в терминал
//полученный результат в терминал.

void main() {
  String? input = stdin.readLineSync();
  List<String> word = input!.split(' ');
  String testLetter = word[1];
  List<String> listLetter = word[0].split('');
  print(listLetter.contains(testLetter));
}
