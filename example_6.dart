class OverWeight implements Exception {
  final String? msg;
  const OverWeight([this.msg]);
  @override
  String toString() => msg ?? "OverWeight";
}

class OverVolume implements Exception {
  final String? msg;
  const OverVolume([this.msg]);
  @override
  String toString() => msg ?? "OverVolume";
}

class Book {
  String name;
  String author;
  DateTime publication;
  double weight;
  double cost;
  int width;
  int height;
  int thickness;

  Book(this.name, this.author, this.publication, this.weight, this.cost,
      this.width, this.height, this.thickness);
  int volume() {
    return width * height * thickness;
  }

  @override
  String toString() {
    return "Название: $name, Автор: $author, Год: $publication, Стоимость: $cost";
  }
}

class Section {
  List<Book> books = [];
  double maxWeight;
  int maxVolume;
  Section(this.maxWeight, this.maxVolume);

  double currentWeight() {
    if (books.isEmpty) {
      return (0.0);
    }
    return books.fold<double>(0.0, (current, book) => current + book.weight);
  }

  int currentVolume() {
    if (books.isEmpty) {
      return (0);
    }
    return books.fold<int>(0, (current, book) => current + book.volume());
  }

  void addBook(Book book) {
    double currentW = currentWeight();
    int currentV = currentVolume();
    if (currentW + book.weight > maxWeight) {
      throw OverWeight("Слишком большой вес для секции");
    }
    if (currentV + book.volume() > maxVolume) {
      throw OverVolume("Слишком большой объём для секции");
    }
    books.add(book);
  }

  void removeBook(String nameBook, String nameAuthor) {
    books.removeWhere(
        (book) => book.name == nameBook && book.author == nameAuthor);
  }

  double totalCostSection() {
    return books.fold<double>(
        0.0, (initialValue, book) => initialValue + book.cost);
  }

  List<Book> authorSearch(String name) {
    return books.where((book) => book.author == name).toList();
  }

  List<Book> searchMinCost(double minCost) {
    return books.where((book) => book.cost >= minCost).toList();
  }

  List<Book> searchRange(DateTime startTime, DateTime endTime) {
    return books
        .where((book) =>
            !book.publication.isAfter(endTime) &&
            !book.publication.isBefore(startTime))
        .toList();
  }

  @override
  String toString() {
    // TODO: implement toString
    return ("Section: ${books.toList()}");
  }
}

class Bookshelf {
  List<Section> sections;
  int maxSection = 10;
  Bookshelf(this.sections);

  double totalCost() {
    return sections.fold(0.0,
        (initialValue, section) => initialValue + section.totalCostSection());
  }

  // List<Book> authorGlobalSearch(String name) {
  //   return sections.fold<List<Book>>(
  //       [],
  //       (initialValue, section) =>
  //           initialValue..addAll(section.authorSearch(name)));
  // }

  List<Book> authorGlobalSearch(String name) {
    return sections.expand((section) => section.authorSearch(name)).toList();
  }

  List<Book> minCostGlobal(double minCost) {
    return sections
        .expand((section) => section.searchMinCost(minCost))
        .toList();
  }

  List<Book> searchGlobalRange(DateTime startTime, DateTime endTime) {
    return sections
        .expand((section) => section.searchRange(startTime, endTime))
        .toList();
  }

  @override
  String toString() {
    // TODO: implement toString
    return ("Sections: ${sections.toList()}");
  }
}

void main() {
  Book book1 = Book("Книга 1", "Автор 1", DateTime(500), 1.0, 10.0, 10, 20, 5);
  Book book2 = Book("Книга 2", "Автор 2", DateTime(1000), 2.0, 20.0, 15, 25, 3);
  Book book3 = Book("Книга 3", "Автор 3", DateTime(1500), 1.5, 30.0, 12, 22, 4);
  Book book4 = Book("Книга 4", "Автор 4", DateTime(1800), 0.8, 40.0, 14, 24, 6);
  Book book5 = Book("Книга 5", "Автор 5", DateTime(2000), 1.2, 50.0, 13, 23, 5);
  Book book6 = Book("Книга 6", "Автор 6", DateTime(2020), 0.9, 60.0, 11, 21, 7);
  Section section1 = Section(10.0, 10000);
  section1.addBook(book1); // 500
  section1.addBook(book2); // 1000
  section1.addBook(book3); // 1500
  section1.addBook(book4); // 1800
  print(section1);
  section1.removeBook("Книга 2", "Автор 2");
  Section section2 = Section(10.0, 10000);
  section2.addBook(book2); // 1000
  section2.addBook(book4); // 1800
  section2.addBook(book5); // 2000
  section2.addBook(book6); // 2020
  Bookshelf bookshelf = Bookshelf([section1, section2]);
  print(bookshelf);
  print(section1);
}
