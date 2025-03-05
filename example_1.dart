//Создай класс BankAccount, представляющий банковский счет, со следующими характеристиками:
//Приватные поля:
//_balance — баланс счета (тип double).
//_accountNumber — номер счета (тип String).
//Конструктор:
//Принимает начальный баланс и номер счета.
//Геттеры:
//Для получения значений balance и accountNumber.
//Методы:
//deposit(double amount) — добавляет сумму к балансу, если сумма положительная.
//withdraw(double amount) — снимает сумму с баланса, если средств достаточно и сумма положительная, иначе выводит сообщение об ошибке.
//transfer(BankAccount targetAccount, double amount) — переводит сумму с текущего счета на другой счет, если средств достаточно и сумма положительная.

class BankAccount {
  double _balance;
  String _accountNumber;
  BankAccount(this._balance, this._accountNumber);
  double get balance => _balance;
  String get accountNumber => _accountNumber;
  void deposit(double amount) {
    if (amount <= 0) {
      print("Введите сумму больше 0");
    } else
      _balance += amount;
  }

  void withdraw(double amount) {
    if (amount <= 0 || _balance - amount < 0) {
      print("Недостаточно средств или сумма меньше 0");
    } else
      _balance -= amount;
  }

  void transfer(BankAccount targetAccount, double amount) {
    if (this._balance - amount < 0 || amount <= 0) {
      print("Недостаточно денег или сумма меньше 0");
    } else {
      this._balance -= amount;
      targetAccount.deposit(amount);
    }
  }
}

void main() {
  BankAccount account1 = BankAccount(1000.0, "123456");
  BankAccount account2 = BankAccount(500.0, "654321");

  account1.deposit(200.0);
  print(
      "Баланс account1: ${account1.balance}"); // Ожидаемый вывод: Баланс account1: 1200.0

  account1.withdraw(300.0);
  print(
      "Баланс account1: ${account1.balance}"); // Ожидаемый вывод: Баланс account1: 900.0

  account1.transfer(account2, 400.0);
  print(
      "Баланс account1: ${account1.balance}"); // Ожидаемый вывод: Баланс account1: 500.0
  print(
      "Баланс account2: ${account2.balance}"); // Ожидаемый вывод: Баланс account2: 900.0

  account1.withdraw(600.0); // Ожидаемый вывод: Недостаточно средств на счете.
}
