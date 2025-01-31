class Book {
  String author;
  String title;
  int price;
  Book.withOutPrice(this.author, this.title, [this.price = 23]);
}
