import 'dart:io';
import 'dart:async';

Future<int> asyncAdd(int a, int b) async {
  int sum = a + b;
  print("Результат = $sum");
  return sum;
}

void main() {
  print("Ввод");
  String? num_a = stdin.readLineSync();
  String? num_b = stdin.readLineSync();
  int a = int.parse(num_a!);
  int b = int.parse(num_b!);
  asyncAdd(a, b);
}
