import 'dart:convert';

import 'package:hello_world/models/todo_list.dart';
import 'package:http/http.dart' as http;

const todoEndpoint = "jsonplaceholder.typicode.com";

Future<List<Todo>> getTodos() async {
  var client = http.Client();
  final response = await client.get(Uri.https(todoEndpoint, '/todos'));

  if (response.statusCode == 200) {
    var result = List<Todo>.from(
      json.decode(response.body).map(
            (todo) => Todo.fromJson(todo),
          ),
    );

    await Future.delayed(const Duration(seconds: 2));

    return result;
  } else {
    throw Exception('Failed to load todos');
  }
}
