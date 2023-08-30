import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hello_world/models/todo_list.dart';
import 'package:hello_world/services/api_utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Todo>> _todos;

  Future<List<Todo>> _fetchTodos() async {
    var result = await getTodos();
    return result;
  }

  @override
  void initState() {
    super.initState();
    _todos = _fetchTodos();
  }

  @override
  Widget build(BuildContext context) {
    log('building');
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                _todos = _fetchTodos();
              });
            },
            icon: const Icon(Icons.refresh),
          ),
          IconButton(
            onPressed: () {
              debugPrint("h");
            },
            icon: const Icon(Icons.settings),
          )
        ],
      ),
      body: FutureBuilder(
        future: _todos,
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }

          if (snapshot.data!.isEmpty) {
            return const Center(child: Text('No todos to show.'));
          }

          var todos = snapshot.data!;
          return ListView.builder(
            itemCount: todos.length,
            itemBuilder: (_, index) {
              var todo = todos[index];
              return Text(todo.title);
            },
          );
        },
      ),
    );
  }
}
