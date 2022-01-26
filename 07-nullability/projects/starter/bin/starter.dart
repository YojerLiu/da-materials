import 'dart:math';

/// Write a function that randomly returns 42 or `null`. Assign the return value of
/// the function to a variable named result that will never be `null`. Give `result`
/// a default of 0 if the function returns `null`.
void main() {
  // This is for challenge 1.
  final int? result;
  result = generateRandom() ?? 0;
  print(result);

 // This is for challenge 2.
  var name = Name(givenName: 'Yojer', surname: 'Liu');
  print(name);
}

int? generateRandom() {
  var random = Random();
  return (random.nextInt(2) == 0) ? 42 : null;
}

class Name {
  String givenName;
  String? surname;
  bool surnameIsFirst;

  Name({required this.givenName, this.surname, this.surnameIsFirst = false});

  @override
  String toString() {
    if(surname == null) {
      return '$givenName';
    } else {
      if(surnameIsFirst) {
        return '$surname $givenName';
      } else {
        return '$givenName $surname';
      }
    }
  }
}