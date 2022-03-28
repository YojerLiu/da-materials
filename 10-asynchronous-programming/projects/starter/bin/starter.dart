import 'dart:convert';
import 'dart:io';
import 'dart:isolate';

import 'package:http/http.dart' as http;

Future<void> main() async {
  await challenge2();
  await challenge3();
  print('-------------------------');
  await challenge4();
}

Future<void> challenge2() async {
  const url = 'https://jsonplaceholder.typicode.com/comments';
  final parseUrl = Uri.parse(url);
  final commentList = <Comment>[];
  try {
    final response = await http.get(parseUrl);
    final statusCode = response.statusCode;
    if (statusCode == 200) {
      final rawJsonString = response.body;
      final jsonList = jsonDecode(rawJsonString);
      for (var element in jsonList) {
        final comment = Comment.fromJson(element);
        print(comment);
        commentList.add(comment);
      }
    } else {
      throw HttpException('$statusCode');
    }
  } on SocketException catch (error) {
    // You'll get this exception if there is no internet connection.
    print(error);
  } on HttpException catch (error) {
    // You're throwing this exception yourself if the status code is not 200.
    print(error);
  } on FormatException catch (error) {
    // jsonDecode throws this exception if the JSON string from the server isn't
    // in proper JSON format.
    print(error);
  }
  print('The length of comment list is: ${commentList.length}');
  print('-----------------------------------------------------');
}

Future<void> challenge3() async {
  final url = Uri.parse('https://raywenderlich.com');
  final client = http.Client();
  try {
    final request = http.Request('GET', url);
    final response = await client.send(request);
    final stream = response.stream;
    await for (var data in stream.transform(utf8.decoder)) {
      print(data.length);
    }
  } on Exception catch (error) {
    print(error);
  } finally {
    client.close();
  }
}

Future<void> challenge4() async {
  final receivePort = ReceivePort();
  final map = {'sendPort': receivePort.sendPort, 'n': 10};
  final isolate = await Isolate.spawn(fibonacci, map);
  receivePort.listen((message) {
    print(message);
    receivePort.close();
    isolate.kill();
  });
}

void fibonacci(Map<String, Object> map) {
  final sendPort = map['sendPort'] as SendPort;
  final n = map['n'] as int;
  sendPort.send('The n-th value is ${calculateFibonacci(n)}.');
}

int calculateFibonacci(int n) {
  if(n < 2) {
    return 1;
  }
  final list = [1, 1];
  for(var i = 2; i < n; i++) {
    list.add(0);
    list[i] = list[i - 1] + list[i - 2];
  }
  return list[n - 1];
}

class Comment {
  int postId;
  int id;
  String name;
  String email;
  String body;

  Comment(
      {required this.postId,
      required this.id,
      required this.name,
      required this.email,
      required this.body});

  factory Comment.fromJson(Map<String, Object?> jsonMap) {
    return Comment(
        postId: jsonMap['postId'] as int,
        id: jsonMap['id'] as int,
        name: jsonMap['name'] as String,
        email: jsonMap['email'] as String,
        body: jsonMap['body'] as String);
  }

  @override
  String toString() {
    return 'postId: $postId\nid: $id\nname: $name\nemail: $email\nbody: $body'
        '\n---------------------';
  }
}
