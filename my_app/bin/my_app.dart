import 'package:args/args.dart';

void main(List<String> arguments) {
  var parser = ArgParser();

  parser.addOption(
    //добавляем параметр/свойство в парсер
    'firts', // по данному ключу будет осуществляться поиск данных
    abbr: 'a', // имя свойства при его указании в момент запуска
    help: 'First number',
    defaultsTo: '1', // значение по умолчанию
  );
  parser.addOption(
    'second',
    abbr: 'b',
    help: 'Second number',
    defaultsTo: '5',
  );
  parser.addFlag(
    //добавляем флаг в парсер
    'subtract',
    abbr: 's',
    help: 'Subtract mode',
    defaultsTo: false,
  );

  var args = parser.parse(arguments);
  print(arguments);
  var a = int.parse(args['firts']);
  var b = int.parse(args['second']);
  if (args['subtract']) {
    print('a - b = ${a - b}');
  } else {
    print('a + b = ${a + b}');
  }
}
