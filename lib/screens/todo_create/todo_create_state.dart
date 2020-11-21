import 'package:flutter_architecture/libs/locator.dart';
import 'package:flutter_architecture/models/todo.dart';
import 'package:flutter_architecture/repositories/todo_repository.dart';
import 'package:flutter_architecture/screens/base_state.dart';

class TodoCreateState extends BaseState {
  final TodoRepository _todoRepo = locator<TodoRepository>();
  String _body = '';

  void onBodyChanged(String value) {
    _body = value;
    notifyListeners();
  }

  Future<void> onSubmit() async {
    final Todo todo = Todo(
      body: _body,
      createdAt: DateTime.now(),
    );
    await _todoRepo.create(todo);
    appRoute.pop();
  }
}
