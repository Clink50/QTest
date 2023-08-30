import 'dart:convert';

List<Todo> todoListFromJson(String str) => List<Todo>.from(
    json.decode(str).map((response) => Todo.fromJson(response)));

class Todo {
  int userId;
  int id;
  String title;
  bool? completed;

  Todo({
    required this.userId,
    required this.id,
    required this.title,
    this.completed,
  });

  factory Todo.fromJson(Map<String, dynamic> json) => Todo(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        completed: json["completed"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "completed": completed,
      };
}
