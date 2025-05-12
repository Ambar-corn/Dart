import 'dart:async';

Future<int> asyncAdd(List<int> num) async {
  int sum = num.reduce((a, b) => a + b);
  return sum;
}
