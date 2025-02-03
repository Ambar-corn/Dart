class BankAccount {
  int _balance = 3000;

  int get money => _balance;

  void deposit(int rub) {
    if (rub > 0) {
      _balance += rub;
    } else {
      print("Сумма пополнения должна быть больше 0.");
    }
  }

  void withdraw(int rub) {
    if (rub > 0 && _balance >= rub) {
      _balance -= rub;
    } else if (rub <= 0) {
      print("Сумма снятия должна быть больше 0.");
    } else {
      print("Недостаточно средств!");
    }
  }
}

void main(List<String> arguments) {
  var bank = BankAccount();
  print(bank.money);
  bank.deposit(200);
  print(bank.money);
  bank.withdraw(700);
  print(bank.money);
  bank.withdraw(5000);
}
