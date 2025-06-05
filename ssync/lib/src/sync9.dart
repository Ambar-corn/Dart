import 'dart:io';
//Напишите функцию youFunction, в теле которой считывается содержимое
//многострочного текстового файла input1.txt и подсчитывается количество
//гласных и согласных букв. Запишите полученный результат в файл output.txt .

void main() {
  void youFunction() {
    File input1 = File('X:/DARTLESS/ssync/lib/src/input1.txt');
    File output = File('X:/DARTLESS/ssync/lib/src/output.txt');

    String fileFirst = input1.readAsStringSync();
    String vowels = 'aeiouAEIOUаеёиоуыэюяАЕЁИОУЫЭЮЯ';
    String consonants =
        'bcdfghjklmnpqrstvwxyzBCDFGHJKLMNPQRSTVWXYZбвгджзйклмнпрстфхцчшщБВГДЖЗЙКЛМНПРСТФХЦЧШЩ';
    List<String> vowelsList = vowels.split('');
    List<String> consonantslsList = consonants.split('');
    List<String> listWords = fileFirst.split('');
    int countsVowels = 0;
    int countsConsonants = 0;

    // for (var word in listWords) {
    //   for (var vowelsWord in vowelsList) {
    //     if (word.contains(vowelsWord)) {
    //       countsVowels += 1;
    //     }
    //   }
    // }
    countsVowels = listWords.where((word) => vowelsList.contains(word)).length;
    countsConsonants =
        listWords.where((word) => consonantslsList.contains(word)).length;
    output.writeAsStringSync(
        'Vowels: $countsVowels, Consonants: $countsConsonants');
    // print('${vowelsList.map((element) => element.split(''))}\n');
    // print('1 : $countsVowels\n 2 : $countsConsonants');
  }

  youFunction();
}
