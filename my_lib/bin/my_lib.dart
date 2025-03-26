import 'package:my_lib/calculator.dart';

void main(List<String> arguments) {
  final calc = MyMath();
  print(calc.add(10, 34.2)); // 44.2
  print(calc.mul(10, 4.2)); // 42.0
  print(calc.sub(10, 4.8)); // 5.2
  print(calc.powN(10, 3)); // 1000.0
}
