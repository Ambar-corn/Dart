extension MyString on String {
  bool isUrl() {
    //return startsWith("http://dart.d") || startsWith("https://dart.d");
    return endsWith("dev") || endsWith(".dev");
  }

  List<String> toList() => split(''); 
}

void main(List<String> arguments) {
  var url = "https://dart.dev";
  print(url.toList());   
  // [h, t, t, p, s, :, /, /, d, a, r, t, ., d, e, v]

  print(url.isUrl()); // true

  url = '-_-';
  print(url.isUrl()); // false
}