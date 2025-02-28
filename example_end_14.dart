//Реализуйте класс Product и Order. Order может состоять из любого количества
//Products (Phone, TV, PC и т.д), которые составляют его итоговую стоимость.
// Предусмотрите возможность предоставления скидок на определенные товары в
//заказе и на общую стоимость заказа. Обеспечьте возможность получения информации
//о стоимости товаров определенного типа в заказе.P.S. Для проверки типа используйте метод runtimeType.

abstract class Product {
  String name;
  int price;

  Product(this.name, this.price);
}

class Phone extends Product {
  // code
  Phone(super.name, super.price);
}

class TV extends Product {
  // code
  TV(super.name, super.price);
}

class PC extends Product {
  // code
  PC(super.name, super.price);
}

class Order {
  List<Product> products;
  late int cost;
  Order(this.products);

  int getTotalCost() {
    // code
    return products.fold<int>(0, (sum, product) => sum + product.price);
  }

  int getProductTypeCost(Type type) {
    // code
    return products
        .where((product) => product.runtimeType == type)
        .fold<int>(0, (sum, product) => sum + product.price);
  }

  double getTotalDiscountedCost(double discount) {
    // code
    return getTotalCost() - (getTotalCost() * discount) / 100;
  }

  double getProductTypeDiscountedCost(Type type, double discount) {
    // code
    return getProductTypeCost(type) -
        (getProductTypeCost(type) * discount) / 100;
  }
}

void main() {
  PC pc = PC("fsf", 1);
  PC pc1 = PC("asf", 23);
  PC pc2 = PC("f", 234);

  Phone phone = Phone("ae", 34);
  TV tv = TV("tv", 1);
  Order order = Order([pc, pc2, pc1, phone, tv]);
  print(order.getTotalCost());
  print(order.getProductTypeCost(PC));
  print(order.getTotalDiscountedCost(20));
  print(order.getProductTypeDiscountedCost(PC, 20));
}
