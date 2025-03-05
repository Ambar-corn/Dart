// Реализуйте класс Scale (весы) и Product (и его производные классы - картошка,
// огурец, помидор, арбуз) . В конструктор класса Scale передайте максимальный вес,
// который они могут выдержать. Также данный класс должен предоставлять пользователю
// следующие методы: добавление и удаление товаров, сортировку товаров по стоимости
// и весу, нахождение товара с минимальной стоимостью, товара с максимальным весом,
// определение текущего веса всех товаров на весах и общего веса товаров определенного типа.
// Если общий вес товаров равен или превышает максимальный, новые товары не должны
// добавляться на весы P.S. Для проверки типа используйте метод runtimeType.

abstract class Product {
  final String name;
  final double weight;
  final int price;

  Product(this.name, this.weight, this.price);
}

class Potato extends Product {
  //code
  Potato(super.name, super.weight, super.price);
}

class Cucumber extends Product {
  //code
  Cucumber(super.name, super.weight, super.price);
}

class Tomato extends Product {
  //code
  Tomato(super.name, super.weight, super.price);
}

class Watermelon extends Product {
  Watermelon(super.name, super.weight, super.price);
}

class Scale {
  final double maxWeight;
  List<Product> products = [];

  Scale(this.maxWeight);

  bool addProduct(Product product) {
    //code
    if (getTotalWeight() + product.weight < maxWeight) {
      products.add(product);
      return true;
    } else
      return false;
  }

  bool removeProduct(Product product) {
    //code
    return products.remove(product);
  }

  void sortByPrice() {
    //code
    products.sort((a, b) => a.price.compareTo(b.price));
  }

  void sortByWeight() {
    //code
    products.sort((a, b) => a.weight.compareTo(b.weight));
  }

  Product? getMinPriceProduct() {
    //code
    return products.fold<Product>(products[0],
        (min, current) => min.price < current.price ? min : current);

    //if (products.isEmpty) return null;
    //return products.reduce((min, current) => min.price < current.price ? min : current);
  }

  Product? getMaxWeightProduct() {
    //code
    return products.fold<Product>(products[0],
        (max, current) => max.weight > current.weight ? max : current);
  }

  double getTotalWeight() {
    //code
    return products.fold<double>(0.0, (sum, product) => sum + product.weight);
  }

  double getTotalWeightByType(Type productType) {
    //code
    return products
        .where((product) => product.runtimeType == productType)
        .fold<double>(0.0, (sum, product) => sum + product.weight);
    // fold<double>(0.0(sum, combine)=>)
  }
}

void main() {
  Tomato tomato = Tomato("name", 31, 23);
  Cucumber cucumber = Cucumber("324", 34, 11);
  Cucumber cucumber1 = Cucumber("324", 24, 131);
  Watermelon watermelon = Watermelon("ffsdname", 3, 9);

  Scale scale = Scale(1500);
  scale.addProduct(tomato);
  scale.addProduct(cucumber);
  scale.addProduct(cucumber1);
  scale.addProduct(watermelon);
  print(scale.products);
  // print(scale.getTotalWeight());
  // print(scale.products);
  // // scale.removeProduct(cucumber);
  // scale.sortByPrice();
  // print(scale.products);
  // scale.sortByWeight();
  // print(scale.products);

  print(scale.getTotalWeightByType(Cucumber));
}
