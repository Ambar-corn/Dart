/**Реализуйте систему для управления товарами и заказами в интернет-магазине. 
 * В системе должны быть реализованы классы Item и Purchase. Каждый Item (например, 
 * Laptop, Smartphone, Headphones) принадлежит к определенной категории (например, 
 * "Электроника", "Аксессуары"). Purchase может содержать любое количество Item 
 * и поддерживать следующие функции:
Расчет общей стоимости с учетом налогов (налог зависит от категории товара).

Применение временных скидок (скидки имеют срок действия и могут быть применены ко всему заказу).

Самый дорогой и самый дешевый товар в заказе.

Возможность отмены скидок на определенные категории товаров.

Проверка на превышение лимита стоимости заказа (например, не более 1,000,000).

Для проверки типов и категорий используйте runtimeType и перечисления (enum). 

 */

enum Category { Electronics, Accessories, Clothing }

abstract class Item {
  String name;
  double price;
  Category category;

  Item(this.name, this.price, this.category);
}

class Laptop extends Item {
  // Реализация
  Laptop(super.name, super.price, super.category);
}

class Smartphone extends Item {
  // Реализация
  Smartphone(super.name, super.price, super.category);
}

class Headphones extends Item {
  // Реализация
  Headphones(super.name, super.price, super.category);
}

class Discount {
  double percentage; // Процент скидки (0-100)
  DateTime expiryDate; // Дата истечения скидки

  Discount(this.percentage, this.expiryDate);

  bool isValid(DateTime currentDate) {
    // Проверка срока действия
    return currentDate.toUtc().isBefore(expiryDate.toUtc());
  }
}

class Purchase {
  List<Item> items;
  List<Discount> discounts;
  static const double maxOrderLimit = 1000000;
  static const Map<Category, double> taxRates = {
    Category.Electronics: 0.2, // 20% налог
    Category.Accessories: 0.1, // 10% налог
    Category.Clothing: 0.15 // 15% налог
  };

  Purchase(this.items, {this.discounts = const []});

  // Основные методы
  double getTotalCostWithTaxes() {
    // Учитывать налоги для каждой категории
    double result = 0.0;
    for (Item item in items) {
      if (!taxRates.containsKey(item.category)) {
        throw Exception("No tax rate defined for category: ${item.category}");
      }

      double taxRate = taxRates[item.category]!;

      result += item.price + (item.price * taxRate);

      // if (item.category == Category.Electronics) {
      //   result += item.price+(item.price* 0.2);
      // }
      // if (item.category == Category.Accessories) {
      //   result += item.price +(item.price* 0.1);
      // }
      // if (item.category == Category.Clothing) {
      //   result += item.price +(item.price* 0.15);
      // }
    }
    if (result > maxOrderLimit) {
      throw Exception(
          "Total cost with taxes exceeds the maximum order limit of $maxOrderLimit");
    }
    return result;
  }

  double getCategoryCost(Category category) {
    // Стоимость товаров заданной категории

    double sum = items
        .where((item) => item.category == category)
        .fold(0.0, (sum, item) => sum + item.price);
    if (sum > maxOrderLimit) {
      throw Exception(
          "Cost of category $category exceeds the maximum limit of $maxOrderLimit");
    }
    return sum;
  }

  double applyDiscounts(DateTime currentDate) {
    // Применить все действующие скидки и вернуть итоговую стоимость
    double totalDiscont = discounts
        .where((discount) => discount.isValid(currentDate))
        .fold(0.0, (sum, discount) => sum + discount.percentage);
    double totalCost = getTotalCostWithTaxes();
    return totalCost - ((totalCost / 100) * totalDiscont);
  }

  Item? getMostExpensiveItem() {
    // Вернуть самый дорогой товар
    if (items.isEmpty) return null;
    return items
        .reduce((max, current) => max.price > current.price ? max : current);
  }

  Item? getCheapestItem() {
    // Вернуть самый дешевый товар
    if (items.isEmpty) return null;
    return items
        .reduce((min, current) => min.price < current.price ? min : current);
  }

  void checkOrderLimit() {
    // Проверить, не превышает ли заказ лимит
    if (getTotalCostWithTaxes() > maxOrderLimit) {
      throw Exception(
          "Total cost with taxes exceeds the maximum order limit of $maxOrderLimit");
    }
  }
}
