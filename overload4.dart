//Реализуйте класс Time, представляющий время в формате часы:минуты:секунды.
// Перегрузите операторы + и - для выполнения арифметических операций со временем.

class Time {
  int hours;
  int minutes;
  int seconds;

  Time(this.hours, this.minutes, this.seconds) {
    _normal();
  }

  void _normal() {
    if (seconds >= 60) {
      minutes += seconds ~/ 60;
      seconds = seconds % 60;
    }
    if (minutes >= 60) {
      hours += minutes ~/ 60;
      minutes = minutes % 60;
    }
    if (hours >= 24) {
      hours = hours % 24;
    }
  }

  Time operator +(Time other) {
    return Time(
        hours + other.hours, minutes + other.minutes, seconds + other.seconds)
      .._normal();
  }

  Time operator -(Time other) {
    int totalSeconds = (hours * 3600 + minutes * 60 + seconds) -
        (other.hours * 3600 + other.minutes * 60 + other.seconds);

    // Приводим к положительному значению
    totalSeconds = totalSeconds < 0 ? 0 : totalSeconds;

    return Time(
      totalSeconds ~/ 3600,
      (totalSeconds % 3600) ~/ 60,
      totalSeconds % 60,
    );
  }

  @override
  String toString() {
    return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }
}
