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
  int publication;
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

  double totalCostSection() {
    return books.fold<double>(
        0.0, (initialValue, book) => initialValue + book.cost);
  }

  List<Book> authorSearch(String name) {
    return books.where((book) => book.author == name).toList();
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

  @override
  String toString() {
    // TODO: implement toString
    return ("Sections: ${sections.toList()}");
  }
}

void main() {
  Book book1 = Book("name", "author2", 1293, 3, 32, 2, 1, 4);
  Book book2 = Book("name1", "author1", 123, 0.5, 2, 1, 1, 4);
  Book book3 = Book("name2", "autho2r", 123333, 0.6, 332, 3, 1, 4);

  Book book4 = Book("book4", "author4", 1000, 0.4, 40, 4, 2, 5);
  Book book5 = Book("book5", "author5", 2000, 0.5, 50, 5, 3, 6);
  Book book6 = Book("book6", "author6", 3000, 0.6, 60, 6, 4, 7);
  Section noName = Section(23, 100);
  noName.addBook(book1);
  noName.addBook(book2);
  noName.addBook(book3);
  noName.addBook(book4);
  noName.totalCostSection();

  Section name = Section(122, 500);
  name.addBook(book1);
  name.addBook(book2);
  name.addBook(book3);
  name.addBook(book4);
  List<Book> a = noName.authorSearch("author2");
  Bookshelf bookshelf = Bookshelf([name, noName]);
  print(a[0].author);
  print(bookshelf.totalCost());
}
