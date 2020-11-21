import 'package:flutter_architecture/models/todo.dart';

class TodoRepository {
  final List<Todo> _todos = <Todo>[];

  Future<List<Todo>> getList() async {
    return _todos;
  }

  Future<void> create(Todo todo) async {
    _todos.add(todo);
  }
}
