void main() {
  const text = "I don't know what to say but resort to endless inner monologue. "
      "Maybe that's why I'm accepted as an introverted person.";

  // Challenge 1
  final set = dealWithText(text);
  print(set);

  // Challenge 2
  final codePointSet = text.runes.toSet();
  final map = countCharacters(codePointSet, text)
      .map((key, value) => MapEntry(String.fromCharCode(key), value));
  print(map);

  // Challenge 3
  final userList = [User(1, 'Yojer'), User(2, 'Amy'), User(3, 'Bob')];
  print(convertUserListToMap(userList));
}

/// write a function that takes a paragraph of text and returns a collection of unique
/// `String` characters that the text contains.
Set<String> dealWithText(String text) {
  return text.runes.map((e) => String.fromCharCode(e)).toSet();
}

/// Repeat Challenge 1, but this time have the function return a collection that
/// contains the frequency, or count, of every unique character.
Map<int, int> countCharacters(Set<int> codePointSet, String text) {
  final map = <int, int>{};
  for (var element in codePointSet) {
    map[element] = 0;
  }
  final codePointList = text.runes;
  codePointList.forEach((element) => map[element] = map[element]! + 1);
  return map;
}

/// Create a class called `User` with properties for `id` and `name`. Make a `List`
/// with three users, specifying any appropriate names and IDs you like. Then write
/// a function that converts your user list to a list of maps whose keys are
/// `id` and `name`.
Map<int, String> convertUserListToMap(List<User> userList) {
  final userMap = <int, String>{};
  userList.forEach((user) => userMap[user.id] = user.name);
  return userMap;
}

class User {
  final int id;
  final String name;

  User(this.id, this.name);
}