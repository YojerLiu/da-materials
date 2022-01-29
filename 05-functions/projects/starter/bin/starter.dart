import 'dart:math';

void main() {
  challenge1();
  challenge2();
}

/// Write a function that checks if a number is prime.
void challenge1() {
  final list = [144, 125, 13, 98, 37];
  list.forEach((element) => print('Is $element prime? ${isPrime(element)}'));
}

/// Write a function named `repeatTask` with the following definition:
/// ```
/// int repeatTask(int times, int input, Function task)
/// ```
/// It repeats a given `task` on `input` for `times` number of times.
void challenge2() {
  final list = [1, 2, 3];
  list.forEach((element) {
    print(repeatTask(4, element, (int number) => number * number));
  });
}

bool isPrime(int number) {
  if (number == 1 || number == 2) {
    return false;
  }
  final root = sqrt(number);
  for (var i = 3; i <= root; i++) {
    if (number % i == 0) {
      return false;
    }
  }
  return true;
}

int repeatTask(int times, int input, Function task) {
  var result = 0;
  for (var i = 0; i < times; i++) {
    result = task(input);
    input = result;
  }
  return result;
}