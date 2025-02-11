//Создайте класс Date, который будет представлять дату (год, месяц и день)
// и перегружать операторы для сравнения дат.

class Date {
  int year;
  int month;
  int day;

  Date(this.year, this.month, this.day);

  @override
  bool operator ==(Object other) {
    if (other is! Date) {
      return false;
    }
    return year == other.year && month == other.month && day == other.day;
  }

  @override
  int get hashCode => year.hashCode + month.hashCode + day.hashCode;

  bool operator <(Date other) {
    if (year != other.year) {
      return year < other.year;
    }
    if (month != other.month) {
      return month < other.month;
    }
    return day < other.day;
  }

  bool operator <=(Date other) => this < other || this == other;

  bool operator >(Date other) {
    //code
    if (year != other.year) {
      return year > other.year;
    }
    if (month != other.month) {
      return month > other.month;
    }
    return day > other.day;
  }

  bool operator >=(Date other) => this > other || this == other;
}
