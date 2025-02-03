// Создайте класс House с полями address, price и rooms. Используйте именованные
// аргументы в конструкторе, где price и rooms являются необязательными, а address
//  обязательным. Реализуйте метод, который возвращает описание дома.
class House {
  String address;
  double price;
  int rooms;
  House({required this.address, this.price = 0.0, this.rooms = 1});
  void display() {
    print(
        "Адрес: $address \nЦена: ${price > 0 ? price : "Не указана"} \nКомнат: $rooms");
  }
}

void main(List<String> arguments) {
  var house = House(address: "Номер дома", price: 2000, rooms: 23);
  house.display();
}
