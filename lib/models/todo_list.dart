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

  Todo copyWith({
    int? userId,
    int? id,
    String? title,
    bool? completed,
  }) {
    return Todo(
      userId: userId ?? this.userId,
      id: id ?? this.id,
      title: title ?? this.title,
      completed: completed ?? this.completed,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'id': id,
      'title': title,
      'completed': completed,
    };
  }

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      userId: json['userId'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
      completed: json['completed'] as bool?,
    );
  }

  @override
  String toString() =>
      "Todo(userId: $userId, id: $id, title: $title, completed: $completed)";

  @override
  int get hashCode => Object.hash(userId, id, title, completed);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Todo &&
          runtimeType == other.runtimeType &&
          userId == other.userId &&
          id == other.id &&
          title == other.title &&
          completed == other.completed;
}
