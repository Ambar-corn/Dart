//Реализуйте класс «Книжный шкаф», который содержит информацию о максимальном
// весе хранимых книг и их количестве. Класс «Книга» должен содержать поля:
//название, автор, год издания, вес и стоимость книги. При добавлении книги
//в шкаф осуществляется проверка по весу и количеству книг, которые может
//вместить шкаф в данный момент. Если один из этих параметров больше разрешенного,
// то книга в шкаф не добавляется. Дополнительно для книжного шкафа реализуйте
//методы поиска книги по автору, расчет полной стоимости и веса хранимых книг,
// получения списка книг, чья стоимость >= указанной.

class Book {
  final String title;
  final String author;
  final int year;
  final double weight;
  final double price;

  Book(this.title, this.author, this.year, this.weight, this.price);
}

class Bookshelf {
  final double maxWeight;
  final int maxBooks;
  List<Book> books = [];
  double currentWeight = 0.0;
  int currentBooks = 0;
  Bookshelf(this.maxWeight, this.maxBooks);

  bool addBook(Book book) {
    if (books.length < maxBooks && (currentWeight + book.weight) <= maxWeight) {
      books.add(book);
      currentWeight += book.weight;
      currentBooks = books.length;
      return true;
    }
    return false;
  }

  List<Book> searchByAuthor(String author) {
    // code
    return books.where((book) => book.author == author).toList();
  }

  double calculateTotalPrice() {
    // code
    return books.fold<double>(0.0, (sum, book) => sum + book.price);
  }

  double calculateTotalWeight() {
    return currentWeight;
  }

  List<Book> getBooksWithPriceAbove(double minPrice) {
    // code
    return books.where((book) => book.price >= minPrice).toList();
  }
}

void main() {
  Book book1 = Book("sdjf", "sd324r", 12, 23.2, 21.3);
  Book book2 = Book("fwesjf", "324324r", 312, 1.2, 231.3);
  Book book3 = Book("swefw", "r", 342, 2.2, 2.3);
  Bookshelf shelf = Bookshelf(23, 4);
  shelf.addBook(book1);
  print(shelf.books);
  shelf.addBook(book2);
  print(shelf.books);
  shelf.addBook(book3);
  print(shelf.books);
}
