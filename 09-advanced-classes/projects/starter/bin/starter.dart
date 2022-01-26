void main() {
  challenge1();
  challenge3();
}

/// Add a `weight` field to the `Platypus` class you made in this lesson. Then
/// make `Platypus` implement `Comparable` so that when you have list of `Platypus`
/// objects, calling `sort` on the list will sort them by weight.
void challenge1() {
  var list = [
    Platypus(isAlive: true, weight: 100, name: 'Amy'),
    Platypus(isAlive: true, weight: 200, name: 'Bob'),
    Platypus(isAlive: false, weight: 50, name: 'Cindy')
  ];
  list.sort();
  print(list);
}

/// Dart has a `Duration` class for expressing lengths of time. Make an extension
/// on `int` so that you can express a duration like so:
/// ```
/// final timeRemaining = 3.minutes;
/// ```
void challenge3() {
  print(3.minutes);
}

abstract class Animals {
  bool isAlive = true;

  void eat();

  void move();

  @override
  String toString() {
    return "I'm a $runtimeType.";
  }
}

class Platypus implements Animals, Comparable<Platypus> {
  @override
  bool isAlive;
  int weight;
  String? name;

  Platypus({this.isAlive = true, this.weight = 0, this.name});

  @override
  void eat() {
    print('Munch munch munch...');
  }

  @override
  void move() {
    print('Glide glide...');
  }

  @override
  int compareTo(Platypus other) => weight - other.weight;

  @override
  String toString() {
    return '$isAlive $weight $name';
  }
}

extension on int {
  Duration get minutes => Duration(minutes: this);
}
