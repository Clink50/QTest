import 'package:flutter/material.dart';
import 'package:hello_world/models/todo_list.dart';
import 'package:hello_world/services/api_utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Todo>> todos;

  @override
  void initState() {
    super.initState();
    todos = getTodos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Home"),
          actions: [
            IconButton(
                onPressed: () {
                  setState(() {
                    todos = getTodos();
                  });
                },
                icon: const Icon(Icons.refresh)),
            IconButton(
                onPressed: () {
                  debugPrint("h");
                },
                icon: const Icon(Icons.settings))
          ],
        ),
        body: FutureBuilder(
            future: todos,
            builder: (_, snapshot) {
              if (snapshot.hasData) {
                var todos = snapshot.data!;
                return ListView.builder(
                    itemCount: todos.length,
                    itemBuilder: (_, index) {
                      var todo = todos[index];
                      return Text(todo.title);
                    });
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return const Center(child: CircularProgressIndicator());
            }));
  }
}
