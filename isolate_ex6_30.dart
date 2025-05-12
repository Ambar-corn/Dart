import 'dart:convert';
import 'dart:io';
import 'dart:isolate';

class User {
  final UserData data;
  final Support support;

  User({
    required this.data,
    required this.support,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      data: UserData.fromJson(json['data']),
      support: Support.fromJson(json['support']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data.toJson(),
      'support': support.toJson(),
    };
  }

  @override
  String toString() {
    return JsonEncoder.withIndent('  ').convert(this);
  }
}

class UserData {
  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String avatar;

  UserData({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json['id'],
      email: json['email'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      avatar: json['avatar'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'first_name': firstName,
      'last_name': lastName,
      'avatar': avatar,
    };
  }
}

class Support {
  final String url;
  final String text;

  Support({
    required this.url,
    required this.text,
  });

  factory Support.fromJson(Map<String, dynamic> json) {
    return Support(
      url: json['url'],
      text: json['text'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'url': url,
      'text': text,
    };
  }
}

Future<User?> fetchUser(int id) async {
  User? user;
  var httpClient = HttpClient();
  try {
    var request = await httpClient.getUrl(
      Uri.parse('https://reqres.in/api/users/$id'),
    ); // запрос по адресу, чтобы получить данные о пользователе
    // с конкретным id
    var response = await request.close();
    if (response.statusCode == HttpStatus.ok) {
      var responseBody = await response
          .transform(
            utf8.decoder,
          )
          .join();
      user = User.fromJson(jsonDecode(responseBody));
    }
  } catch (e) {
    print('An error occurred during the API call: $e');
  } finally {
    httpClient.close();
  }
  return user;
}

Future<User?> fetchUserWithoutId() async {
  return await fetchUser(1);
}

void main() async {
  print('Запуск main');
  // запуск изолята с передачей функции, требующей указание
  // аргумента и которая будет выполняться в новом изоляте
  Isolate.run<User?>(() => fetchUser(2)).then(
    (value) => print(value),
  );
  // или
  // var user = await Isolate.run<User?>(
  //   () => fetchUser(2),
  // );

  // запуск изолята с указанием функции без входных аргументов,
  // которая будет выполняться в новом изоляте
  Isolate.run<User?>(fetchUserWithoutId).then(
    (value) => print(value),
  );
  print('завершение main');
}
/* Запуск main
завершение main
{
  "data": {
    "id": 2,
    "email": "janet.weaver@reqres.in",
    "first_name": "Janet",
    "last_name": "Weaver",
    "avatar": "https://reqres.in/img/faces/2-image.jpg"
  },
  "support": {
    "url": "https://reqres.in/#support-heading",
    "text": "To keep ReqRes free, contributions towards server costs are appreciated!"
  }
}
{
  "data": {
    "id": 1,
    "email": "george.bluth@reqres.in",
    "first_name": "George",
    "last_name": "Bluth",
    "avatar": "https://reqres.in/img/faces/1-image.jpg"
  },
  "support": {
    "url": "https://reqres.in/#support-heading",
    "text": "To keep ReqRes free, contributions towards server costs are appreciated!"
  }
} */
