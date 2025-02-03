class Book {
  int price;
  String author;
  String title;

  Book(this.price, this.author, this.title);
  factory Book.priceWithRoalty(int price, String author, String title) {
    price += 500;
    return Book(price, author, title);
  }
  // ваш код
}
