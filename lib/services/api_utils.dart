import 'package:hello_world/models/todo_list.dart';
import 'package:http/http.dart' as http;

const todoEndpoint = "jsonplaceholder.typicode.com";

Future<List<Todo>> getTodos() async {
  var client = http.Client();
  final response = await client.get(Uri.https(todoEndpoint, '/posts'));

  if (response.statusCode == 200) {
    return todoListFromJson(response.body);
  } else {
    throw Exception('Failed to load todos');
  }
}
