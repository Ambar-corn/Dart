import 'dart:async';

Future<int> countUpperCaseLetters(String word) async {
  List<String> a = word.split('');
  int count = 0;
  for (String letter in a) {
    if (letter.toUpperCase() == letter) {
      count++;
    }
  }
  return count;
}
