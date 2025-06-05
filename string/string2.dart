import 'dart:io';

//Напишите приложение, где пользователь вводит строку и букву.
//Выведите в терминал длину строки, также индекс первого и
//последнего вхождения буквы в строку.

void main() {
  String? input = stdin.readLineSync();
  String? letter = stdin.readLineSync();
  String word = input!;
  List<String> a = word.split(' ');
//   String letter = a[1];
  String b = word[0];
  int length = word.length;
  int first = word.indexOf(letter!);
  int last = word.lastIndexOf(letter);
  print('$length $first $last');
}
