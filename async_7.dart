import 'dart:async';
import "dart:io";

Future<String> asyncReverseString(String word) async {
  List<String> letters = word.split('');
  List<String> reversedLetter = letters.reversed.toList();
  String reversedWord = reversedLetter.join("");
  // print("Результат = $reversedWord");
  return reversedWord;
}

void main() {
  print("Ввод");
  String bukava = stdin.readLineSync()!;
  // var b = bukava.split("");
  // List<String> s = b.reversed.toList();
  // String j = s.join('');
  // print(j);

  asyncReverseString(bukava);
}
